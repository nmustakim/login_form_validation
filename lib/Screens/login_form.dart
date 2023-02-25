import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String email = 'sophat.leat@nintrea.live';
  String password = '';
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 58),
                    width: 144,
                    height: 139,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 34, 34, 52),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: GoogleFonts.gochiHand().fontFamily,
                            fontSize: 44.56,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFFB6158A)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Hi, Welcome Back! 👋',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF000000)),
                ),
                Text(
                  'Hello again, you’ve been missed!',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF999EA1)),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF00004D)),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                    height: 41,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          return 'Email is invalid';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        email = value ?? '';
                      },
                    )),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF00004D)),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                    height: 41,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Please Enter Your Password',
                          suffixIcon: Image.asset('assets/images/show.png'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(password)) {
                          return 'Invalid password';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        password = value ?? '';
                      },
                    )),
                const SizedBox(
                  height: 17,
                ),
                Row(
/*If I use the gap between 'remember me' and 'forgot password' as the figma design ,
the screen overflows to the right that's why I've used row inside row
and set the main axis alignment to spacebetween.
 */
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 6, 5, 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          height: 20,
                          width: 20,
                          child: Checkbox(
                              value: isChecked,
                              checkColor: const Color(0XFF000C14),
                              activeColor: const Color(0XFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFF000000)),
                        ),
                      ],
                    ),
                    Text('Forgot Password',
                        style: TextStyle(
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFFB344F))),
                  ],
                ),
                const SizedBox(
                  height: 125,
                ),
                SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0XFF351A96)),
                        onPressed: () {
                          _loginFormKey.currentState!.save();
                          _loginFormKey.currentState!.validate();
                        },
                        child: const Center(child: Text('Login')))),
                const SizedBox(
                  height: 195,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () => null,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Color(0XFF160062)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
