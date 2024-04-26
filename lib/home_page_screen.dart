import 'package:flutter/material.dart';
import 'package:numerical_analisis/opreations_list.dart';
import 'package:numerical_analisis/screens/main/Matrix/MatrixView.dart';
import 'package:numerical_analisis/screens/main/bisection_screen.dart';
import 'package:numerical_analisis/screens/main/falseposition_screen.dart';
import 'package:numerical_analisis/screens/main/newton_screen.dart';
import 'package:numerical_analisis/screens/main/secant_screen.dart';
import 'package:numerical_analisis/screens/main/simplefixedpoint_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 227, 80, 136),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 227, 80, 136),
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: size.width * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: operationsList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        if (operationsList[index] == "Bisection\n method") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BisectionScreen(),
                          ));
                        } else if (operationsList[index] ==
                            "False\n Position\n method") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FalsePostitionScreen(),
                          ));
                        } else if (operationsList[index] ==
                            "simple Fixed\n point\n method") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SimpleFixedPointScreen(),
                          ));
                        } else if (operationsList[index] == "Secant\n method") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecantScreen(),
                          ));
                        } else if (operationsList[index] == "Newton\n method") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewtonScreen(),
                          ));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MatrixScreen(),
                          ));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 227, 80, 136),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(size.width * 0.035),
                              bottomLeft: Radius.circular(size.width * 0.035),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: size.height * 0.025),
                                Text(
                                  "${operationsList[index]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01,
                                        vertical: size.width * 0.01,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: size.width * 0.015,
                                          horizontal: size.width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              size.width * 0.1),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "Solve\n With",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width * 0.013,
                                            color: Color.fromARGB(
                                                255, 227, 80, 136),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:numerical_analisis/opreations_list.dart';
// import 'package:numerical_analisis/screens/main/Matrix/MatrixView.dart';
// import 'package:numerical_analisis/screens/main/bisection_screen.dart';
// import 'package:numerical_analisis/screens/main/falseposition_screen.dart';
// import 'package:numerical_analisis/screens/main/newton_screen.dart';
// import 'package:numerical_analisis/screens/main/secant_screen.dart';
// import 'package:numerical_analisis/screens/main/simplefixedpoint_screen.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(
//                 'assets/images/background.jpg',
//               ),
//               fit: BoxFit.cover)),
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.all(size.width * 0.02),
//           child: SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Hello!",
//                           style: TextStyle(
//                               color: Color(0xFFA491F6),
//                               decoration: TextDecoration
//                                   .underline, // Add underline decoration
//                               decorationColor: Color(0xFFA491F6),
//                               decorationThickness: 2,
//                               decorationStyle: TextDecorationStyle.solid,
//                               fontSize: size.width * 0.1)),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2, childAspectRatio: 1.3),
//                       itemCount: operationsList.length,
//                       itemBuilder: (context, index) => InkWell(
//                             onTap: () {
//                               if (operationsList[index] ==
//                                   "Bisection\n method") {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => BisectionScreen()));
//                               } else if (operationsList[index] ==
//                                   "False\n Position\n method") {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         FalsePostitionScreen()));
//                               } else if (operationsList[index] ==
//                                   "simple Fixed\n point\n method") {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         SimpleFixedPointScreen()));
//                               } else if (operationsList[index] ==
//                                   "Secant\n method") {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => SecantScreen()));
//                               } else if (operationsList[index] ==
//                                   "Newton\n method") {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => NewtonScreen()));
//                               } else {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => MatrixScreen()));
//                               }
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.all(size.width * 0.04),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color(0xFFA491F6),
//                                     borderRadius: BorderRadius.only(
//                                         topRight:
//                                             Radius.circular(size.width * 0.035),
//                                         bottomLeft: Radius.circular(
//                                             size.width * 0.035))),
//                                 child: Center(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         height: size.height * 0.025,
//                                       ),
//                                       Text(
//                                         "${operationsList[index]}",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: size.width * 0.036),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       Spacer(),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: size.width * 0.01,
//                                                 vertical: size.width * 0.01),
//                                             child: Container(
//                                               padding: EdgeInsets.symmetric(
//                                                   vertical: size.width * 0.02,
//                                                   horizontal:
//                                                       size.width * 0.05),
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           size.width * 0.1),
//                                                   color: Colors.white),
//                                               child: Text(
//                                                 "Solve\n With",
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: size.width * 0.018,
//                                                   color: Color(0xFFA491F6),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: size.height * 0.01,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
