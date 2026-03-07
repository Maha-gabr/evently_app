import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/userProvider.dart';
import 'package:evently_app/utiles/app_assets.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:evently_app/utiles/app_routes.dart';
import 'package:evently_app/utiles/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utiles/firebase_utils.dart';
import '../google_signin_logic.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // final eventProvider = Provider.of<EventProvider>(context);
    // final Userprovider userProvider = Provider.of<Userprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        centerTitle: true,
        title: Image.asset(AppAssets.logoImage,),
      ),
      body: Padding(
        padding:EdgeInsetsGeometry.symmetric(horizontal: context.width * 0.04,vertical: context.height *0.03),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(AppLocalizations.of(context)!.login_to_your,style: Theme.of(context).textTheme.labelLarge,),
                SizedBox(height: context.height * 0.03,),
                TextFormField(
                    decoration:InputDecoration(
                        hintText: AppLocalizations.of(context)!.enter_your_email,
                        prefixIcon: Icon(Icons.email)
                    ),
                    controller: emailController,
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
                SizedBox(height: context.height * 0.03,),
                TextFormField(
                  decoration:InputDecoration(
                    hintText: AppLocalizations.of(context)!.enter_your_pass,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  controller: passController,
                  validator: (text){
                    if(text == null || text.trim().isEmpty){
                      return 'Password is required';
                    }else if(text.length <8){
                      return 'Password must be at least 8 characters';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: context.height * 0.03,),
                Align(
                    alignment: .centerRight,
                    child: Text(AppLocalizations.of(context)!.forget_pass,style: Theme.of(context).textTheme.bodySmall,)),
                SizedBox(height: context.height * 0.03,),
                ElevatedButton(
                    onPressed: ()  async {
                  if(formKey.currentState!.validate()){
                    // sign in user to fire auth
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text
                      );
                      //read user from fireStore and update user provider
                      final Userprovider userProvider= Provider.of<Userprovider>(context,listen: false);
                      await  userProvider.readUser(credential.user?.uid??'');
                      //userProvider.updateUser(userProvider.myUser);

                      //check if user present in firestore
                      if(userProvider.myUser == null){
                        return;
                      }
                      userProvider.updateUser(userProvider.myUser);

                     // print("✔✔✔✔✔✔✔🚩🚩🚩🚩${userProvider.myUser?.id ?? " 🚩🚩🚩🚩 no usser"}");
                      Navigator.of(context).pushReplacementNamed(AppRoutes.routeScreenRouteName);
                      AppToast.appToast(text: "Logged In Successfully",color: AppColors.greenColor);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-credential') {
                        AppToast.appToast(text: 'Email or Password is Not Correct',color: AppColors.redColor);
                      }
                      print("🚩🚩🚩${e.code}");
                    }
                  }
                },
                    child: Text(AppLocalizations.of(context)!.login)
                ),
                SizedBox(height: context.height * 0.04,),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(AppLocalizations.of(context)!.dont_have_account,style: Theme.of(context).textTheme.headlineMedium,),
                    SizedBox(width: context.width* 0.01,),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop(AppRoutes.registerScreenRouteName);
                        },
                        child: Text(AppLocalizations.of(context)!.signup,style: Theme.of(context).textTheme.bodySmall)),
                  ],
                ),
                SizedBox(height: context.height * 0.03,),
                Align(
                    alignment: .center,
                    child: Text(AppLocalizations.of(context)!.or,style: Theme.of(context).textTheme.labelSmall)),
                SizedBox(height: context.height * 0.05,),
                TextButton.icon(
                  onPressed: () async {
                    try {
                      final myUser = await AuthService.signInWithGoogle();
                      if(myUser !=null){
                        final Userprovider userProvider= Provider.of<Userprovider>(context,listen: false);
                       final myGoogleUser = userProvider.myUser;
                        await FirebaseUtils.addUsersToFireStore(myGoogleUser!);
                        Navigator.pushReplacementNamed(context, AppRoutes.routeScreenRouteName);
                      }
                    } on Exception catch (e) {
                      print("🚩🚩🚩${e.toString()}");
                    }
                  },
                  label: Text(AppLocalizations.of(context)!.login_with_google),
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
