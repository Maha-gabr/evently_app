import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
class AuthService {
  // إنشاء نسخة واحدة ثابتة
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserCredential?> signInWithGoogle() async {

      // 1. تسجيل الخروج من جوجل أولاً لضمان ظهور قائمة اختيار الحسابات دائماً
      // هذا يحل مشكلة تعليق الحساب القديم
      await _googleSignIn.signOut();
      // 2. فتح واجهة اختيار حساب جوجل
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // 3. إذا قام المستخدم بإغلاق النافذة دون اختيار حساب
      if (googleUser == null) {
        debugPrint('Sign-in cancelled by user');
        return null;
      }

      // 4. الحصول على التوكنز (Tokens)
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 5. إنشاء اعتماد Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 6. تسجيل الدخول النهائي في Firebase
       final fireAuth= await FirebaseAuth.instance.signInWithCredential(credential);
    return fireAuth;


  }

  // دالة تسجيل الخروج الكامل
  static Future<void> logOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
