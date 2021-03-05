import 'package:flutter/material.dart';

import 'custom_painter_animations_component.dart';
import 'explicit_animation_component.dart';
import 'explicit_custom_animation_component.dart';
import 'flare_animations_component.dart';
import 'implicit_animation_component.dart';
import 'implicit_custom_animation_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigation = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Animation Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigator(
          key: _navigation,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Flutter Animation Demo'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: FlatButton(
                      onPressed: () => _navigateToImplicitAnimationComponent(context),
                      child: Text('IMPLICIT ANIMATION EXAMPLE'),
                    ),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    onPressed: () => _navigateToCustomImplicitAnimationComponent(context),
                    child: Text('IMPLICIT CUSTOM ANIMATION EXAMPLE'),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    onPressed: () => _navigateToExplicitAnimationComponent(context),
                    child: Text('EXPLICIT ANIMATION EXAMPLE'),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    onPressed: () => _navigateToCustomExplicitAnimationComponent(context),
                    child: Text('EXPLICIT CUSTOM ANIMATION EXAMPLE'),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    onPressed: () => _navigateToCustomPainterAnimationComponent(context),
                    child: Text('CUSTOM PAINTER ANIMATION EXAMPLE'),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    onPressed: () => _navigateToFlareAnimationComponent(context),
                    child: Text('FLARE ANIMATION EXAMPLE'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> _navigateToImplicitAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => ImplicitAnimationComponent()));

  Future<void> _navigateToCustomImplicitAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => ImplicitCustomAnimationComponent()));

  Future<void> _navigateToExplicitAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => ExplicitAnimationComponent()));

  Future<void> _navigateToCustomExplicitAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => ExplicitCustomAnimationComponent()));

  Future<void> _navigateToCustomPainterAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => CustomPainterAnimationsComponent()));

  Future<void> _navigateToFlareAnimationComponent(BuildContext context) =>
      _navigation.currentState.push(MaterialPageRoute(builder: (_) => FlareAnimationsComponent()));
}
