import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Logic/nav/navigation_cubit.dart';
import 'package:furnizone/Presentation/Pages/AddProductPage.dart';
import 'package:furnizone/Presentation/Pages/HomePages/ProfilePage.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class MainScreen extends StatelessWidget {
  final bool isAdmin;
  static String id = 'Main';

  MainScreen({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        final pages = [
          HomeScreen(),
          FavoritesScreen(),
          if (isAdmin)  AddProductPage(),
          CartScreen(),
          ProfilePage(),
        ];

        return Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 69,
                decoration: const BoxDecoration(
                  color: Color(0xff4A628A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: BottomNavigationBar(
                  items: [
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.home_outlined,
                          size: 26,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.home,
                          size: 26,
                        ),
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.favorite_outline,
                          size: 26,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.favorite,
                          size: 26,
                        ),
                      ),
                    ),
                    if (isAdmin)
                      const BottomNavigationBarItem(
                        label: '',
                        icon: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Icon(
                            Icons.add_outlined,
                            size: 26,
                          ),
                        ),
                        activeIcon: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Icon(
                            Icons.add,
                            size: 26,
                          ),
                        ),
                      ),
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 26,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 26,
                        ),
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.person_outline,
                          size: 26,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.person,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    context.read<NavigationCubit>().navigateTo(index);
                  },
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  elevation: 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
