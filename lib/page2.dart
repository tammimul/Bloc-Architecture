import 'package:flutter/material.dart';



class pageTwo extends StatefulWidget {
  const pageTwo({Key? key}) : super(key: key);

  @override
  _pageTwoState createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page 2"),),
    );
  }
}
