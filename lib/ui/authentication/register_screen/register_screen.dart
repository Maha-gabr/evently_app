import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/user.dart';
import 'package:evently_app/ui/authentication/google_signin_logic.dart';
import 'package:evently_app/utiles/app_assets.dart';
import 'package:evently_app/utiles/app_dialog.dart';
import 'package:evently_app/utiles/app_routes.dart';
import 'package:evently_app/utiles/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/userProvider.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
  late TextEditingController passController ;
  late TextEditingController emailController ;
  late TextEditingController nameController ;

  @override
  void initState() {
    super.initState();
    passController =TextEditingController();
    emailController =TextEditingController();
    nameController = TextEditingController();

  }
  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 70,
        centerTitle: true,
        title: Image.asset(AppAssets.logoImage,),
      ),
      body: Padding(
        padding:EdgeInsetsGeometry.symmetric(horizontal: context.width * 0.04,vertical: context.height *0.03),
        child: Form(
          key:formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(AppLocalizations.of(context)!.create_your_account,style: Theme.of(context).textTheme.labelLarge,),
                SizedBox(height: context.height * 0.03,),
                TextFormField(
                  decoration:InputDecoration(
                      hintText: AppLocalizations.of(context)!.enter_your_name,
                      prefixIcon: Icon(Icons.person)
                  ),
                  controller: nameController,
                  validator: (text){
                    if(text == null || text.trim().isEmpty){
                      return 'Name is required';
                    }else if(text.length <8){
                      return 'name must be at least 8 characters';
                    }
                    else {
                      return null;
                    }
                  },

                ),
                SizedBox(height: context.height * 0.02,),
                //email
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
                SizedBox(height: context.height * 0.02,),
                ///pass
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
                SizedBox(height: context.height * 0.02,),
                //confirm pass
                TextFormField(
                  decoration:InputDecoration(
                      hintText: AppLocalizations.of(context)!.confirm_your_pass,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye)
                  ),
                  validator: (text){
                    if(text == null || text.trim().isEmpty){
                      return 'Password is required';
                    }else if(text.length <7){
                      return 'Password must be at least 8 characters';
                    }else if(text != passController.text){
                      return 'Passwords do not match';
                    }
                    else {
                      return null;
                    }
                  },

                ),
                SizedBox(height: context.height * 0.02,),
                SizedBox(height: context.height * 0.03,),
                ElevatedButton(
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        AppDialog.showLoading(context: context);
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text,
                          );
                          // add user to fire auth
                          MyUser myUser = MyUser(
                              name: nameController.text,
                              email: emailController.text,
                              id: credential.user!.uid);
                         // add user to fire store
                         await FirebaseUtils.addUsersToFireStore(myUser);
                          // add user to provider
                        final Userprovider userProvider= Provider.of<Userprovider>(context,listen: false);
                        userProvider.updateUser(myUser);
                        AppDialog.hideLoading(context: context);
                          AppDialog.showMessage(
                              context: context,
                              message: 'Sign up Successfully',
                              title:'success',
                              posActionName:AppLocalizations.of(context)!.signup
                              ,positiveAction: (){
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacementNamed(AppRoutes.routeScreenRouteName);
                          })          ;
                          //  AppToast.appToast(text: "Registered Successfully");
                          //Navigator.of(context).pushReplacementNamed(AppRoutes.routeScreenRouteName);
                          //print('🚩🚩🚩added');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            AppDialog.hideLoading(context: context);
                            AppDialog.showMessage(
                                context: context,
                                message: 'weak-password',
                                title:'Error',
                                negActionName:'Try Again'
                                ,negativeAction: (){
                              Navigator.pop(context);
                            });
                            //print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            AppDialog.hideLoading(context: context);
                            AppDialog.showMessage(
                                context: context,
                                message: 'Email already In Use',
                                title:'Error',
                                negActionName:'Try Again'
                                ,negativeAction: (){
                              Navigator.pop(context);
                            });                          }
                        } catch (e) {
                          AppDialog.hideLoading(context: context);
                          AppDialog.showMessage(
                              context: context,
                              message: e.toString(),
                              title:'Error',
                              negActionName:'Try Again'
                              ,negativeAction: (){
                            Navigator.pop(context);
                          });                        }

                      }
                    },
                    child: Text(AppLocalizations.of(context)!.signup)
                ),
                SizedBox(height: context.height * 0.03,),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(AppLocalizations.of(context)!.already_have_account,style: Theme.of(context).textTheme.headlineMedium,),
                    SizedBox(width: context.width* 0.01,),
                    GestureDetector(
                        onTap: (){

                        },
                        child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRoutes.loginScreenRouteName);
                            },
                            child: Text(AppLocalizations.of(context)!.login,style: Theme.of(context).textTheme.bodySmall))),
                  ],
                ),
                SizedBox(height: context.height * 0.03,),
                Align(
                    alignment: .center,
                    child: Text(AppLocalizations.of(context)!.or,style: Theme.of(context).textTheme.labelSmall)),
                SizedBox(height: context.height * 0.03,),
                TextButton.icon(
                  onPressed: () async {
                    AppDialog.showLoading(context: context);
                    try {
                      final myUser = await AuthService.signInWithGoogle();
                      if(myUser !=null){
                        MyUser myGoogleUser =MyUser(
                            name: myUser.user?.displayName??'',
                            id: myUser.user?.uid??'',
                            email: myUser.user?.email??'',);
                        await FirebaseUtils.addUsersToFireStore(myGoogleUser);
                        // update user in provider
                        final Userprovider userProvider= Provider.of<Userprovider>(context,listen: false);
                        userProvider.updateUser(myGoogleUser);
                        AppDialog.hideLoading(context: context);
                        AppDialog.showMessage(
                            context: context,
                            message: 'Sign up Successfully',
                            title:'success',
                            posActionName:AppLocalizations.of(context)!.signup
                            ,positiveAction: (){
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacementNamed(AppRoutes.routeScreenRouteName);
                        });
                      }
                    } on Exception catch (e) {
                      AppDialog.hideLoading(context: context);
                      AppDialog.showMessage(
                          context: context,
                          message: e.toString(),
                          title:'Error',
                          negActionName:'Try Again'
                          ,negativeAction: (){
                        Navigator.pop(context);
                      });
                    }

                    //  print("🚩🚩🚩${e.toString()}");
                    }
                ,
                  label: Text(AppLocalizations.of(context)!.signup_with_google),
                  icon: Image.asset(AppAssets.emailIcon,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
