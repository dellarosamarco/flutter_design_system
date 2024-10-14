import 'package:flutter/material.dart';
import 'package:flutter_design_system/constants.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final String description;
  final TextStyle? descriptionStyle;
  final double iconSize;
  final bool? hasIcon;
  final double? width;
  final bool? isCheckable;
  final Function(bool value)? onCheck;
  final Function? onClick;
  final bool? isChecked;

  const CustomCard({
    super.key, 
    required this.title,
    this.hasIcon=false, 
    this.isCheckable=false, 
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
    int maxDescriptionLength = 180;

    if(widget.descriptionStyle != null) {
      return Text(widget.description.substring(0, maxDescriptionLength) + (widget.description.length > maxDescriptionLength ? '...' : ''), style: widget.descriptionStyle,);
    }

    return Text(widget.description.substring(0, maxDescriptionLength) + (widget.description.length > maxDescriptionLength ? '...' : ''), style: const TextStyle(color: Colors.white, ),);
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
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if(widget.hasIcon == true) Icon(Icons.folder, color: semiTransparentWhite, size: widget.iconSize,),
                if(widget.isCheckable == true) SizedBox(
                  width: 25,
                  height: 10,
                  child: Checkbox(
                    value: widget.isChecked, 
                    onChanged: (value) {
                      setState(() {
                        if(widget.onCheck != null) {
                          widget.onCheck!(value ?? false);
                        }
                      });
                    }, 
                    activeColor: successColor,
                    side: const BorderSide(color: semiTransparentWhite, width: 2),
                  ),
                ),
                if(widget.hasIcon == true || widget.isCheckable == true) const SizedBox(width: 5,),
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