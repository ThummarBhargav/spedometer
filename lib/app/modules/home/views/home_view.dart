import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SfRadialGauge(
              enableLoadingAnimation: false,
              axes: <RadialAxis>[
                RadialAxis(
                    minimum: 0,
                    maximum: 150,
                    interval: 20,
                    minorTicksPerInterval: 9,
                    showAxisLine: false,
                    showTicks: false,
                    showLabels: false,
                    radiusFactor: 0.8,
                    labelOffset: 8,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 30,
                          startWidth: 0.265,
                          sizeUnit: GaugeSizeUnit.factor,
                          endWidth: 0.265,
                          color: const Color.fromRGBO(52, 193, 119, 1)),
                      GaugeRange(
                          startValue: 30,
                          endValue: 60,
                          startWidth: 0.265,
                          sizeUnit: GaugeSizeUnit.factor,
                          endWidth: 0.265,
                          color: const Color.fromRGBO(37, 160, 139, 1)),
                      GaugeRange(
                          startValue: 60,
                          endValue: 90,
                          startWidth: 0.265,
                          sizeUnit: GaugeSizeUnit.factor,
                          endWidth: 0.265,
                          color: const Color.fromRGBO(253, 197, 10, 1)),
                      GaugeRange(
                          startValue: 90,
                          endValue: 120,
                          startWidth: 0.265,
                          sizeUnit: GaugeSizeUnit.factor,
                          endWidth: 0.265,
                          color: const Color.fromRGBO(250, 112, 78, 1)),
                      GaugeRange(
                          startValue: 120,
                          endValue: 150,
                          startWidth: 0.265,
                          sizeUnit: GaugeSizeUnit.factor,
                          endWidth: 0.265,
                          color: const Color.fromRGBO(217, 53, 81, 1)),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: (controller.on.isTrue)?controller.point.value:0,
                        needleStartWidth: 0,
                        needleEndWidth: 5,
                        animationType: AnimationType.easeOutBack,
                        enableAnimation: true,
                        animationDuration: 3000,
                        knobStyle: KnobStyle(
                            knobRadius: 0.06,
                            borderColor:  Color(0xFFFF2E2E),
                            color: Colors.white,
                            borderWidth: 0.035),
                        tailStyle: TailStyle(
                            color:  Color(0xFFFF2E2E),
                            width: 4,
                            length: 0.15),
                        needleColor:  Color(0xFFFF2E2E),
                      )
                    ],
                    axisLabelStyle: GaugeTextStyle(fontSize: 10),
                    majorTickStyle: const MajorTickStyle(
                        length: 0.25, lengthUnit: GaugeSizeUnit.factor),
                    minorTickStyle: const MinorTickStyle(
                        length: 0.13,
                        lengthUnit: GaugeSizeUnit.factor,
                        thickness: 1))
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              controller.point.value = 75.0;
              controller.on.value = !controller.on.value;
            }, child: (controller.on.isTrue) ? Text("On") : Text("Off")),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: () {
                if(controller.point.value <150)
                  {
                    controller.point.value =controller.point.value +5;
                  }
              }, child: Icon(Icons.add)),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () {
                if(controller.point.value >0)
                {
                  controller.point.value =controller.point.value -5;
                }
              }, child: Icon(Icons.remove)),
            ],)
          ],
        ),
      );
    });
  }
}
