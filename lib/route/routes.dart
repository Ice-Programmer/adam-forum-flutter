import 'package:adam_forum_app/pages/login/login_page.dart';
import 'package:adam_forum_app/pages/register/register_page.dart';
import 'package:adam_forum_app/pages/welcome/welcome_page.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  navigatorKey: ToastUtils.navigatorKey,
  routes: [
    GoRoute(
      path: '/', // 根路径
      name: '欢迎页',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: WelcomePage()),
    ),
    GoRoute(
      path: "/login",
      name: "登录页",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: "/register",
      name: "注册页",
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: RegisterPage()),
    ),
  ],
);
