import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ItemsGrid extends StatelessWidget {
  final List<Widget> items;
  final int totalColumns;
  const ItemsGrid({super.key, required this.items, required this.totalColumns});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: items,
        )
      ],
    );
  }
}