import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final String image;
  final Function callback;
  final double width;

  Button({
    @required this.text,
    @required this.callback,
    this.image,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      // width: width != null ? width : 200,
      height: 40,
      child: FlatButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            image != null
                ? Image.asset(
                    image,
                    width: 40,
                  )
                : SizedBox(),
            image != null
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(),
          ],
        ),
        onPressed: callback,
      ),
    );
  }
}
