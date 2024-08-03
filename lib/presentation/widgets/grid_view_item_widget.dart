import 'package:first_project/data/model/namemodel.dart';
import 'package:first_project/presentation/pages/screens/details_view.dart';
import 'package:flutter/material.dart';

class GridViewItemWidget extends StatelessWidget {
  const GridViewItemWidget({super.key, required this.nameModel});

  final NameModel nameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsView(
                    nameModel: nameModel,
                  )),
        );
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text(
          nameModel.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
