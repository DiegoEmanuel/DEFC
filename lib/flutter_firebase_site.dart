import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/widgets/custom/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_site/screens/home.dart';
import 'package:flutter_firebase_site/widgets/nav_bar.dart';

import 'providers/navigation_provider.dart';
import 'screens/about.dart';
import 'screens/contacts.dart';
import 'screens/prices.dart';
import 'theme/theme.dart';

class FlutterFirebaseSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Site',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<NavigationProvider>(create: (_) => NavigationProvider()),
      ], builder: (ctx, w) => Home()),
    );
  }
}

const _titles = [
  'Home',
  'About',
  'Prices',
  'Contacts',
];

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Widget _buildScreen(
    int index,
    GlobalKey scaffoldKey,
  ) {
    switch (index) {
      case 0:
        return HomeScreen(scaffoldKey: scaffoldKey);
      case 1:
        return About(scaffoldKey: scaffoldKey);
      case 2:
        return Prices(scaffoldKey: scaffoldKey);
      case 3:
        return Contacts(scaffoldKey: scaffoldKey);
      default:
        return HomeScreen(scaffoldKey: scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    NavBar(
                      titles: _titles,
                      scaffoldKey: _scaffoldKey,
                      selectedIndex: navigationProvider.selectedIndex,
                      onItemSelected: (int index) => navigationProvider.selectedIndex = index,
                      style: theme.textTheme.displaySmall,
                      selectedStyle: theme.textTheme.displaySmall!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: _buildScreen(
                        navigationProvider.selectedIndex,
                        _scaffoldKey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      drawer: CustomDrawer(
        titles: _titles,
        selectedIndex: navigationProvider.selectedIndex,
        onItemSelected: (int index) => navigationProvider.selectedIndex = index,
        style: theme.textTheme.displaySmall!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        selectedStyle: theme.textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        selectedBackgroundColor: theme.colorScheme.background,
      ),
    );
  }
}
