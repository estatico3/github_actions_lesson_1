import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStringDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add string"),
            SizedBox(height: 8.0),
            TextField(
              key: ValueKey("field"),
              controller: _controller,
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () => Navigator.of(context).pop(_controller.text),
            )
          ],
        ),
      ),
    );
  }
}
