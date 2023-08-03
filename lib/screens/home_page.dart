import 'package:appqu/model/model.dart';
import 'package:flutter/material.dart';
import '../components/todoitem.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final textcontrol = TextEditingController();

// List <todo> lolo;
   List<todo> todolist = todo.todolist();


 static List <todo>inscreenlist =[];

@override
  void initState()
  {
  
  setState(() {
        inscreenlist= todolist ;
  super.initState();

  });


  }

 void _onchage(todo todo)
 {

  setState(() {
        todo.isDone=!todo.isDone;

  });



 }

void addtoditem(String textt)
{
  setState(() {
    todolist.add(todo(text: textt));

  });


}
void _deltetodoitem(String txt)
{

setState(() {
    todolist.removeWhere((todo) => todo.text==txt);

});

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.check_circle_rounded), Text(" ToDo APP")],
        ),
        backgroundColor: Color.fromARGB(255, 86, 13, 181),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Stack(
   
          children: [

             // list view.bulider ->>>> 

          
            ListView.builder(
                
                itemCount: inscreenlist.length,
                itemBuilder: (context, index) {
                  return Todoitem(todoitem: inscreenlist[index],onchange: _onchage,onDelete:_deltetodoitem );
                },
            ),
            Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    )]
                    ),

                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 70,
                            width: 250,
                            child: TextField(
                              controller: textcontrol,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            )),
                        Container(
                            child: Container(
                          margin: EdgeInsets.only(bottom: 9),
                          color: Color.fromARGB(255, 86, 13, 181),
                          child: IconButton(
                            onPressed: (() {

                              String item = textcontrol.text;

                                  addtoditem(item.toLowerCase());
                                  textcontrol.clear();                       

                            }),
                            icon: Icon(Icons.add,color: Colors.white,),
                          ),
                        ))
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
