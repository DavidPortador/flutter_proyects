import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:socialtec/components/footer_account_acheck.dart';
import 'package:socialtec/settings/theme_config.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  showAlertDialog(BuildContext context, String title, String content) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();

    final btnGoogle = SocialLoginButton(
        borderRadius: 50,
        buttonType: SocialLoginButtonType.google,
        onPressed: () {});

    final btnFacebook = SocialLoginButton(
        borderRadius: 50,
        buttonType: SocialLoginButtonType.facebook,
        onPressed: () {});

    final btnGithub = SocialLoginButton(
        borderRadius: 50,
        buttonType: SocialLoginButtonType.github,
        onPressed: () {});

    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding / 2),
          Text(
            "Sing In",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: email,
              style: TextStyle(color: Colors.black87),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              //cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_circle_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: pass,
              style: TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.done,
              obscureText: true,
              //cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton.icon(
              icon: Icon(Icons.login),
              onPressed: () {
                var em = email.text;
                var ps = pass.text;
                if (em == "") {
                  showAlertDialog(
                      context, 'Empty field', 'Complete Email field');
                } else if (ps == "") {
                  showAlertDialog(
                      context, 'Empty field', 'Complete Password field');
                } else {
                  if (isEmail(em)) {
                    //showAlertDialog(context, 'Login Success', 'Email correct and password accepted');
                    //setState(() {});
                    //Future.delayed(Duration(milliseconds: 1000)).then((value) {
                      //setState(() {});
                      //Navigator.pushNamed(context, '/theme');
                    //});
                    Navigator.pushNamed(context, '/dashboard');
                  } else {
                    showAlertDialog(
                        context, 'Incorrect email', 'Incorrect Email format');
                  }
                }
              },
              label: Text(
                "Login",
              ),
            ),
          ),

          const SizedBox(height: defaultPadding),
          Text('Sign in with', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: defaultPadding / 2),
          
          // La dvd se ven feos :c
          // btnFacebook,
          // const SizedBox(height: defaultPadding / 2),
          // btnGithub,
          // const SizedBox(height: defaultPadding / 2),
          // btnGoogle,
          
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text('Facebook'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    //onPrimary: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
              Expanded(child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.hvac_outlined),
                  label: const Text('Spotify'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    //onPrimary: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
            ],
          ),


          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
