import 'package:flutter/material.dart';
import 'package:test_course/add_string_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> strings = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: strings.isNotEmpty ? buildListView() : buildEmptyView(),
      ),
      floatingActionButton: buildAddAction(),
    );
  }

  Widget buildListView() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: strings.length,
        itemBuilder: (_, index) {
          return Text(strings[index]);
        },
      ),
    );
  }

  Widget buildEmptyView() {
    return Container(
      alignment: Alignment.center,
      child: Text("No string entries"),
    );
  }

  Widget buildAddAction() {
    return FloatingActionButton(
      onPressed: () => _handleAddAction(),
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void _handleAddAction() async {
    String? string =
        await showDialog(context: context, builder: (_) => AddStringDialog());
    setState(() {
      strings.add(string ?? '');
    });
  }
}
