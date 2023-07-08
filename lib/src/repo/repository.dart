import 'package:cats_fact/models/cat_model.dart/cat_model.dart';
import 'package:cats_fact/utils/app_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class CatFactRepo {
  factory CatFactRepo(Dio dio, {String baseUrl}) = _CatFactRepo;

  @GET("/facts")
  Future<List<CatModel>> getFacts();
}
