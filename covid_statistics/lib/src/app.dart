import 'package:covid_statistics/src/canvas/arrow_clip_path.dart';
import 'package:covid_statistics/src/controller/covid_statistics_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bar_chart.dart';
import 'components/covid_statistics_viewer.dart';

class App extends GetView<CovidStatisticsController> {
  App({Key? key}) : super(key: key);
  late double headerTopZone;

  Widget infoWidget(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Text(
            " : $value",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _background() {
    return [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xff3c727c),
              Color(0xff33656e),
            ],
          ),
        ),
      ),
      Positioned(
        left: -110,
        top: headerTopZone + 40,
        child: Container(
          child: Image.asset('assets/covid_img.png'),
          width: Get.size.width * 0.7,
        ),
      ),
      Positioned(
        top: headerTopZone + 10,
        // 가운데 정렬할 때에는 left, right 0으로 잡아주고 Center로 씌우면 된다.
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff195f68),
            ),
            child: Obx(
              () => Text(
                controller.todayData.standardDayString,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: headerTopZone + 60,
        right: 40,
        child: Obx(
          () => CovidStatisticsViewer(
            title: '확진자',
            titleColor: Colors.white,
            subValueColor: Colors.white,
            addedCount: controller.todayData.calcDecideCnt,
            totalCount: controller.todayData.decideCnt ?? 0,
            upDown:
                controller.calculateUpDown(controller.todayData.calcDecideCnt),
          ),
        ),
      ),
    ];
  }

  Widget _todayStatistics() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: CovidStatisticsViewer(
              title: '격리해제',
              addedCount: controller.todayData.calcClearCnt,
              totalCount: controller.todayData.clearCnt ?? 0,
              upDown:
                  controller.calculateUpDown(controller.todayData.calcClearCnt),
              dense: true,
            ),
          ),
          Container(
            height: 60,
            child: VerticalDivider(
              color: Color(0xffc7c7c7),
            ),
          ),
          Expanded(
            child: CovidStatisticsViewer(
              title: '검사중',
              addedCount: controller.todayData.calcExamCnt,
              totalCount: controller.todayData.examCnt ?? 0,
              upDown:
                  controller.calculateUpDown(controller.todayData.calcExamCnt),
              dense: true,
            ),
          ),
          Container(
            height: 60,
            child: VerticalDivider(
              color: Color(0xffc7c7c7),
            ),
          ),
          Expanded(
            child: CovidStatisticsViewer(
              title: '사망자',
              addedCount: controller.todayData.calcDeathCnt,
              totalCount: controller.todayData.deathCnt ?? 0,
              upDown:
                  controller.calculateUpDown(controller.todayData.calcDeathCnt),
              dense: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _covidTrendsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "확진자 추이",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        AspectRatio(
          aspectRatio: 1.7,
          child: Obx(
            () => controller.weekDatas.length == 0
                ? Container()
                : CovidBarChart(
                    covidDatas: controller.weekDatas,
                    maxY: controller.maxDecideValue,
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '코로나 일별 현황',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ..._background(),
          Positioned(
            top: headerTopZone + 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      _todayStatistics(),
                      SizedBox(height: 35),
                      _covidTrendsChart(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
