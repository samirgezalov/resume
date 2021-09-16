import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/data.dart';
import 'package:resume/mainframe.dart';
import 'package:resume/wrappers/my_ep_wrapper.dart';

class SecondaryFrame extends StatefulWidget {
  SecondaryFrame({Key key}) : super(key: key);

  @override
  _SecondaryFrameState createState() => _SecondaryFrameState();
}

class _SecondaryFrameState extends State<SecondaryFrame> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, itemRef, c) {
      return Container(
        child: Column(
          children: [
            ExpansionPanelList(
              children: getChildren(context, itemRef.items).toList(),
              expansionCallback: (item, onEvent) {
                // setState(() {
                // Provider.of<DataProvider>(context, listen: false)
                //         .items[item]
                //         .isOpen =
                //     !Provider.of<DataProvider>(context, listen: false)
                //         .items[item]
                //         .isOpen;
                // var list =
                //     Provider.of<DataProvider>(context, listen: false).items;
                // list[item].isOpen = !list[item].isOpen;
                // Provider.of<DataProvider>(context, listen: false).items = list;

                itemRef.openItem(item);

                print("expansionCallback1");

                // });
              },
            ),
          ],
        ),
      );
    });
  }

  List<ExpansionPanel> getChildren(
      BuildContext context, List<InformationParagraph> items) {
    List<ExpansionPanel> returnable = [];
    for (int i = 0; i < items.length; i++) {
      var e = items[i];
      if (e.isLeveled) {
        ExpansionPanelList ep = ExpansionPanelList(
          children: e.list
              .map((lowerItem) => myExpansionPanel(context, lowerItem))
              .toList(),
          expansionCallback: (item, onEvent) {
            // setState(() {
            // e.list[item].isOpen = !e.list[item].isOpen;
            Provider.of<DataProvider>(context, listen: false)
                .openSubItem(i, item);
            // });
          },
        );
        returnable.add(ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isOpen) {
              return rowIconAndData(context, e.image, e.information);
            },
            body: ep,
            isExpanded: e.isOpen));
      } else {
        returnable.add(myExpansionPanel(context, e));
      }
    }
    ;
    return returnable;
  }

  List<ExpansionPanel> getChildren1(
      BuildContext context, List<InformationParagraph> items) {
    return items.map((e) {
      if (e.isLeveled) {
        ExpansionPanelList ep = ExpansionPanelList(
          children: e.list
              .map((lowerItem) => myExpansionPanel(context, lowerItem))
              .toList(),
          expansionCallback: (item, onEvent) {
            // setState(() {
            e.list[item].isOpen = !e.list[item].isOpen;
            // });
          },
        );
        return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isOpen) {
              return rowIconAndData(context, e.image, e.information);
            },
            body: ep,
            isExpanded: e.isOpen);
      } else {
        return myExpansionPanel(context, e);
      }
    }).toList();
  }
}
