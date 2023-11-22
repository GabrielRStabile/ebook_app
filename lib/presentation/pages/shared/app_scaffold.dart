import 'package:ebook_app/presentation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  final destinations = {
    'Início': Icons.home_outlined,
    'Favoritos': Icons.favorite_border_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).extension<AppTheme>()!.primaryColor,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                items: destinations.entries
                    .map(
                      (label) => BottomNavigationBarItem(
                        icon: Icon(label.value),
                        label: label.key,
                      ),
                    )
                    .toList(),
                onTap: (index) {
                  if (_currentIndex == index) return;

                  if (index == 0) {
                    Modular.to.navigate('/home/');
                  } else {
                    Modular.to.navigate('/favorite/');
                  }

                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 80,
            foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Scaffold(
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    systemNavigationBarColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  title: Text(
                    'Estante Virtual',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                body: const RouterOutlet(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
