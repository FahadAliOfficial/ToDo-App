// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todoName,
    required this.todoChecked,
    required this.onChanged,
    required this.deletetask
  });

  final String todoName;
  final bool todoChecked;
  final Function(bool?)? onChanged;
  final Function()? deletetask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25, top: 15),
      child: Container(

        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          ),
        child: Row(

          children: [
            // Checkbox for marking the todo as completed
            Checkbox(value: todoChecked, onChanged: onChanged, checkColor: Colors.white, activeColor: Colors.deepPurple[200],side: const BorderSide(color: Colors.white), ),

            // Spacer(),
            // Display the todo name
            Text(
              todoName, style: TextStyle(
                fontSize: 14,
                color: Colors.white,decoration:todoChecked? TextDecoration.lineThrough: TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 4
            
            ),),
            const Spacer(),

            IconButton(onPressed: deletetask, icon: const Icon(Icons.delete, color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
