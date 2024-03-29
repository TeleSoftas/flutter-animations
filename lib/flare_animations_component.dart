import 'package:flutter/material.dart';

class FlareAnimationsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text('Flare animations')),
        body: SeagullProgressIndicator(),
      );
}

class SeagullProgressIndicator extends StatelessWidget {
  const SeagullProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withOpacity(0.6),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // FlareActor(
            //   'animations/seagull.flr',
            //   animation: 'thinking gull',
            //   artboard: 'Seagull thinking',
            //   sizeFromArtboard: true,
            // ),
            Text('Loading...', style: TextStyle(fontSize: 20)),
          ]),
        ),
      );
}
