import 'package:flutter/material.dart';
import 'package:todo/color.dart';
import 'todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id!),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDeleteItem(todo.id!),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: todo.isDone ? Colors.greenAccent.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: ListTile(
          onTap: () => onToDoChanged(todo),
          leading: Icon(
            todo.isDone ? Icons.check_circle : Icons.circle_outlined,
            color: primaryColor,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 18,
              color: accentColor,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
