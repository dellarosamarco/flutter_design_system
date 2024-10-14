import 'package:flutter/material.dart';

class FloatingPopupMenu extends StatefulWidget {
  const FloatingPopupMenu({super.key});

  @override
  State<FloatingPopupMenu> createState() => _FloatingPopupMenuState();
}

class _FloatingPopupMenuState extends State<FloatingPopupMenu> {
    Widget _offsetPopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text(
              "Flutter Open",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text(
              "Flutter Tutorial",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
    icon: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const ShapeDecoration(
        color: Colors.blue,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white, width: 2),
        )
      ),
      child: const Icon(Icons.menu, color: Colors.white),
    )
  );

  @override
  Widget build(BuildContext context) {
    return _offsetPopup();
  }
}