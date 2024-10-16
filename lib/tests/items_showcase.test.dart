import 'package:flutter/material.dart';
import 'package:flutter_design_system/components/custom_card.dart';
import 'package:flutter_design_system/components/items_showcase.dart';

class ItemsShowcaseTest extends StatelessWidget {
  const ItemsShowcaseTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: ItemsShowcase(
        title: 'Test',
        items: [
          CustomCard(title: 'test custom card 1', backgroundColor: Color.fromARGB(255, 63, 63, 63),),
          CustomCard(title: 'asd', backgroundColor: Color.fromARGB(255, 163, 162, 154),),
          CustomCard(title: 'asd', backgroundColor: Colors.yellow,),
          CustomCard(title: 'asd', backgroundColor: Color.fromARGB(255, 138, 124, 4),),
          CustomCard(title: 'test long text on custom card inside a items showcase', backgroundColor: Color.fromARGB(255, 117, 5, 192),),
        ]
      ),
    );
  }
}