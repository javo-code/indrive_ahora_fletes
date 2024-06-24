import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String text;
  //final Function(String text) onChanged;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final Color color;
  final String? Function(String?)? validator;

  const DefaultTextField({
    super.key,
    required this.text,
    required this.icon,
    //required this.onChanged,
    this.color = Colors.white,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        onChanged: (text) {
          //onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
