import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music/ui/app.dart';
import 'package:music/ui/screens/auth/login.dart';
import 'package:easy_localization/easy_localization.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.49,
                color: Theme.of(context).accentColor.withOpacity(.8),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        //dummy image
                        imageUrl: 'https://images.unsplash.com/photo-1526413138270-8e3dedaecf19?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80',
                      ),
                    ),
                    Container(
                      color: Theme.of(context).accentColor.withOpacity(.34),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Create a free account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1.color),
                      ).tr()
                    ),
                    FormTextField(
                      controller: _nameController,
                      hint: 'Full name',
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                    FormTextField(
                      controller: _emailController,
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                    ),
                    FormTextField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscureText: true,
                      maxLines: 1,
                    ),
                    buildSubmit(),
                    buildLoginLink()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  ///Widgets
  Widget buildSubmit() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        width: double.infinity,
        child: CupertinoButton(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            'Sign Up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ).tr(),
          color: Theme.of(context).textTheme.bodyText1.color,
          onPressed: () => Get.off(App(), id: 5),
        ),
      ),
    );
  }

  Widget buildLoginLink() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Do you have an account?",
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                )).tr(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  Get.off(Login(), id: 5);
                },
                child: Text("Sign In",
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class FormTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final FocusNode focusNode;
  final FormFieldValidator validator;
  final bool obscureText;

  const FormTextField(
      {Key key,
        this.hint,
        this.controller,
        this.keyboardType,
        this.maxLines = 1,
        this.focusNode,
        this.validator,
        this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        validator: validator,
        decoration: InputDecoration(
          labelText: tr(hint),
          alignLabelWithHint: true,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.15))),
          labelStyle: TextStyle(
              fontSize: 12,
              color:
              Theme.of(context).textTheme.bodyText1.color.withOpacity(.35)),
        ),
      ),
    );
  }
}
