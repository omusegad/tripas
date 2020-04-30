import 'package:flutter/material.dart';
import 'package:tripas/model/choices.dart';

class PopupChoices extends StatefulWidget {
  @override
  _PopupChoicesState createState() => _PopupChoicesState();
}

class _PopupChoicesState extends State<PopupChoices> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: menuAction ,
      itemBuilder: (BuildContext context) {
        return Choices.menuList.map((String choice){
          return PopupMenuItem(
            textStyle: TextStyle(color:Color(0XFFA6A7AB)),
            value:choice,
            child: Text(choice));
        }).toList();
      },
      
    );
  }

  void menuAction(String choice){
   if(choice == Choices.update){
     print('updating');
   }else if(choice == Choices.delete){
     print('deleting');
   }
  }
}