import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//路由重定向
import 'package:coach/navigator/tabNavigator.dart'; //路由到首页
//登录注册路由
import 'package:coach/login/login.dart'; //登录页面
import 'package:coach/login/forget.dart'; //忘记密码页面
import 'package:coach/login/register.dart'; //注册页面
import 'package:coach/rule/userAgreement.dart'; //用户协议
import 'package:coach/rule/privacyAgreement.dart'; //隐私协议
//首页的页面路由
import 'package:coach/pages/Clock/MyClockRecord.dart'; //我的打卡记录
import 'package:coach/pages/StudentClock/StuClock.dart'; //学员打卡
import 'package:coach/pages/StudentClock/StuClockList.dart'; //学员打卡列表
import 'package:coach/pages/StudentClock/StuClockRecord.dart'; //学员打卡记录
import 'package:coach/pages/homePage.dart'; //首页
import 'package:coach/pages/StudentClock/StuSearch.dart';//学员搜索
//我的页面路由
import 'package:coach/pages/mine/my_info_page.dart';//个人信息
import 'package:coach/pages/mine/MyInfo/my_info_signature.dart'; //个人签名
import 'package:coach/pages/mine/MyInfo/my_info_nickname.dart';//个人昵称
import 'package:coach/pages/mine/MyInfo/my_info_edit_mobile.dart';//修改手机号
import 'package:coach/pages/mine/MyInfo/my_info_pwd.dart';//修改密码
import 'package:coach/pages/mine/my_complaint.dart';//投诉建议
import 'package:coach/pages/mine/my_about.dart';//关于我们
import 'package:coach/pages/mine/my_news.dart';//我的消息
//学员页面路由
import 'package:coach/pages/StudentClock/StuDetail.dart';//学员进度更新

class Router {
  static const forgetPage = 'app://login/forget'; //忘记密码页面
  static const loginPage = 'app://login/login'; //登录页面
  static const registerPage = 'app://login/register'; //注册页面
  static const userAgreement = 'app://rule/userAgreement'; //用户协议
  static const privacyAgreement = 'app://rule/privacyAgreement'; //隐私协议
  static const tabNavigator = 'app://navigator/tabnavigator'; //路由到首页
  static const myClockRecord = 'app://page/clock/myclockRecord'; //我的打卡记录
  static const stuClock = 'app://page/studentclock/stuclock'; //学员打卡
  static const stuClockList = 'app://page/studentclock/stuclocklist'; //学员打卡列表
  static const stuClockRecord = 'app://page/studentclock/stuclockrecord'; //学员打卡记录
  static const stuSearch = 'app://page/studentclock/stusearch'; //学员搜索
  static const homePage = 'app://page/homepage'; //首页
  static const myInfoPage = 'app://page/mine/myinfoPage'; //个人信息
  static const myInfosignPage = 'app://page/mine/myinfosignPage'; //个人签名
  static const myInfoNicknmae = 'app://page/mine/myinfNickname'; //个人昵称
  static const myInfoMobile = 'app://page/mine/myinfMobile'; //修改手机号
  static const myInfoPwd = 'app://page/mine/myinfPwd'; //修改密码
  static const myComplaint = 'app://page/mine/mycomplaint'; //投诉建议
  static const myAbout = 'app://page/mine/myabout'; //关于我们
  static const myNews = 'app://page/mine/mynews'; //我的消息
  static const stuDetail = 'app://page/studentclock/studetail'; //学员进度更新


  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        case forgetPage: //忘记密码页面
          return Forget();
        case loginPage: //登录页面
          return Login();
        case registerPage: //注册页面
          return Register();
        case userAgreement: //用户协议
          return UserAgreement();
        case privacyAgreement: //隐私协议
          return PrivacyAgreement();
        case tabNavigator: //路由到首页
          return TabNavigator();
        case myClockRecord: //我的打卡记录
          return MyClockRecord();
        case stuClock: //学员打卡
          return StuClock();
        case stuClockList: //学员打卡列表
          return StuClockList();
        case stuClockRecord: //学员打卡记录
          return StuClockRecord();
        case homePage: //首页
          return HomePage();
        case myInfoPage: //个人信息
          return MyInfoPage();
        case myInfosignPage: //个人签名
          return MyInfoSignature();
        case myInfoNicknmae://个人昵称
          return MyInfoNickname();
        case myInfoMobile: //修改手机号
          return MyInfoEditMobile(params);
        case myInfoPwd://修改密码
          return MyInfoPwd();
        case myComplaint://投诉建议
          return MyComplaint();
        case myAbout://关于我们
          return MyAbout();
        case myNews: //我的消息
          return MyNews();
        case stuDetail://学员进度更新
          return StuDetail();
        case stuSearch://学员搜索
          return StuSeartch();
      }
    }
    return null;
  }

  // 无参
  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }
  // 有参
  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
  // 带动画
  Router.pushWithAnimation(BuildContext context, String url, dynamic params) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 700), //动画时间为500毫秒
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return new FadeTransition(
                  //使用渐隐渐入过渡,
                  opacity: animation,
                  child: _getPage(url, params));
            }));
  }

  Widget WebViewPage(String url, {params}) {}
}
