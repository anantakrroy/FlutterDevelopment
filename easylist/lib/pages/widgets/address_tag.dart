import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {

  String address;

  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                child: Text(address)),
          );
  }
  
}