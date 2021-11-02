import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
 final IconData icon;

  // ignore: use_key_in_widget_constructors
  const InputWithIcon({ required this.icon, });

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(28, 195, 178, 0.9),
          width: 2,
          
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 25,
              color: const Color.fromRGBO(28, 195, 178, 0.9),
            )
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
