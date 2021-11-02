import 'package:flutter/material.dart';

class InputWithPasswordIcon extends StatefulWidget {
  
 final IconData icon;

  const InputWithPasswordIcon({ required this.icon,});
  @override
  _InputWithPasswordIconState createState() => _InputWithPasswordIconState();
}

class _InputWithPasswordIconState extends State<InputWithPasswordIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(28, 195, 178, 0.9),
          width: 2,
          
        ),
        borderRadius: BorderRadius.circular(40)
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
              obscureText: true,
              scrollPadding: EdgeInsets.zero,
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
