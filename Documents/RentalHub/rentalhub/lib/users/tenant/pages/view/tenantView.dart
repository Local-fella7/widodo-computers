import 'package:flutter/material.dart';

class TenantView extends StatefulWidget {
  const TenantView({super.key});

  @override
  State<TenantView> createState() => _TenantViewState();
}

class _TenantViewState extends State<TenantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Scape'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
