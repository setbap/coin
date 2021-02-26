import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInSine);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.pexels.com/photos/5234951/pexels-photo-5234951.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
          ),
          Opacity(
            opacity: _animationController.value,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.height,
              child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.teal,
                  accentColor: Colors.yellow,
                  buttonColor: Colors.red,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.teal),
                    alignLabelWithHint: true,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: _animation.value * 100.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Username",
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Icon(
                              Icons.login,
                            )),
                        label: Text(""),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
