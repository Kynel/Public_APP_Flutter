import 'package:covid_statistics/src/model/covid_statistics.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  final bookshelfXml = '''<response>
<header>
<resultCode>00</resultCode>
<resultMsg>NORMAL SERVICE.</resultMsg>
</header>
<body>
<items>
<item>
<accDefRate>1.9720179427</accDefRate>
<accExamCnt>12664342</accExamCnt>
<accExamCompCnt>11985895</accExamCompCnt>
<careCnt>27873</careCnt>
<clearCnt>206276</clearCnt>
<createDt>2021-08-22 09:43:14.04</createDt>
<deathCnt>2215</deathCnt>
<decideCnt>236364</decideCnt>
<examCnt>678447</examCnt>
<resutlNegCnt>11749531</resutlNegCnt>
<seq>611</seq>
<stateDt>20210822</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-23 09:46:27.928</updateDt>
</item>
<item>
<accDefRate>1.9619205083</accDefRate>
<accExamCnt>12632601</accExamCnt>
<accExamCompCnt>11964603</accExamCompCnt>
<careCnt>28016</careCnt>
<clearCnt>204518</clearCnt>
<createDt>2021-08-21 09:47:10.494</createDt>
<deathCnt>2202</deathCnt>
<decideCnt>234736</decideCnt>
<examCnt>667998</examCnt>
<resutlNegCnt>11729867</resutlNegCnt>
<seq>610</seq>
<stateDt>20210821</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-23 09:45:32.881</updateDt>
</item>
<item>
<accDefRate>1.9555539281</accDefRate>
<accExamCnt>12567009</accExamCnt>
<accExamCompCnt>11907419</accExamCompCnt>
<careCnt>27884</careCnt>
<clearCnt>202775</clearCnt>
<createDt>2021-08-20 09:36:01.734</createDt>
<deathCnt>2197</deathCnt>
<decideCnt>232856</decideCnt>
<examCnt>659590</examCnt>
<resutlNegCnt>11674563</resutlNegCnt>
<seq>609</seq>
<stateDt>20210820</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-23 09:44:59.5</updateDt>
</item>
<item>
<accDefRate>1.9451095587</accDefRate>
<accExamCnt>12518704</accExamCnt>
<accExamCompCnt>11865964</accExamCompCnt>
<careCnt>27380</careCnt>
<clearCnt>201235</clearCnt>
<createDt>2021-08-19 09:35:41.913</createDt>
<deathCnt>2191</deathCnt>
<decideCnt>230806</decideCnt>
<examCnt>652740</examCnt>
<resutlNegCnt>11635158</resutlNegCnt>
<seq>608</seq>
<stateDt>20210819</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-23 09:41:58.816</updateDt>
</item>
<item>
<accDefRate>1.9333289253</accDefRate>
<accExamCnt>12461685</accExamCnt>
<accExamCompCnt>11826958</accExamCompCnt>
<careCnt>26894</careCnt>
<clearCnt>199582</clearCnt>
<createDt>2021-08-18 09:41:29.969</createDt>
<deathCnt>2178</deathCnt>
<decideCnt>228654</decideCnt>
<examCnt>634727</examCnt>
<resutlNegCnt>11598304</resutlNegCnt>
<seq>607</seq>
<stateDt>20210818</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-23 09:41:44.138</updateDt>
</item>
<item>
<accDefRate>1.9250193711</accDefRate>
<accExamCnt>12404977</accExamCnt>
<accExamCompCnt>11784297</accExamCompCnt>
<careCnt>27453</careCnt>
<clearCnt>197224</clearCnt>
<createDt>2021-08-17 09:34:16.236</createDt>
<deathCnt>2173</deathCnt>
<decideCnt>226850</decideCnt>
<examCnt>620680</examCnt>
<resutlNegCnt>11557447</resutlNegCnt>
<seq>606</seq>
<stateDt>20210817</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-20 09:46:41.038</updateDt>
</item>
<item>
<accDefRate>1.9144725491</accDefRate>
<accExamCnt>12372777</accExamCnt>
<accExamCompCnt>11777552</accExamCompCnt>
<careCnt>27113</careCnt>
<clearCnt>196198</clearCnt>
<createDt>2021-08-16 09:37:05.069</createDt>
<deathCnt>2167</deathCnt>
<decideCnt>225478</decideCnt>
<examCnt>595225</examCnt>
<resutlNegCnt>11552074</resutlNegCnt>
<seq>605</seq>
<stateDt>20210816</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-20 09:46:18.127</updateDt>
</item>
<item>
<accDefRate>1.9041743394</accDefRate>
<accExamCnt>12344716</accExamCnt>
<accExamCompCnt>11759585</accExamCompCnt>
<careCnt>26664</careCnt>
<clearCnt>195103</clearCnt>
<createDt>2021-08-15 09:34:53.152</createDt>
<deathCnt>2156</deathCnt>
<decideCnt>223923</decideCnt>
<examCnt>585131</examCnt>
<resutlNegCnt>11535662</resutlNegCnt>
<seq>604</seq>
<stateDt>20210815</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-20 09:46:00.669</updateDt>
</item>
<item>
<accDefRate>1.8908234953</accDefRate>
<accExamCnt>12309280</accExamCnt>
<accExamCompCnt>11746575</accExamCompCnt>
<careCnt>26181</careCnt>
<clearCnt>193778</clearCnt>
<createDt>2021-08-14 09:45:15.42</createDt>
<deathCnt>2148</deathCnt>
<decideCnt>222107</decideCnt>
<examCnt>562705</examCnt>
<resutlNegCnt>11524468</resutlNegCnt>
<seq>603</seq>
<stateDt>20210814</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2021-08-20 09:45:45.928</updateDt>
</item>
</items>
<numOfRows>10</numOfRows>
<pageNo>1</pageNo>
<totalCount>9</totalCount>
</body>
</response>''';
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
    // var response =
    //     await _dio.get("/openapi/service/rest/Covid19/getCovid19InfStateJson");
    // print(response);
    // final document = XmlDocument.parse(response.data);
    final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return Covid19StatisticsModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }
  }
}
