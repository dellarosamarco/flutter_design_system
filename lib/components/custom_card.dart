import 'package:flutter/material.dart';
import 'package:flutter_design_system/context.dart';

class CustomCard extends StatefulWidget {
  final Color? backgroundColor;
  final String title;
  final TextStyle? titleStyle;
  final String description;
  final TextStyle? descriptionStyle;
  final double iconSize;
  final IconData? icon;
  final double? width;
  final Function(bool value)? onCheck;
  final Function? onClick;
  final bool? isChecked;

  const CustomCard({
    super.key, 
    required this.title,
    this.backgroundColor,
    this.icon,
    this.iconSize=20, 
    this.width, 
    this.onCheck,
    this.titleStyle,
    this.description="",
    this.descriptionStyle,
    this.onClick,
    this.isChecked=false,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Widget renderTitle() {
    if(widget.titleStyle != null) {
      return Text(widget.title, overflow: TextOverflow.visible, style: widget.titleStyle,);
    }

    return Text(widget.title, style: const TextStyle(color: Colors.white, ),);
  }

  Widget renderDescription() {
    return Text(widget.description, style: const TextStyle(color: Colors.white, ),);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Context.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if(widget.icon != null) Icon(widget.icon, color: Context.semiTransparentWhite, size: widget.iconSize,),
                if(widget.icon != null) const SizedBox(width: 5,),
                renderTitle(),
              ],
            ),
            if(widget.description != "") const SizedBox(height: 10,),
            if(widget.description != "") renderDescription(),
          ],
        )
      ),
    );
  }
}