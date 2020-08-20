import 'package:app/app/controller/basecontroller.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/common/controller/camerafacecontroller.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:app/module/minus/intro/widget/arahkankepala.dart';
import 'package:app/module/minus/intro/widget/cobagerakankepala.dart';
import 'package:app/module/minus/intro/widget/rotatingletter.dart';
import 'package:app/module/minus/intro/widget/simpanperangkat.dart';
import 'package:app/module/minus/intro/widget/tujuantest.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusIntroController extends BaseController {
  int currentSlide = 0;
  CarouselController slideController = CarouselController();
  final GlobalController gc = Get.find();
  final CameraFaceController cam = Get.find();

  static const int lastLength = 4;

  final slides = <Widget>[
    TujuanTest(),
    SimpanPerangkat(),
    RotatingLetter(),
    ArahkanKepala(),
    CobaGerakanKepala(),
  ];

  final titleAndDesc = [
    {'title': 'Test Ketajaman Mata', 'desc': 'Test ini bertujuan untuk menguji ketajaman mata anda'},
    {'title': 'Test Jarak Jauh', 'desc': 'Posisikan tubuh anda dari perangkat pada jarak 50cm sampai 100cm'},
    {'title': 'Perhatikan Orientasi Simbol', 'desc': 'Anda diminta untuk menebak orientasi simbol yang muncul selama 7 detik'},
    {'title': 'Arahkan Kepala', 'desc': 'Jawab dengan menggerakkan kepala menuju pojok layar sesuai dengan susunan tombol hingga timer pada tombol selesai'},
    {'title': 'Coba Gerakan Kepala Anda', 'desc': ''},
  ];

  nextSlide() {
    switch (currentSlide) {
      case lastLength:
        gc.trainComplete();
        Get.offNamed(AppRoute.minusTestPage);
        break;
      case lastLength - 1:
        cam.initializeCamera();
        currentSlide++;
        slideController.nextPage();
        update();
        break;
      default:
        currentSlide++;
        slideController.nextPage();
        update();
    }
  }

  setSlide(int index) {
    currentSlide = index;
    update();
  }

  backSlide() {
    switch (currentSlide) {
      case 0:
        return true;
        break;
      default:
        currentSlide--;
        slideController.previousPage();
        update();
        return false;
    }
  }

  gotoMinusTest() => Get.offNamed(AppRoute.minusTestPage);
}
