import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/bloc/home_bloc/home_bloc.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: SlotLayout(config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key('mobile'),
          builder: (context) => const StatisticMobileScreen(),
        )
      }),
    );
  }
}


class StatisticMobileScreen extends StatelessWidget {
  const StatisticMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Header with title and TabBar
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple[800],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A52A2), // Background of pill tab bar
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFFD6BBF7),
                      labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: "My Country"),
                        Tab(text: "Global"),
                      ],
                    ),
                  )




                ],
              ),
            ),
            
            Expanded(child: Text('body'))
            // TabBarView for content

          ],
        ),
      ),
    );
  }
}
