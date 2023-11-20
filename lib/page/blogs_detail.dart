import 'package:flutter/material.dart';
import 'package:latihan_quiz/model/blogs_model.dart';

class blog_detail extends StatefulWidget {
  final Results blog;

  const blog_detail({super.key, required this.blog});

  @override
  State<blog_detail> createState() => _blog_detailState();
}

class _blog_detailState extends State<blog_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs Detail"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
