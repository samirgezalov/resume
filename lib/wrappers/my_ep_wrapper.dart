import 'package:flutter/material.dart';
import 'package:resume/data.dart';
import 'package:resume/mainframe.dart';

Widget myExpansionPanelWrapper(BuildContext context) {
  return ExpansionPanelList(
    children: [],
  );
}

ExpansionPanel myExpansionPanel(
    BuildContext context, InformationParagraph data) {
  // if (!data.isLeveled)
  return ExpansionPanel(
    canTapOnHeader: true,
    headerBuilder: (context, isOpen) {
      return rowIconAndData(context, data.image, data.information);
      // return ChangeNotifierProvider(
      //   value: item,
      //   child: rowIconAndData(context, data.image, data.information),
      // );
    },
    body: Align(
        alignment: Alignment.topLeft,
        child: Padding(padding: EdgeInsets.all(8), child: data.data)),
    isExpanded: data.isOpen ?? true,
    // isExpanded: isOpen
  );
  // else
  // return ExpansionPanel(
  //   headerBuilder: (context, isOpen) {
  //     return rowIconAndData(context, data.image, data.information);
  //   },
  //   body: ExpansionPanelList(
  //     children: data.list.map((e) {
  //       return myExpansionPanel(context, e);
  //     }).toList(),
  //     expansionCallback: (item, onEvent) {
  //       // setState(() {
  //       data.list[item].isOpen = !data.list[item].isOpen;
  //       // }              );
  //     },
  //   ),
  //   isExpanded: data.isOpen,
  //   // isExpanded: isOpen
  // );
}
