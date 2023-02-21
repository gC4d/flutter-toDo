
import 'package:flutter/material.dart';

class ToDoAppBar extends AppBar {
  final List<Widget>? actions;
  ToDoAppBar({super.key, this.actions})
      : super(
          title: const Text('ToDo'),
          actions: actions
        );
}
