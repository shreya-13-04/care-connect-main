import 'package:animate_do/animate_do.dart';
import 'package:careconnect/caregiver/loginSetup/loginpage.dart';
import 'package:careconnect/customer/LoginSetup/login.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Hpage1 extends StatelessWidget {
  const Hpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Hpage(), debugShowCheckedModeBanner: false);
  }
}

class Hpage extends StatefulWidget {
  const Hpage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Hpage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  String? selectedRole;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (selectedRole == "customer") {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade, child: Login()),
                );
              } else if (selectedRole == "caregiver") {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Loginpage(),
                  ),
                );
              }
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home/care.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: Text(
                    "Connecting Hearts, Providing Care",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.2,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 13),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                      selectedRole = "customer";
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: hide == false
                                ? Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                      selectedRole = "caregiver";
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: hide == false
                                ? Text(
                                    "CareGiver",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
