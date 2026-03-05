import 'package:evently_app/utiles/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utiles/app_assets.dart';
class LogInWithGoogleScreen extends StatefulWidget {
  const LogInWithGoogleScreen({super.key});

  @override
  State<LogInWithGoogleScreen> createState() => _SignInWithGoogleScreenState();
}

class _SignInWithGoogleScreenState extends State<LogInWithGoogleScreen> {
  late TextEditingController passController ;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    passController= TextEditingController();
    emailController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 70,
        centerTitle: true,
        title: Image.asset(AppAssets.logoImage,),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal:width * 0.02 ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Text('Log in With Your Google Account' ,style: Theme.of(context).textTheme.labelLarge,),
            SizedBox(height: height * 0.03,),
            Form(
              key:formKey ,
              child: Column(
                children: [
                  TextFormField(
                      decoration:InputDecoration(
                        hintText: AppLocalizations.of(context)!.enter_your_email,
                        prefixIcon: Icon(Icons.email),
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text){
                        final RegExp emailRegex =
                        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if(text == null || text.trim().isEmpty){
                          return 'Email is required';
                        }else if(!emailRegex.hasMatch(text)){
                          return 'Enter a valid email';
                        }
                        else {
                          return null;
                        }
                      }

                  ),
                  SizedBox(height: height * 0.02,),
                  TextFormField(
                    decoration:InputDecoration(
                        hintText: AppLocalizations.of(context)!.enter_your_pass,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye)
                    ),
                    controller: passController,
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Password is required';
                      }else if(text.length <7){
                        return 'Password must be at least 8 characters';
                      }
                      else {
                        return null;
                      }
                    },

                  ),
                  SizedBox(height: height * 0.03,),
                  ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){


                          Navigator.pushReplacementNamed(context, AppRoutes.routeScreenRouteName);
                        }
                      },
                      child:  Text(AppLocalizations.of(context)!.signup)),
                  SizedBox(height: height* 0.03,),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(AppLocalizations.of(context)!.dont_have_account,style: Theme.of(context).textTheme.headlineMedium,),
                      SizedBox(width: width* 0.01,),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop(AppRoutes.signinScreengoogleRouteName);
                          },
                          child: Text(AppLocalizations.of(context)!.signup,style: Theme.of(context).textTheme.bodySmall)),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
