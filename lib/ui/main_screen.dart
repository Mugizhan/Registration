import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/bloc/home_bloc/home_bloc.dart';
import 'package:form1/bloc/home_bloc/home_event.dart';
import 'package:form1/bloc/home_bloc/home_state.dart';
import 'package:form1/ui/home.dart';
import 'package:form1/ui/statistic.dart';
import 'package:go_router/go_router.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    HomeScreen(),
    StatisticScreen(),
    Center(child: Text("Newspaper")),
    Center(child: Text("Info")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(

        builder: (context, state) {
         final  int index=state.currentIndex;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple[800],
              leading: Icon(Icons.short_text,color: Colors.white,size: 40),
              actions: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:IconButton(onPressed: (){
                      context.go('/');
                    }, icon: Icon(Icons.notifications_none,color: Colors.white,size: 40))
                ),

              ],
            ),
            body: screens[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:index,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              iconSize: 30,
              onTap: (index) {
                context.read<HomeBloc>().add(PageTapped(index:index));
              },

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: 42,
                      width: 70,
                      child: Icon(Icons.home),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  activeIcon: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: 42,
                      width: 70,
                      child: Icon(Icons.bar_chart),
                    ),
                  ),
                  label: 'Statistics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  activeIcon: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: 42,
                      width: 70,
                      child: Icon(Icons.newspaper),
                    ),
                  ),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  activeIcon: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: 42,
                      width: 70,
                      child: Icon(Icons.info),
                    ),
                  ),
                  label: 'Profile',
                ),
              ],

            ),
          );
        },
      ),
    );
  }
}