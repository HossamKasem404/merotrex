import 'package:flutter/material.dart';
import 'package:ptow/Pages/Login_Page.dart';

void main() {
  runApp(MyApp());
}

String token = "";
String url = "http://10.0.2.2:8000/api";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dr.You',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: Color(0xFFF3F6FA),
      // ),
      home: Login_Page(),
    );
  }
}


// class MyApp extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//  ChangeNotifierProvider(
//         create: (_) => ThemeProvider(),),
//          ChangeNotifierProvider(
//         create: (_) => BalanceProvider(),),
//         ChangeNotifierProvider(
//         create: (_) => GetTripProvider(),),
//          ChangeNotifierProvider(
//         create: (_) => GetUnPayedTripProvider(),)

//       ],
    
//         child: Consumer<ThemeProvider>(
//           builder: (context, themeProvider, _) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//                routes: {
//               Login_Page.id : (context) => Login_Page(),
//               Home_page.id : (context) => Home_page(),
//               Signup_Page.id : (context) => Signup_Page(),
            
              
              
//             },
//             initialRoute: Login.id,
//               title: 'Dark Mode Example',
//               theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
              
//             );
//           },
        
//       ),
//     );
//   }
// }
