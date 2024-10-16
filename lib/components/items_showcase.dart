import 'package:flutter/material.dart';
import 'package:flutter_design_system/components/items_grid.dart';
import 'package:flutter_design_system/context.dart';

class ItemsShowcase extends StatefulWidget {
  final Color? backgroundColor;
  final String title;
  final List<Widget> items;
  final bool? isRow;
  final bool? isGrid;
  const ItemsShowcase({super.key, required this.title, required this.items, this.isRow=true, this.isGrid=false, this.backgroundColor});

  @override
  State<ItemsShowcase> createState() => _ItemsShowcaseState();
}

class _ItemsShowcaseState extends State<ItemsShowcase> {
  Widget renderItems() {
    if(widget.isGrid == true) {
      return ItemsGrid(
        totalColumns: 2,
        items: widget.items,
      );
    }

    if(widget.isRow == false) {
      return Column(
        children: widget.items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 10), child: item,)).toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.items.map((item) => Padding(padding: const EdgeInsets.only(right: 10), child: item,)).toList(),
        )
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Context.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: Context.defaultTextStyle,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                  shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () {}, 
                child: Text('See all', style: TextStyle(color: Context.actionColor),)
              )
            ],
          ),
          const SizedBox(height: 10),
          if(widget.items.isNotEmpty)
            renderItems()
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text('Empty', style: TextStyle(color: Context.semiTransparentWhite, fontSize: 20)),
            ),
        ],
      ),
    );
  }
}