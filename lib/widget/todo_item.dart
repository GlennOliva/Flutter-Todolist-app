import 'package:flutter/material.dart';
import 'package:flutter_application_1/color/color.dart';
import '../controller/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  const TodoItem({Key? key, required this.todo , required this.onDeleteItem , required this.onToDoChange}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Card(
      color: bg, // Set the background color here
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: yellow,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black, // Use the correct text color here
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: white,
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('Clicked on delete icon');
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
