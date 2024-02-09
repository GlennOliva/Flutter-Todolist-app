class ToDo{
  String? id;
  String? todoText;
  bool isDone;


  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList()
  {
    return [
      ToDo(id: '01', todoText: 'Shesh', isDone: true),
      ToDo(id: '02', todoText: 'Shesh', isDone: true),
      ToDo(id: '03', todoText: 'Shesh', isDone: true),
      ToDo(id: '04', todoText: 'Shesh', ),
      ToDo(id: '05', todoText: 'Shesh',),
      ToDo(id: '06', todoText: 'Shesh', ),
    ];
  }
}