import 'package:covid_statistics/src/model/covid_statistics.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;
  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {
          "serviceKey":
              "X08LOPZvTewaglFDisBcd8ATYMKxK3HsFxb7mi7sLbeE3O8ljsUrxsgRqcMS/e/ewu3r3iozEpqUxwHpE7lb4A==",
        },
      ),
    );
  }

  Future<Covid19StatisticsModel> fetchCovid19Statistics() async {
    var response =
        await _dio.get("/openapi/service/rest/Covid19/getCovid19InfStateJson");
    print(response);
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return Covid19StatisticsModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }
  }
}
