import 'package:adam_forum_app/pages/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(

  routes: [
    GoRoute(
      path: '/', // 根路径
      builder: (context, state) => const WelcomePage(),
    ),
  ],
);

