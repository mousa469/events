import 'package:events/features/layout/map_view/presentation/widgets/map_view_body.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  static const String id = "MapView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MapViewBody() ,
    );
  }
}
