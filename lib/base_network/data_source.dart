import 'base.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadnews() {
    return BaseNetwork.get("articles");
  }

  Future<Map<String, dynamic>> loadDetailNews(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("articles/$id");
  }

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs");
  }

  Future<Map<String, dynamic>> loadDetailBlogs(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("blogs/$id");
  }

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports");
  }

  Future<Map<String, dynamic>> loadDetailReports(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("reports/$id");
  }
}
