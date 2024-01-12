import 'dart:developer';
import 'package:http/http.dart';
import '../error/exceptions.dart';
import '../model/global_response_model.dart';
import 'get_it_injection.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<dynamic> call(Response res,) async {
    if (res.statusCode == 200) {
      GlobalResponseModel response ;
      response = GlobalResponseModel.fromJson(res.body.toString());
      if(response.success==false){
        throw ServerException(response.msg??"unknown Error");
      }else{
        return response.data??{};
      }
    } else {
      throw ServerException("unknown error");
    }
  }

  Future<GlobalResponseModel> handleFormData(StreamedResponse res,) async {
    log(res.statusCode.toString(),name: "status code");
    String aa = await res.stream.bytesToString();
    log(aa,name: "response body");
    if (res.statusCode == 200) {
      final response = GlobalResponseModel.fromJson(aa);
      if(response.authError==true){
        //TODO: handle auth error cases
        // await getIt<CacheDataSource>().clear();
        // navigateTo(LoginScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.success==false) {
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      throw ServerException("unknown error${res.statusCode}");
    }
  }
}
