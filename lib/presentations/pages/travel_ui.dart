import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _controller.reverse();
      else if (status == AnimationStatus.dismissed) _controller.forward();
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final index = _tabController.index;
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: Icon(Icons.menu_outlined),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 20,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
              ),
              children: [
                TextSpan(text: "hi"),
                TextSpan(text: ","),
                TextSpan(
                  text: "Sina",
                  style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.white38,
                accentColor: Colors.white30,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'search',
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        indicatorWeight: 1,
                        tabs: [
                          Transform.scale(
                            child: Icon(Icons.search),
                            scale: index == 0 ? _controller.value : 1,
                          ),
                          Transform.scale(
                            child: Icon(Icons.search),
                            scale: index == 1 ? _controller.value : 1,
                          ),
                          Transform.scale(
                            child: Icon(Icons.search),
                            scale: index == 2 ? _controller.value : 1,
                          ),
                          Transform.scale(
                            child: Icon(Icons.search),
                            scale: index == 3 ? _controller.value : 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [1, 2, 3, 4]
                          .map(
                            (e) => ListView(
                                children: List.generate(
                                    120,
                                    (index) => ListTile(
                                          leading: CircleAvatar(
                                            child: Text("1"),
                                          ),
                                          title: Text("yeyeyey"),
                                          subtitle: Text("asdasd"),
                                        ))),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
