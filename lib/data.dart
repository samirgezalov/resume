import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume/generated/l10n.dart';
import 'package:resume/theme/materialvscupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DataProvider with ChangeNotifier {
  bool isExpanded = true;
  List<InformationParagraph> _items;
// getItems(BuildContext context) {
//   if (_items == null) dataPopulate(context);
//   return _items;
// }

  void dataPopulate(BuildContext context) {
    if (_items == null)
      _items = [
        InformationParagraph(
            Image.asset('assets/icons/status.png'),
            AdaptiveText(S.of(context).status),
            AdaptiveText(S.of(context).statusData)),
        InformationParagraph(
            Image.asset('assets/icons/personalassesment.png'),
            AdaptiveText(S.of(context).selfEvaluation),
            AdaptiveText(S.of(context).selfEvaluationData)),
        InformationParagraph(
            Image.asset('assets/icons/hobby.png'),
            AdaptiveText(S.of(context).hobby),
            AdaptiveText(S.of(context).hobbyData)),
        InformationParagraph(
            Image.asset('assets/icons/skills.png'),
            AdaptiveText(S.of(context).skills),
            AdaptiveText(S.of(context).skillsData)),
        InformationParagraph(
            Image.asset('assets/icons/drillingsoftware.png'),
            AdaptiveText(S.of(context).drillingSoft),
            AdaptiveText(S.of(context).drillingSoftData)),
        InformationParagraph(
            Image.asset('assets/icons/achievement.png'),
            AdaptiveText(S.of(context).honors),
            AdaptiveText(S.of(context).honorsData)),
        InformationParagraph(
            Image.asset('assets/icons/training.png'),
            AdaptiveText(S.of(context).trainings),
            AdaptiveText(S.of(context).trainings),
            isLeveled: true,
            list: [
              InformationParagraph(
                Image.asset('assets/img/safety.png'),
                AdaptiveText(S.of(context).safety),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  certificateOnTouchAlert(
                    context,
                    "Safety Leadership Program (BP)",
                    Image.asset(
                      'assets/certificates/sslc2.png',
                    ),
                  ),
                  certificateOnTouchAlert(
                    context,
                    "Vision Hazard Identification",
                    Image.asset(
                      'assets/certificates/vhic.png',
                    ),
                  ),
                  certificateOnTouchAlert(
                    context,
                    "Basic Offshore Safety Induction and Emergency Training (OPITO)",
                    Image.asset(
                      'assets/certificates/bosiet.png',
                    ),
                  ),
                  AdaptiveText("Behavioral Safety Observation (BP)"),
                  AdaptiveText(
                    "Fire Fighting and First Aid (BP)",
                  ),
                ]),
                // AdaptiveText(
                //     "Safety Leadership Program (BP)\nVision Hazard Identification\nBehavioral Safety Observation (BP)\nBasic Offshore Safety Induction and Emergency Training (OPITO)\nFire Fighting and First Aid (BP)"),
              ),
              InformationParagraph(
                  Image.asset('assets/img/drill.png'),
                  AdaptiveText(S.of(context).drilling),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        certificateOnTouchAlert(
                          context,
                          "Drilling and Risk Management (NEXT)",
                          Image.asset(
                            'assets/certificates/next.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Full BP Challange Drilling Engineer package trainings, such as:",
                          Image.asset(
                            'assets/certificates/globalchallange.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Drilling Engineering and Well Planning",
                          Image.asset(
                            'assets/certificates/deandwp.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Drilling Engineering Practices",
                          Image.asset(
                            'assets/certificates/drprac.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Drill string Design and Failure Prevention",
                          Image.asset(
                            'assets/certificates/dsd.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Decision Making and Cost forecasting",
                          Image.asset(
                            'assets/certificates/dmandcf.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "IADC (Well CAP) Well Control Supervisors certificate for Surface/Subsea system",
                          Image.asset(
                            'assets/certificates/wellcap.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Directional Drilling",
                          Image.asset(
                            'assets/certificates/dd.png',
                          ),
                        ),
                        certificateOnTouchAlert(
                          context,
                          "Introduction to Drilling and Completion",
                          Image.asset(
                            'assets/certificates/introdeandce.png',
                          ),
                        ),
                        AdaptiveText("Basic Drilling Fluids"),
                        AdaptiveText("Casing Design"),
                        AdaptiveText("Cementing"),
                      ])),
              InformationParagraph(
                  Image.asset('assets/img/dev.png'),
                  AdaptiveText(S.of(context).development),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      certificateOnTouchAlert(
                          context,
                          "Flutter Certified Application Developer (ID: ATCW10000205)",
                          Image.asset(
                            'assets/certificates/flutterdev.png',
                          ),
                          url: "https://www.androidatc.com/_transcript.php"),
                      certificateOnTouchAlert(
                        context,
                        "Android разработка - с нуля до профессионала. Полный курс",
                        Image.asset(
                          'assets/certificates/android.jpg',
                        ),
                        url:
                            "https://www.udemy.com/certificate/UC-ceb367ad-d1cb-478c-a262-ac8e5a8f6893/",
                      ),
                      certificateOnTouchAlert(
                        context,
                        "Java (Джава) для начинающих: с нуля до сертификата Oracle",
                        Image.asset(
                          'assets/certificates/java.jpg',
                        ),
                        url: "https://www.udemy.com/certificate/UC-G6FP5VN9/",
                      ),
                      AdaptiveText("Flutter & Dart - The Complete Guide"),
                      AdaptiveText(
                          "STEPit Academy - Java / JavaScript / HTML / CSS / JQuery / MS SQL / native Android Dev"),
                    ],
                  )
                  // AdaptiveText(
                  //   "STEPit Academy - Java / JavaScript / HTML / CSS / JQuery / MS SQL / native Android Dev (Diploma Pending)\nAndroid разработка - с нуля до профессионала. Полный курс\nJava (Джава) для начинающих: с нуля до сертификата Oracle\nFlutter & Dart - The Complete Guide [2020 Edition]\nFlutter Certified Application Developer (ATCW10000205)",
                  // ),
                  ),
            ]),
        InformationParagraph(
            Image.asset('assets/icons/workexperience.png'),
            AdaptiveText(S.of(context).workExperience),
            AdaptiveText(S.of(context).workExperience),
            isLeveled: true,
            list: [
              InformationParagraph(
                  Image.asset('assets/img/koc.png'),
                  AdaptiveText("Karabakh Operating Company"),
                  workExperience(
                    context,
                    "2019.10 - 2020.5",
                    "Drilling Engineer",
                    "Karabakh project",
                    "Work in collaboration with Equinor on KPS-4 well Drilling Ops\nWork on finalization of Drilling Facilities SOR\nPreparation for Drilling Rig Tender",
                  )),
              InformationParagraph(
                  Image.asset(
                    'assets/img/socar.png',
                  ),
                  AdaptiveText("SOCAR"),
                  Column(children: [
                    workExperience(
                        context,
                        "2018.3 - 2018.9",
                        "Lead Drilling Engineer",
                        "Azneft IB drilling projects",
                        "Different drilling related projects"),
                    workExperience(
                        context,
                        "2004.6 - 2004.9",
                        "Junior Driller Assistant (offshore)",
                        "Bayil Limany, Shallow water Gunashli, 19 platform",
                        "Assist drill crew with their duties offshore."),
                  ])),
              InformationParagraph(
                  Image.asset('assets/img/beoc.png'),
                  AdaptiveText("Bahar Energy Operating Company"),
                  workExperience(
                      context,
                      "2012.7 - 2014.8",
                      "Senior Drilling Engineer\nRig Site Supervisor (company man)",
                      "Gum Deniz",
                      "As BEOC had only started building Drilling Department on moment I joined, had to do variety of tasks, apart of main job description such as:\nSDE\nCost Controlling, (includes creating process for future control)\nEquipment Logistics\nTender processes, all stages\nCreating online database, server, reporting system\nEstablishing Drilling document's format's and templates\nCreating Basis of Design\nPrepare Well Program and all involved (csg design, cmt, cost, logistics etc.)\nPrepare End of well Reports and all involved\nQA/QC, Technical limit process\nSenior operating drilling engineer roles (prepare RWI, pre/post job meetings etc.)\nCompany man After office process was completed and on rail and enough office specialists was hired had to move to Rig Site supervisor position as there still was lack of specialists and for my Site experience. As Company man :\nComplete and send DDR, Lookahead. Plan logistics\nBoost Safety\nSupervize Drilling Activity, with key Cementing, Casing Runnning, Pressure Testing etc.\nExecute the Drilling & Completion Plans\nMaintain well control\nDocument and investigate all incidents and serious near misses\nEnsure that risks are understood and managed adequately.")),
              InformationParagraph(
                  Image.asset('assets/img/bp.png'),
                  AdaptiveText("BP"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      workExperience(
                          context,
                          "2010.9 - 2012.7",
                          "Drilling Projects Engineer",
                          "Drilling Projects Team",
                          "Variety of Drilling related projects, some of key project's are:\nConductor Steering tool developement (participated with subcontractors with an attempt to develop tool which would enable to turn conductor while driving it)\nDrill Test well on land for Chirag 2 (i was only drilling rep, and was responsible for successfull and safe drilling of shallow well on site)\nWorked and Maintained Azerbaijan RPU BtB process and RAPIDs.\nCreating Casing BOD's\nParticipated in Tender process and selecting Tubular Running service contractor\nDelivered comparison of a performance of equipment from different vendors, such as drill bits, reamers etc.\nDelivered “NPT Investigation” document"),
                      workExperience(
                          context,
                          "2008.9 - 2010.9",
                          "Planning / Operational Drilling Engineer",
                          "Chirag",
                          "Plan and Execute wells for Chirag platform"),
                      workExperience(
                          context,
                          "2007.5 - 2008.9",
                          "Offshore Drilling Engineer",
                          "Chirag",
                          "Make sure all operations are in compliant with BP HSE standards\nEnsure all rig activities are performed safely and in cost effective manner.\nDIMS management, assist Night Sup to complete and send DDR\nSupervize cementing job, complete Report\nPrepare and submit all well operations reports in timely manner - leak off tests, casing\nMaintain inventory control\nPerform all calculations related to well operations, as an example but not limited to;\nhydraulics,\nLOT,\nkick sheet and kick tolerance,\ncasing tallies\ncementing,\nhole cleaning.\nCross check the calculations when it is required."),
                      workExperience(
                          context,
                          "2006.9 - 2007.5",
                          "Challange Drilling Engineer",
                          "Istiglal",
                          "Working as Roustabaut, roughneck etc. as a part of BP challange program on Istiglal"),
                      workExperience(
                          context,
                          "2005.6 - 2006.9",
                          "Summer intern, Junior Drilling Engineer, Technical Assistant, Team Admin assistant, Cost Controller Assistant (simultaniously)",
                          "Shah Deniz exploration team, Istiglal",
                          "Assist team with different tasks\nWorking on Risk Management for SDX4\nCreating Decision Tree on Risks and mitigation’s\nAssist Cost controller on cost database management\nTook ownership on Common Process online (CPOL) for AzSPU, provided trainings"),
                    ],
                  )),
              InformationParagraph(
                  Image.asset('assets/img/kcadeutag.png'),
                  AdaptiveText("KCA Deutag"),
                  workExperience(
                      context,
                      "2005.3 - 2005.5",
                      "Schoolar",
                      "KCAD Schoolarship program",
                      "Was selected to participate in KCAD schoolar program with learning opportunities\nVisited KCAD and other several subcontractor’s facilities in Aberdeen")),
            ]),
      ];
  }

  void openOrCloseAll() {
    isExpanded = !isExpanded;
    _items.forEach((element) {
      element.isOpen = isExpanded;
      if (element.isLeveled)
        element.list.forEach((subElement) {
          subElement.isOpen = isExpanded;
        });
    });
    notifyListeners();
  }

  List<InformationParagraph> get items {
    return _items;
  }

  set items(var items) {
    _items = items;
    print("changed");
    notifyListeners();
  }

  void openItem(int itemNumber) {
    _items[itemNumber].isOpen = !_items[itemNumber].isOpen;
    notifyListeners();
  }

  void openSubItem(int itemNumber, int subItemNumber) {
    _items[itemNumber].list[subItemNumber].isOpen =
        !_items[itemNumber].list[subItemNumber].isOpen;
    notifyListeners();
  }

  Widget workExperience(BuildContext context, String dates, String position,
      String asset, String data) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AdaptiveText(
          dates,
          // style: Theme.of(context).textTheme.headline5,
          // style: AdaptiveTheme.of(context).theme.textTheme.headline5,
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.75,
        ),
        AdaptiveText(
          position,
          // style: Theme.of(context).textTheme.headline4,
          // style: AdaptiveTheme.of(context).theme.textTheme.headline4,

          textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.75,
        ),
        AdaptiveText(
          asset,
          // style: Theme.of(context).textTheme.headline5,
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.75,
        ),
        AdaptiveText(
          data,
          // style: Theme.of(context).textTheme.bodyText1,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
        )
      ]),
    );
  }
}

class InformationParagraph {
  Image image;
  AdaptiveText information;
  Widget data;
  bool isOpen = true;
  bool isLeveled;
  List<InformationParagraph> list;
  InformationParagraph(this.image, this.information, this.data,
      {this.list, this.isLeveled = false});
// set isOpen(bool isOpen) {
//   _isOpen = isOpen;
//   // notifyListeners();
// }

// get isOpen {
//   return _isOpen;
// }
}

Widget certificateOnTouchAlert(
    BuildContext context, String certificateName, Image image,
    {String url}) {
  return TextButton(
    onPressed: () {
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextButton(
                onPressed: () {
                  if (url != null) launch(url);
                },
                child: AdaptiveText(certificateName)),
            content: Stack(children: [
              Center(child: CircularProgressIndicator()),
              SingleChildScrollView(child: InteractiveViewer(child: image)),
            ]),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    child: AdaptiveText(certificateName),
  );
}
