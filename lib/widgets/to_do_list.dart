import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/themes/colors.dart';
import 'package:to_do/themes/text.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    required this.isComoleted,
    required this.onChanged,
    required this.deleteTask,
  });

  final String taskName;
  final bool isComoleted;
  final Function(bool?) onChanged;
  final void Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 12,
        right: 12,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: ligthRed,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          )
        ]),
        child: Container(
          // height: 100,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: appBarColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isComoleted,
                onChanged: onChanged,
              ),
              // task name.
              Expanded(
                child: Text(
                  taskName,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: title1Bold.merge(
                    TextStyle(
                      decoration: isComoleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
