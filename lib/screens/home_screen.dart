import 'package:flutter/material.dart';
import 'package:loading_global/google_sign_in_service.dart';
import 'package:loading_global/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/safe_scaffold.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).homeCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              GoogleSignInService.handleSignIn();
            },
            child: const Text("Google Sign In"),
          ),
          RadialGaugeExample(),
          // Container(
          //   padding: const EdgeInsets.only(bottom: 20, left: 5),
          //   width: MediaQuery.of(context).size.width * .4,
          //   //height: 150,
          //   child: SfRadialGauge(axes: <RadialAxis>[
          //     RadialAxis(
          //         minimum: 0,
          //         maximum: 100,
          //         radiusFactor: 1,
          //         startAngle: 220,
          //         endAngle: 555,
          //         showLabels: false,
          //         showTicks: false,
          //         axisLineStyle: AxisLineStyle(
          //           // thickness: 0.4,
          //           thickness: 25,
          //           cornerStyle: CornerStyle.bothCurve,
          //           color: Colors.blue.shade200,
          //           // thicknessUnit: GaugeSizeUnit.factor,
          //         ),
          //         pointers: const <GaugePointer>[
          //           RangePointer(
          //             value: 17,
          //             cornerStyle: CornerStyle.bothCurve,
          //             width: 25,

          //             // sizeUnit: GaugeSizeUnit.factor,
          //             color: Colors.blue,
          //           )
          //         ],
          //         annotations: const <GaugeAnnotation>[
          //           GaugeAnnotation(
          //             positionFactor: 0.2,
          //             // angle: 90,
          //             widget: Center(
          //               child: Text(
          //                 '${5}%',
          //                 style: TextStyle(
          //                     color: Colors.blue, fontWeight: FontWeight.w700),
          //               ),
          //             ),
          //           )
          //         ])
          //   ]),
          // ),

          const Text("Hello World")
        ],
      ),
    );
  }
}

class RadialGaugeExample extends StatefulWidget {
  @override
  _RadialGaugeExampleState createState() => _RadialGaugeExampleState();
}

class _RadialGaugeExampleState extends State<RadialGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
            cornerStyle: CornerStyle.bothCurve,
            thicknessUnit: GaugeSizeUnit.factor,
            thickness: 0.1,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: 4,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              width: 18,
              // cornerStyle: CornerStyle.bothCurve,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
