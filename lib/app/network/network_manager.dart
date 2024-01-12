import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
// import 'package:tsahel/data/data_sources/local_data_sources/cache_data_source.dart';
import '../utils/consts.dart';
import '../utils/get_it_injection.dart';

class NetworkManager {

  NetworkManager._();

  factory NetworkManager() {
    return NetworkManager._();
  }
  final https = InterceptedHttp.build(
      interceptors: [
        LoggingInterceptor(),
      ]);

  Uri? _uri;
  final requestHeaders = apiHeaders;
  Future<http.Response> request<T>({
    required RequestMethod method,
    String baseUrl = kBaseUrl,
    String baseVersion = kBaseVersion,
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,

  }) async{
    _uri = Uri(
      scheme:"https" ,
      host: baseUrl,
      path: kBaseVersion+endPoint,
      queryParameters: queryParameters,
    );
    log(_uri.toString(),name:"url");
    if(headers!=null){
      requestHeaders.addAll(headers);
    }
    switch (method){
      case RequestMethod.get:
        return await https.get(_uri!, headers: requestHeaders,);

      case RequestMethod.post:

        return await https.post(_uri!, headers: {
          "Content-Type": "application/json;charset=utf-8",
          "Accept": "*/*",
          "X-Requested-With": "XMLHttpRequest",

        }, body: json.encode(body),);
      default:
        return await https.post(_uri!, headers: requestHeaders, body: json.encode(body),);
    }
  }

  Future<http.StreamedResponse> requestWithFormData<T>({
    RequestMethod? method,
    String baseUrl = kBaseUrl,
    String baseVersion = kBaseVersion,
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,

  }) async{
    _uri = Uri(
      scheme:"https" ,
      host: baseUrl,
      path: kBaseVersion+endPoint,
      queryParameters: queryParameters,
    );
    if(headers!=null){
      requestHeaders.addAll(headers);
    }
    requestHeaders.addAll({
      // "Authorization":getIt<CacheDataSource>().getToken()??"",
    });
    var request = http.Request(method?.name.toUpperCase()??'POST', _uri!);
    request.body = json.encode(body);
    request.headers.addAll(requestHeaders);
    log(_uri.toString(),name:"url");
    log(request.body,name:"body");
    log(request.headers.toString(),name:"headers");
    return await request.send();
  }


  Future<http.StreamedResponse> requestWithFile({
    String baseUrl = kBaseUrl,
    String baseVersion = kBaseVersion,
    required String endPoint,
    Map<String,File>? files,
    Map<String, String>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,

  }) async{
    _uri = Uri(
      scheme:"https" ,
      host: baseUrl,
      path: kBaseVersion+endPoint,
      queryParameters: queryParameters,
    );
    print(_uri);
    if(headers!=null){
      requestHeaders.addAll(headers);
    }
    var request = http.MultipartRequest('POST',_uri!);
    request.fields.addAll(body??{});
    request.files.addAll(
        files?.entries.map((e) => http.MultipartFile(e.key,
          e.value.readAsBytes().asStream(), e.value.lengthSync(),
          filename: e.value.path.split("/").last,),)??{}
    );
    return await request.send();

  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // data.headers.addAll({
    //   "Authorization":getIt<CacheDataSource>().getToken()??""
    // });
    print(data.toString());
    print(data.body);
    print(data.params);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    print(data.body);
    return data;
  }

}