import 'package:flutter/material.dart';

class Updatesscreen extends StatelessWidget {
  const Updatesscreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Screen"),
        backgroundColor: Colors.amber,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return _buildRow();
  }

  Widget _buildRow(){
    return Row(
      children: [
        Container(width: 50, height: 50, color: Colors.pink),
        Container(width: 80, height: 80, color: Colors.blue),
        Container(width: 90, height: 60, color: Colors.orange),
        Container(width: 30, height: 90, color: Colors.cyan),
        Container(width: 70, height: 40, color: Colors.indigo),
      ],
    );
  }
}