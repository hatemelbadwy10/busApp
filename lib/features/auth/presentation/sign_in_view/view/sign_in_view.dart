import 'dart:developer';

import 'package:busapp/constants.dart';
import 'package:busapp/core/utils/extentions.dart';
import 'package:busapp/core/utils/styles.dart';
import 'package:busapp/core/widgets/custom_app_button.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/manger/sign_in_cubit_bloc.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/manger/sign_in_cubit_state.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/view/sign_up_view.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/widgets/auth_text_field.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/widgets/have_account_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubitBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(smallLogo),
                          const Gap(5),
                          const Text(
                            'My Bus',
                            style: Styles.textStyle18,
                          )
                        ],
                      ),
                      const Gap(30),
                      const Text(
                        'Sign in to your \nAccount',
                        style: Styles.textStyle30,
                      ),
                      const Gap(12),
                      const Text(
                        'Enter your email and password to log in ',
                        style: Styles.textStyle12,
                      ),
                      const Gap(32),
                      const Text(
                        'Email',
                        style: Styles.textStyle12,
                      ),
                      const Gap(5),
                      AuthTextField(
                        textEditingController: emailController,
                        hint: 'Enter your Email',
                        validator: (value) {
                          log('value $value');
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return '';
                        },
                      ),
                      const Gap(12),
                      const Text(
                        'Password',
                        style: Styles.textStyle12,
                      ),
                      BlocBuilder<SignInCubitBloc, SignInCubitState>(
                        builder: (context, state) {
                          bool isPasswordObscured = true;

                          if (state is ObsucureTextChanged) {
                            isPasswordObscured = state.isObscured;
                          }

                          return AuthTextField(
                            textEditingController: passwordController,
                            hint: 'Enter your Password',
                            obscureText: isPasswordObscured,
                            onTap: () {
                              context
                                  .read<SignInCubitBloc>()
                                  .togglePasswordVisibility();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return '';
                            },
                            icon: isPasswordObscured
                                ? Icons.remove_red_eye_sharp
                                : Icons.visibility_off,
                          );
                        },
                      ),
                      const Gap(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget Password?',
                            style: Styles.textStyle14
                                .copyWith(color: primaryColor),
                          ),
                        ),
                      ),
                      const Gap(24),
                      CustomAppButton(
                          onPressed: () {
                            log('button clicked');
                            if (_formKey.currentState!.validate()) {
                              // Process data

                            } else {

                            }
                          },
                          buttonText: 'Sign in'),
                      const Gap(24),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Colors.grey,
                              height: 10,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('OR', style: Styles.textStyle12),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Colors.grey,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      CustomAppButton(
                        onPressed: () {},
                        iconData: SvgPicture.asset(googleIcon),
                        buttonText: 'complete with google',
                        bgColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      const Gap(15),
                      CustomAppButton(
                        onPressed: () {},
                        iconData: SvgPicture.asset(facebookIcon),
                        buttonText: 'complete with Facebook',
                        bgColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      const Gap(10),
                      HaveAccountCheck(
                          checkText: 'Dont have account?',
                          actionText: ('Sign Up'),
                          onTap: () {
                            context.push(const SignUpView());
                          })
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
