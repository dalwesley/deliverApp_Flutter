import 'package:delivery/model/category.list.model.dart';
import 'package:dio/dio.dart';
import '../settings.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}/categories.php";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }
}
