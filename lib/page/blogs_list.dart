import 'package:flutter/material.dart';
import 'package:latihan_quiz/base_network/data_source.dart';
import 'package:latihan_quiz/model/blogs_model.dart';
import 'package:latihan_quiz/page/blogs_detail.dart';

class blog_list extends StatefulWidget {
  const blog_list({super.key});

  @override
  State<blog_list> createState() => _blog_listState();
}

class _blog_listState extends State<blog_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog List"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildlistenerbody(),
    );
  }

  Widget _buildlistenerbody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadBlogs(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _builderrorSection();
            }
            if (snapshot.hasData) {
              Blogs blogs = Blogs.fromJson(snapshot.data);
              return _buildsucces(blogs);
            }
            return _buildLoading();
          }),
    );
  }

  Widget _builderrorSection() {
    return Text("error");
  }

  Widget _buildsucces(Blogs data) {
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

  Widget _buildItemUser(Results blogsdata) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return blog_detail(blog: blogsdata);
      })),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                blogsdata.imageUrl!,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(blogsdata.title!)],
            )
          ],
        ),
      ),
    );
  }
}
