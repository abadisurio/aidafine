import 'package:aidafine/router/aidafine_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainView();
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      physics: const BouncingScrollPhysics(),
      routes: const [
        RoomRoute(),
        DashboardRoute(),
        RoomRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        // log('tabsRouter ${tabsRouter.currentChild?.name}');

        // final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          // appBar: AppBar(
          //   title: Text(context.topRoute.name),
          //   leading: const AutoLeadingButton(),
          // ),
          body: child,
          bottomNavigationBar: Container(
            height: 90,
            color: Colors.black26,
            padding: EdgeInsets.fromLTRB(
              8,
              8,
              8,
              MediaQuery.of(context).padding.bottom + 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 60),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        backgroundColor: Colors.black,
                      ),
                      child: AnimatedSize(
                        alignment: Alignment.topLeft,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutCirc,
                        child: Row(
                          children: [
                            Icon(
                              [Icons.assistant, Icons.home, Icons.qr_code][i],
                              size: 30,
                            ),
                            if (tabsRouter.activeIndex != i)
                              const SizedBox.shrink()
                            else ...[
                              const SizedBox(width: 8),
                              Text(['Assistant', 'Home', 'QRIS'][i]),
                            ],
                          ],
                        ),
                      ),
                      onPressed: () => tabsRouter.setActiveIndex(i),
                    ),
                  ),
                // const Spacer(),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size.square(50),
                //     padding: EdgeInsets.symmetric(horizontal: 24),
                //     backgroundColor: Colors.black,
                //   ),
                //   child: const Text('QRIS'),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
