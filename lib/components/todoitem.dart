import 'package:appqu/model/model.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class Todoitem extends StatelessWidget {
 
   todo todoitem;
  Function onchange  ;
  Function onDelete ;
   

   Todoitem({
    required this.todoitem,
    required this.onchange,
    required this.onDelete
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 7),
      child: Card(

            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(18) 
            ),
            elevation: 10,
            
            color: Colors.deepOrange,
            child: ListTile(
              onTap: () {
                onchange(todoitem);
              },
              leading: todoitem.isDone? Icon(Icons.check_box_rounded,color: Colors.white,)
              :Icon(Icons.check_box_outline_blank,color: Colors.white,),
              title: Text(
                todoitem.text!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: todoitem.isDone? TextDecoration.lineThrough:null   

                ),
                
              ),
              trailing: IconButton(onPressed:() {
                
                  onDelete(todoitem.text);
              }, icon: Icon(Icons.delete, color: Colors.white,) ,
              ),
            ),
          ),
    );
  }
}