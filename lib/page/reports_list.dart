import 'package:flutter/material.dart';
import 'package:latihan_quiz/base_network/data_source.dart';
import 'package:latihan_quiz/model/reports_model.dart';
import 'package:latihan_quiz/page/reports_detail.dart';

class report_list extends StatefulWidget {
  const report_list({super.key});

  @override
  State<report_list> createState() => _report_listState();
}

class _report_listState extends State<report_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News List"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildlistenerbody(),
    );
  }

  Widget _buildlistenerbody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadnews(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _builderrorSection();
            }
            if (snapshot.hasData) {
              Reports rep = Reports.fromJson(snapshot.data);
              return _buildsucces(rep);
            }
            return _buildLoading();
          }),
    );
  }

  Widget _builderrorSection() {
    return Text("error");
  }

  Widget _buildsucces(Reports data) {
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItemUser(data.results![index]);
        });
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildItemUser(Results newsdata) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return reports_detail(reports: newsdata);
      })),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                newsdata.imageUrl!,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(newsdata.title!)],
            )
          ],
        ),
      ),
    );
  }
}
