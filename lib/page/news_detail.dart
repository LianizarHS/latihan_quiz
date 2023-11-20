import 'package:flutter/material.dart';
import 'package:latihan_quiz/model/news_model.dart';

class news_detail extends StatefulWidget {
  final Results news;
  const news_detail({super.key, required this.news});

  @override
  State<news_detail> createState() => _blog_detailState();
}

class _blog_detailState extends State<news_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(
            children: const [Text("asd")],
          ),
        ),
      ),
    );
  }
}
