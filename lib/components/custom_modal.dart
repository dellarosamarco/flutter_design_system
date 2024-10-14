import 'package:flutter/material.dart';
import 'package:flutter_design_system/constants.dart';

class CustomModalResponse {
  final String mainText;

  CustomModalResponse({required this.mainText});
}

class CustomModal extends StatefulWidget {
  final String title;
  final String placeholder;
  final String? initialValue;
  final Function? onDecline;
  final Function(CustomModalResponse response)? onAccept;

  CustomModal({super.key, required this.title, required this.placeholder, this.onDecline, this.onAccept, this.initialValue});

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: smallTextStyle),
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: const TextStyle(color: semiTransparentWhite, fontWeight: FontWeight.normal),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: actionColor)),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(secondaryColor),
                      shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
                      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
                      shape: WidgetStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)))),
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onAccept!(CustomModalResponse(mainText: controller.text));
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(secondaryColor),
                      shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
                      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
                      shape: WidgetStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topRight: Radius.circular(12)))),
                    ),
                    child: const Icon(Icons.check, color: successColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}