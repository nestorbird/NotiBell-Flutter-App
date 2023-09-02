import 'package:apprize_mobile_app/screens/approval_details_screen/provider/approval_details_provider.dart';
import 'package:apprize_mobile_app/screens/approvals_list_screen/provider/approval_list_provider.dart';
import 'package:apprize_mobile_app/screens/completed_approvals_screen/provider/completed_approvals_provider.dart';
import 'package:apprize_mobile_app/screens/home_screen/provider/home_screen_provider.dart';
import 'package:apprize_mobile_app/screens/login_screen/provider/login_provider.dart';
import 'package:apprize_mobile_app/screens/splash_screen/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
    ChangeNotifierProvider(create: (_) => ApprovalListProvider()),
    ChangeNotifierProvider(create: (_) => ApprovalDetailsProvider()),
    ChangeNotifierProvider(create: (_) => CompletedApprovalsListProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotiBell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.manropeTextTheme()),
      home: const SplashScreen(),
    );
  }
}
