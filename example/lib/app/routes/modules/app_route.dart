import 'package:example/app/modules/account/views/account_page.dart';
import 'package:example/app/modules/error/controllers/error_controller.dart';
import 'package:example/app/modules/error/view/error_page.dart';

import 'package:example/app/modules/login/controllers/login_controller.dart';
import 'package:example/app/modules/login/views/login_page.dart';

import 'package:example/app/modules/profile/controllers/profile_controller.dart';
import 'package:example/app/modules/profile/views/profile_page.dart';
import 'package:example/app/modules/root/bindings/app_bindings.dart';

import 'package:example/app/modules/root/home/views/home_index.dart';

import 'package:example/app/modules/root/message/views/message_page.dart';

import 'package:example/app/modules/root/views/app_component.dart';

import 'package:example/domain/repositories/impl/login/login_provider.dart';
import 'package:example/domain/repositories/impl/login/login_respository_impl.dart';
import 'package:example/domain/repositories/login_respository.dart';
import 'package:flutter_eden/eden.dart';

class AppRoute extends EdenBaseRoute {
  @override
  String get prefix => "/app";

  String get root => "/root";

  String get home => prefix + "/home";
  String get message => prefix + "/message";
  String get account => prefix + "/account";

  ///
  String get login => prefix + "/login";
  String get accountProfile => prefix + "/account/profile";
  String get proxy => prefix + "/proxy";

  /// 找不到页面
  String get error404 => prefix + "/error/unknown404";

  GetPage get unknownRoute => routePage(
      name: error404,
      page: () => ErrorPage(),
      bindingsBuilder: () {
        Get.lazyPut(() => ErrorController());
      });
  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: root,
        page: () => AppComponent(),
        bindings: [
          AppBindings(),
        ],
        // middlewares: [AuthMiddleware(priority: 0)],
        bindingsBuilder: () {
          // Get.lazyPut(() => AppController());
        },
        children: [
          routePage(
            name: home,
            page: () => HomeIndex(),
            bindingsBuilder: () {
              // Get.lazyPut(() => HomeController());
            },
          ),
          routePage(
            name: message,
            page: () => MessagePage(),
            bindingsBuilder: () {
              // Get.lazyPut(() => MessageController());
            },
          ),
          routePage(
            name: account,
            page: () => AccountPage(),
            bindingsBuilder: () {},
          ),
        ],
      ),
      routePage(
        name: proxy,
        page: () => ProxySettingPage(),
        bindingsBuilder: () {},
      ),

      /// login
      routePage(
        name: login,
        page: () => LoginPage(),
        bindingsBuilder: () {
          //dao
          Get.lazyPut<ILoginProvider>(() => LoginProvider());

          //service
          Get.lazyPut<ILoginRespository>(
              () => LoginRespositoryImpl(provider: Get.find()));
          //controller
          Get.lazyPut(() => LoginController(loginRespository: Get.find()));
        },
      ),
      //profile
      routePage(
        name: accountProfile,
        page: () => ProfilePage(),
        bindingsBuilder: () {
          Get.lazyPut(() => ProfileController());
        },
      ),
      routePage(
          name: error404,
          page: () => ErrorPage(),
          bindingsBuilder: () {
            Get.lazyPut(() => ErrorController());
          })
    ];
  }
}
