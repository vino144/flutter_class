import 'package:first_project/core/apicall/api_service.dart';
import 'package:first_project/data/model/user_model.dart';
import 'package:first_project/presentation/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.userName});
  final String userName;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<String> stringList = [
    "Anish",
    "Raja",
    "Paul",
    "David",
    "Brandon",
    "Bret",
    "Lisa",
    "Marsh",
    "New York"
  ];

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    print("INITSTATE");
    _getData();
  }

  @override
  void didChangeDependencies() {
    print("DIDCHANGEDEPENDENCIES");
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    print("SETSTATE");
    super.setState(fn);
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    print(_userModel!.first.name);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("Screen Widdth: $screenWidth");
    print("Screen Height: $screenHeight");
    bool isDesktop = false;

    if (screenWidth < 480) {
      print("Mobile");
    } else if (screenWidth < 760) {
      print("Tablet");
    } else {
      isDesktop = true;
      print("Desktop");
    }

    // if (isDesktop == true) {
    //   return Text('Hello');
    // }
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text("Home Screen View"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  setState(() {});
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {});
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  setState(() {});
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            isDesktop == false
                ? MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState() {
                        print("SETTINGS");
                      }
                    },
                    child: const Text("Button"),
                  )
                : Text('Hi I am Desktop'),
            ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Center(
                        child: Text(
                          _userModel![index].name,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.green,
                    height: 10,
                  );
                },
                itemCount: _userModel!.length),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MyHomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("DIDUPDATEWIDGET");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("DEACTIVATE");
  }

  @override
  void dispose() {
    super.dispose();
    print("DISPOSE");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("REASSEMBLE");
  }
}
