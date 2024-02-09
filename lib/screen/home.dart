import 'package:flutter/material.dart';
import 'package:flutter_application_1/color/color.dart';
import 'package:flutter_application_1/widget/todo_item.dart';
import '../controller/todo.dart';


class Home extends StatefulWidget{
   Home({Key? key}) : super(key:key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final todoslist = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final todoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todoslist;
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: _buildAppbar(),
    body: Container(
      color: tbbackgroundcolor,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          search(),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          insert(),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              'List of ToDos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _foundToDo.isEmpty
              ? Text(
                  'Please add another list',
                  style: TextStyle(fontSize: 18),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _foundToDo.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ToDo todoo = _foundToDo[_foundToDo.length - index - 1];
                      return TodoItem(
                        todo: todoo,
                        onToDoChange: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      );
                    },
                  ),
                ),
        ],
      ),
    ),
  );
}




  void _handleToDoChange(ToDo todo)
  {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    
  }

  void _deleteToDoItem(String id)
  {
    setState(() {
       todoslist.removeWhere((item) => item.id == id);
       _foundToDo.removeWhere((item) => item.id == id);
    });
   
  }

  void _addToDoItem(String toDo)
  {
    setState(() {
      todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    todoController.clear();
    
  }

  void _runFilter(String enteredKeyword)
  {
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty)
    {
      results = todoslist;
    }
    else
    {
      results = todoslist.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget insert() {
  return SizedBox(
    width: 400, // Adjust the width as needed
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                border: InputBorder.none,
                hintText: 'List your items!',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30,
            onPressed: () {
              // Add your button's onPressed functionality here
              _addToDoItem(todoController.text);
            },
          ),
        ],
      ),
    ),
  );
}

  Widget search() {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                  Icons.search,
                  color:  black,
                  size: 25,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 25,
                    minWidth: 30,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: black),
                ),
              ),
            );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tbbackgroundcolor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(Icons.menu,color: black, size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/image/glenn.jpg'),   
            ),
        )
      ],),
    );
  }
}