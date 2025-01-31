import 'package:adam_forum_app/layouts/home_layout.dart';
import 'package:adam_forum_app/pages/chat/chat_page.dart';
import 'package:adam_forum_app/pages/forum/forum_page.dart';
import 'package:adam_forum_app/pages/login/login_page.dart';
import 'package:adam_forum_app/pages/person/person_page.dart';
import 'package:adam_forum_app/pages/register/register_page.dart';
import 'package:adam_forum_app/pages/shop/shop_page.dart';
import 'package:adam_forum_app/pages/welcome/welcome_page.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  navigatorKey: ToastUtils.rootNavigatorKey,
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
    ShellRoute(
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: HomeLayout(child: child));
      },
      routes: [
        GoRoute(
          path: '/forum',
          name: '论坛',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ForumPage()),
        ),
        GoRoute(
          path: '/chat',
          name: '聊天',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatPage()),
        ),
        GoRoute(
          path: '/shop',
          name: '电商',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ShopPage()),
        ),
        GoRoute(
          path: '/person',
          name: '个人',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: PersonPage()),
        ),
      ],
    ),
  ],
);
