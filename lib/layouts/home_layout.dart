import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;

  const HomeLayout({super.key, required this.child});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _index = 0;
  final List<String> tabRoutes = ["/forum", "/chat", "/shop", "/person"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      bottomNavigationBar: _getBottomNavigator(context),
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const CircleBorder(), // 确保按钮是圆形的
        child: Icon(
          Icons.add_rounded,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }

  Widget _getBottomNavigator(BuildContext context) {
    return StylishBottomBar(
      currentIndex: _index,
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      notchStyle: NotchStyle.circle,
      onTap: (index) {
        setState(() {
          _index = index;
        });
        context.go(tabRoutes[_index]);
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      items: [
        BottomBarItem(
          icon: const Icon(Icons.home_rounded),
          title: const Text("首页"),
          selectedColor: Theme.of(context).colorScheme.primary,
          unSelectedColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        BottomBarItem(
          icon: Container(
            margin: EdgeInsets.only(right: 15.w),
            child: const Icon(Icons.chat_rounded),
          ),
          title: Container(
            margin: EdgeInsets.only(right: 15.w),
            child: const Text("消息"),
          ),
          selectedColor: Theme.of(context).colorScheme.primary,
          unSelectedColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        BottomBarItem(
          icon: Container(
            margin: EdgeInsets.only(left: 15.w),
            child: const Icon(Icons.shopping_cart_rounded),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 15.w),
            child: const Text("商城"),
          ),
          selectedColor: Theme.of(context).colorScheme.primary,
          unSelectedColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        BottomBarItem(
          icon: const Icon(Icons.person_rounded),
          title: const Text("个人"),
          selectedColor: Theme.of(context).colorScheme.primary,
          unSelectedColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      ],
      option: AnimatedBarOptions(
        iconStyle: IconStyle.animated,
      ),
    );
  }
}
