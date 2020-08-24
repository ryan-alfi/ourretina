import 'package:app/app/route/approute.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/analytic/events.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottom extends StatelessWidget {
  final GlobalController gc = Get.find();
  final OurRetinaEvents _events = Get.find();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 36,
      left: 36,
      right: 36,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 2.2,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'OurRetina',
              style: Theme.of(context).textTheme.headline2,
            ),
            Container(
                width: 200,
                child: Text(
                  S.of(context).tesSingkatKesehatanMataAndaDimanaSaja,
                  textAlign: TextAlign.center,
                )),
            Spacer(),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.minusIntroPage);
                },
                child: Text(S.of(context).mulai),
              ),
            ),
            Container(
              width: 150,
              child: OutlineButton(
                onPressed: () {
                  _events.recordLastResultCLicked();
                  Get.toNamed(AppRoute.minusResultHistoryPage);
                },
                child: Text(
                  S.of(context).hasil,
                  style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
