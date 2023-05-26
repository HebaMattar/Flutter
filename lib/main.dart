import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderViewModel.dart';
import 'TabPar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderViewModel>(
      create: (context) {
        return ProviderViewModel();
      },
      child: MaterialApp(

        home: SplashScreen(),
        title: 'To Do List',// تعيين صفحة الـ SplashScreen كصفحة افتتاحية
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      // انتظر لمدة ثوانٍ محددة هنا (ثانيتين)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MTabBar()), // انتقل إلى صفحة MTabBar بعد انتهاء الانتظار
      );
    });

    return Scaffold(

      body: Center(
        child: Image.asset('assets/images/splash.png'), // استخدم المسار الصحيح للصورة
      ),
    );
  }
}
