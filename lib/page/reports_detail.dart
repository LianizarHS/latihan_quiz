import 'package:flutter/material.dart';
import 'package:latihan_quiz/model/reports_model.dart';

class reports_detail extends StatefulWidget {
  final Results reports;
  const reports_detail({super.key, required this.reports});

  @override
  State<reports_detail> createState() => _reports_detailState();
}

class _reports_detailState extends State<reports_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports Detail"),
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
