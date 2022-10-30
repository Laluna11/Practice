import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetModels {
  Widget _buildPopupDialog(
    BuildContext context,
    String pic,
    String name,
    // VoidCallback showSnack,
  ) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      // title: ,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/$pic.jpg'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.snackbar("Testing", "Glad it worked!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.purple,
                      animationDuration: const Duration(milliseconds: 3000),
                      borderColor: Colors.black,
                      borderWidth: 4,
                      isDismissible: true,
                      forwardAnimationCurve: Curves.elasticInOut,
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      shouldIconPulse: false,
                      colorText: Colors.white,
                      mainButton: TextButton(
                          onPressed: Get.back, child: const Text("close"))),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.purple,
                    height: 75,
                    width: double.infinity / 2,
                    child: const Text(
                      'Like',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 37,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    height: 75,
                    width: double.infinity / 2,
                    child: const Text(
                      'Dislike',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 37,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listInfo({
    required int index,
    required BuildContext context,
    required String imageName,
    required List<String> phonePic,
    required List<String> phoneName,
    // required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Column(
            children: <Widget>[
              Image.asset(
                imageName,
                width: 30,
              ),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildPopupDialog(
                    context,
                    phonePic[index],
                    phoneName[index],
                    // onTap,
                  );
                },
              );
            },
            child: Text(
              "available",
              style: TextStyle(color: Colors.purple.shade900),
            ),
          ),
          title: Text(
            phoneName[index],
          ),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }

  // Widget SnackBarView() {
  //   const snackBar = SnackBar(
  //     content: Text('Yay! A SnackBar!'),
  //   );

  //   return snackBar;
  // }

  Widget showDrawer(BuildContext context) {
    return ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text("Lina"),
          accountEmail: Text("smth@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text("LA"),
          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "LA",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
        const ListTile(
          title: Text("Item1"),
          trailing: Icon(Icons.add),
        ),
        const Divider(),
        ListTile(
          title: const Text("Close"),
          trailing: const Icon(Icons.close),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
