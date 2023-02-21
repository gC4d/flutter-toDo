import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:to_do/src/core/services/realm/models/task_model.dart';
import 'package:to_do/src/core/ui/widgets/to_do_app_bar.dart';
import 'package:to_do/src/core/ui/widgets/user_image_button.dart';
import 'package:to_do/src/feature/home/widgets/custom_drawer.dart';
import 'package:to_do/src/feature/home/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: ToDoAppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(30, 65, 30, 200),
            itemCount: 100,
            itemBuilder: (_, index) {
              var tasks = [
                Task(Uuid.v4(), "tarefa", completed: true),
                Task(Uuid.v4(), "tarefa", completed: true),
                Task(Uuid.v4(), "tarefa", completed: true),
                Task(Uuid.v4(), "tarefa", completed: true),
                Task(Uuid.v4(), "tarefa", completed: true),
              ];
              final board = TaskBoard(Uuid.v4(), 'Nova lista de tarefa 1', tasks: tasks);
              return TaskCard(board: board, height: 140,);
            },
            separatorBuilder: (_, index) {
              return const SizedBox(height: 10);
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(8),
            child: SegmentedButton<int>(
              segments: const [
                ButtonSegment(
                  value: 0,
                  label: Text('Todos'),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text('Pendentes'),
                ),
                ButtonSegment(
                  value: 2,
                  label: Text('Concluidos'),
                ),
                ButtonSegment(
                  value: 3,
                  label: Text('Desativadas'),
                ),
              ],
              selected: const {1},
              onSelectionChanged: (values) {},
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
