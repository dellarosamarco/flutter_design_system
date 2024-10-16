import 'package:flutter/material.dart';
import 'package:flutter_design_system/components/custom_card.dart';

class CustomCardTest extends StatelessWidget {
  const CustomCardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          CustomCard(title: 'test', backgroundColor: Colors.black,),
          SizedBox(height: 20,),
          CustomCard(title: 'test', description: 'test description'),
          SizedBox(height: 20,),
          CustomCard(title: 'test', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,', backgroundColor: Colors.black,),
          SizedBox(height: 20,),
          CustomCard(title: 'test', icon: Icons.home, titleStyle: TextStyle(color: Colors.yellow), backgroundColor: Colors.black,)
        ],
      ),
    );
  }
}