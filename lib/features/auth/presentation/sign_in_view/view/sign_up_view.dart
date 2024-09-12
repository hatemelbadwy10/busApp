import 'package:busapp/core/utils/extentions.dart';
import 'package:busapp/core/widgets/custom_app_button.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/widgets/have_account_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:busapp/core/utils/styles.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/widgets/auth_text_field.dart';

import '../manger/sign_in_cubit_bloc.dart';
import '../manger/sign_in_cubit_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubitBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Gap(32),
                    const Text(
                      'Sign up',
                      style: Styles.textStyle30,
                    ),
                    const Gap(12),
                    const Text(
                      'Create an account to continue!',
                      style: Styles.textStyle12,
                    ),
                    const Gap(32),
                    const Text(
                      'Full name',
                      style: Styles.textStyle12,
                    ),
                    AuthTextField(
                      hint: 'Enter Full Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                    const Text(
                      'Email',
                      style: Styles.textStyle12,
                    ),
                    AuthTextField(
                      hint: 'Enter your Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return '';
                      },
                    ),
                    const Gap(16),
                    const Text(
                      'Birth Date',
                      style: Styles.textStyle12,
                    ),
                    AuthTextField(
                      icon: Icons.date_range,
                      textEditingController: _date,
                      hint: 'Birth Date',
                      readOnly: true,
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          final String formattedDate =
                              "${pickedDate.toLocal()}".split(' ')[0];
                          _date.text = formattedDate;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a birth date';
                        }

                        // Parse the selected date
                        final DateTime birthDate = DateTime.parse(value);
                        final DateTime today = DateTime.now();
                        final int age = today.year - birthDate.year;

                        // Check if the user is younger than 18 years
                        if (age < 18 ||
                            (age == 18 &&
                                today.isBefore(birthDate
                                    .add(Duration(days: age * 365))))) {
                          return 'You must be at least 18 years old';
                        }

                        return null; // If validation passes
                      },
                    ),
                    const Gap(16),
                    const Text(
                      'set Password',
                      style: Styles.textStyle12,
                    ),
                    BlocBuilder<SignInCubitBloc, SignInCubitState>(
                      builder: (context, state) {
                        bool isPasswordObscured = true;

                        if (state is ObsucureTextChanged) {
                          isPasswordObscured = state.isObscured;
                        }

                        return AuthTextField(
                          hint: 'Enter your Password',
                          obscureText: isPasswordObscured,
                          onTap: () {
                            context
                                .read<SignInCubitBloc>()
                                .togglePasswordVisibility();
                          },
                          icon: isPasswordObscured
                              ? Icons.remove_red_eye_sharp
                              : Icons.visibility_off,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return '';
                          },
                        );
                      },
                    ),
                    const Gap(24),
                    CustomAppButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                          } else {}
                        },
                        buttonText: 'Register '),
                    const Gap(16),
                    HaveAccountCheck(
                        checkText: "Already have account?",
                        actionText: 'Sign In',
                        onTap: () {
                          context.pop();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
