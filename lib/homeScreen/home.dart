import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return _buildnewsFeed();
  }

  Widget _buildnewsFeed(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
    
      ],
    
      ),
    );
  }