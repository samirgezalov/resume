import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:resume/data.dart';
import 'package:resume/generated/l10n.dart';
import 'package:resume/mainframe.dart';
import 'package:resume/secondaryframe.dart';
import 'package:screenshot/screenshot.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScreenshotController screenshotController = ScreenshotController();
  var safeArea;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    provider.dataPopulate(context);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    safeArea = SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('${S.of(context).resume}: ${S.of(context).name}'),
          ),
          body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Center(
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Mainframe(),
                      SecondaryFrame(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FabCircularMenu(children: <Widget>[
            Tooltip(
              message: "Change Apperance",
              child: IconButton(
                  icon: Icon(Icons.style),
                  onPressed: () {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  }),
            ),
            Tooltip(
              message: "Expand or Collapse all",
              child: IconButton(
                  icon: Icon(Provider.of<DataProvider>(context).isExpanded
                      ? Icons.expand_more_rounded
                      : Icons.expand_less),
                  onPressed: () {
                    // setState(() {
                    Provider.of<DataProvider>(context, listen: false)
                        .openOrCloseAll();
                    // });
                  }),
            ),
            Tooltip(
              message: "Save As Image",
              child: IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {
                  screenshotController
                      .capture(delay: Duration(milliseconds: 10))
                      .then((capturedImage) async {
                    ShowCapturedWidget(context, capturedImage);
                  }).catchError((onError) {
                    print(onError);
                  });
                },
              ),
            ),
            // IconButton(
            //   icon: Icon(Icons.camera_alt_rounded),
            //   onPressed: () {
            //     screenshotController
            //         .captureFromWidget(safeArea)
            //         .then((capturedImage) async {
            //       ShowCapturedWidget(context, capturedImage);
            //     }).catchError((onError) {
            //       print(onError);
            //     });
            //   },
            // )
          ])
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
    return safeArea;
  }
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Save CV"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            _saved(context, capturedImage);
          },
          icon: Icon(Icons.save_alt)),
    ),
  );
}

_saved(BuildContext context, Uint8List image) async {
  if (!kIsWeb) {
    if (Platform.isIOS || Platform.isAndroid) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
      final result = await FileSaver.instance
          .saveAs("CV_SamirGozalov", image, "png", MimeType.PNG);
    }
  } else
    final result = await FileSaver.instance
        .saveFile("CV_SamirGozalov", image, "png", mimeType: MimeType.PNG);
  // if(MediaQuery.of(context).)
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('File was saved'),
    ),
  );
}
