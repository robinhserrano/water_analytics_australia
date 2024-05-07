import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';
import 'package:water_analytics_australia/2_application/pages/login/bloc/login_cubit.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/core/widgets/loading_modal.dart';
import 'package:water_analytics_australia/injection.dart';

class LoginPageWrapperProvider extends StatelessWidget {
  const LoginPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const name = 'login';
  static const path = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool isEmailValidating = false;
  bool isPasswordValidating = false;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginStateLoading) {
            customLoadingModal(context, 'Logging you in...');
          } else if (state is LoginStateError) {
            context.pop();
            const snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text('Incorrect Email or Password'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is LoginStateSuccess) {
            context
              ..pop()
              ..pushReplacementNamed(HomePage.name);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextField(
                ctrl: emailCtrl,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      isEmailValidating = true;
                    }
                  });
                },
                title: 'Email',
                isValidating: isEmailValidating,
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                ctrl: passwordCtrl,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      isPasswordValidating = true;
                    }
                  });
                },
                title: 'Password',
                isValidating: isPasswordValidating,
                inputType: TextInputType.visiblePassword,
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSubmitting
                      ? null
                      : () async {
                          await cubit.login(
                            'wateranalytics',
                            emailCtrl.text,
                            passwordCtrl.text,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff475467),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
