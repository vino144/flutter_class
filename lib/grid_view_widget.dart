import 'package:first_project/details_view.dart';
import 'package:first_project/nameModel.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    List<NameModel> nameList = [];
    NameModel objNameModel = NameModel("Anish", "anish@gmail.com", "123456741");
    nameList.add(objNameModel);
    NameModel objNameModel1 =
        NameModel("Brandon", "Brandon@gmail.com", "321321312");
    nameList.add(objNameModel1);

    NameModel objNameModel2 =
        NameModel("Bret Harrission", "btet@gmail.com", "432432423");
    nameList.add(objNameModel2);

    NameModel objNameModel3 =
        NameModel("Paul David", "paul@gmail.com", "432432423223");
    nameList.add(objNameModel3);

    NameModel objNameModel4 = NameModel("Raja", "raja@gmail.com", "6434324233");
    nameList.add(objNameModel4);

    NameModel objNameModel5 = NameModel("rani", "rani@gmail.com", "86543254");
    nameList.add(objNameModel5);

    NameModel objNameModel6 =
        NameModel("lisa", "lisanish@gmail.com", "3343242323");
    nameList.add(objNameModel6);

    NameModel objNameModel7 =
        NameModel("vinoth", "vionth@gmail.com", "9688002827");
    nameList.add(objNameModel7);

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        titleTextStyle: const TextStyle(color: Colors.blue, fontSize: 25),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: nameList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsView(
                          nameModel: nameList[index],
                        )),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                nameList[index].name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
