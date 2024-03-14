
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(38.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          title: const Text(
            "ToDo List",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context,index) => SizedBox(height: 8.0),
          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0), // Add vertical padding around the list
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2.0,
              color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
              child: ListTile(

                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Text(tasks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    setState(() {
      tasks.add("Task ${tasks.length + 1}");
    });
  }
}