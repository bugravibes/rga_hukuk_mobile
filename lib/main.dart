import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
      ),
      home: CreatePostPage(),
    );
  }
}

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Implement functionality to add photo
                print('Add Photo');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to submit post
                _submitPost();
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitPost() {
    // Retrieve data from controllers and submit post
    String title = _titleController.text;
    String text = _textController.text;

    // Do something with the data, e.g., send it to a server, save locally, etc.
    print('Title: $title');
    print('Text: $text');
    // Clear the text fields after submission
    _titleController.clear();
    _textController.clear();
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }
}
