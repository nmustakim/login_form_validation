import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String email = '';
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
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      initialValue: 'sophat.leat@nintrea.live',
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(13, 10, 0, 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          return 'Email is invalid';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? value) {
                        email = value ?? '';
                      },
                    ),
                  ),
                ),
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
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(13, 10, 0, 12),
                          labelText: 'Please Enter Your Password',
                          suffixIcon: Image.asset('assets/images/show.png'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (!RegExp(
                                r'^().{8,}$')
                            .hasMatch(password)) {
                          return 'At least 8 char needed';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? value) {
                        password = value ?? '';
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
/*If I use the gap between 'remember me' and 'forgot password' as the figma design ,
the screen overflows to the right that's why I've used row inside row
and set the main axis alignment to spaceBetween.
 */
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0XFFCDD1E0)),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          height: 20,
                          width: 20,
                          child: 
                          Checkbox(
                              value: isChecked,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              checkColor: const Color(0XFF000C14),
                              activeColor: const Color(0XFFFFFFFF),
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
                          'Remember Me',
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
                          if(_loginFormKey.currentState!.validate() == true){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login successful')));
                          }
                        },
                        child: const Center(child: Text('Login')))),
                const SizedBox(
                  height: 195,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Don\'t have an account?'),
                    SizedBox(width: 9,),
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0XFF160062)),
                    )
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
