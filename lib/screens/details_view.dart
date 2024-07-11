import 'package:first_project/model/namemodel.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.nameModel});
  final NameModel nameModel;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.nameModel.name),
            Text(widget.nameModel.email),
            Text(widget.nameModel.phone),
          ],
        ),
      ),
    );
  }
}
