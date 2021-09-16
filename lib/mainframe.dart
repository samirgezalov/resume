import 'package:flutter/material.dart';

import 'generated/l10n.dart';

class Mainframe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: GestureDetector(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: SingleChildScrollView(
                          child: InteractiveViewer(
                            child: Image.asset('assets/img/sam.png'),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.asset('assets/img/sam.png'))),
        textMain(context, S.of(context).name),
        textMain(context, S.of(context).position),
        Divider(),
        rowIconAndData(context, Image.asset('assets/icons/cell.png'),
            textMain(context, S.of(context).cell)),
        rowIconAndData(context, Image.asset('assets/icons/email.png'),
            textMain(context, S.of(context).email)),
        rowIconAndData(context, Image.asset('assets/icons/based.png'),
            textMain(context, S.of(context).location)),
        rowIconAndData(context, Image.asset('assets/icons/born.png'),
            textMain(context, S.of(context).born)),
        rowIconAndData(context, Image.asset('assets/icons/marrital.png'),
            textMain(context, S.of(context).marital)),
        rowIconAndData(context, Image.asset('assets/icons/education.png'),
            textMain(context, S.of(context).degree)),
        rowIconAndData(context, Image.asset('assets/icons/academy.png'),
            textMain(context, S.of(context).education)),
        Divider(),
      ],
    ));
  }
}

Widget rowIconAndData(BuildContext context, Image imageAddress, Widget data) {
  var device = MediaQuery.of(context);
  return Card(
      child: Row(
    children: [
      SizedBox(
        width: device.size.width / 10,
        height: device.size.height / 20,
        child: imageAddress,
        // color: Colors.white,
      ),
      SizedBox(
        width: device.size.width / 30,
      ),
      data
    ],
  ));
}

Widget textMain(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline2,
    textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.25,
  );
}
