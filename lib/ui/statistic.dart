import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/bloc/home_bloc/home_bloc.dart';
import 'package:form1/bloc/home_bloc/home_state.dart';
import 'package:form1/data/repository/statistics_repository.dart';
import '../bloc/statistics_bloc/statistics_bloc.dart';
import '../bloc/statistics_bloc/statistics_event.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsBloc(
        statisticsRepo: context.read<StatisticRepository>(),
      )..add(StaticPageLoad()), // Corrected to match event class name
      child: SlotLayout(config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key('mobile'),
          builder: (context) => const StatisticMobileScreen(),
        ),
      }),
    );
  }
}


class StatisticMobileScreen extends StatelessWidget {
  const StatisticMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple[800],
      ),
      child: Stack(
        children: [
          SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Container(
                padding: EdgeInsets.all(20),
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
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6A52A2), // Background of pill tab bar
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.black,
                        unselectedLabelColor: const Color(0xFFD6BBF7),
                        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(text: "My Country"),
                          Tab(text: "Global"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Removed Expanded to prevent unbounded height error
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33, // Adjusted height for TabBarView
                      child: const TabBarView(
                        children: [
                          MyCountry(),
                          Center(child: Text("Global")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom:MediaQuery.of(context).size.height*0.0001 ,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ), // Optional: rounded corners for the container
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Daily New Cases',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height:200,
                  decoration: BoxDecoration(
                    image:DecorationImage(image:AssetImage('Asset/image/barchart.png',),fit:BoxFit.fill)
                  ),
                )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}


class MyCountry extends StatefulWidget {
  const MyCountry({super.key});

  @override
  State<MyCountry> createState() => _MyCountryState();
}

class _MyCountryState extends State<MyCountry> {
  final stats = [
    {"label": "Affected", "value": "336,851"},
    {"label": "Death", "value": "9,620", "color": Colors.red},
    {"label": "Recovered", "value": "17,977", "color": Colors.green},
    {"label": "Active", "value": "301,251", "color": Colors.lightBlue},
    {"label": "Serious", "value": "8,702", "color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                indicatorColor: Colors.white,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.transparent),
                  ),

                ),
                tabs: const [
                  Tab(text: "Total"),
                  Tab(text: "Today"),
                  Tab(text: "Yesterday"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: TabBarView(
                  children: [
                    // TOTAL TAB
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  height: 120,
                                  child: Card(
                                   elevation: 10,
                                   color: Colors.orange,
                                   child:Container(
                                     padding: EdgeInsets.all(15),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text('${stats[0]['label']}',style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 17,
                                             fontWeight: FontWeight.w500
                                         ),),
                                         Text('${stats[0]['value']}',style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 25,
                                             fontWeight: FontWeight.w600
                                         ),),
                                       ],
                                     ),
                                   )
                                    ))),
                            Expanded(
                                child: Container(
                                    height: 120,
                                    child: Card(
                                        elevation: 10,
                                        color: Colors.pink,
                                        child:Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${stats[1]['label']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Text('${stats[1]['value']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                            ],
                                          ),
                                        )
                                    ))),


                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 120,
                                    child: Card(
                                        elevation: 10,
                                        color: Colors.green,
                                        child:Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${stats[2]['label']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Text('${stats[2]['value']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                            ],
                                          ),
                                        )
                                    ))),

                            Expanded(
                                child: Container(
                                    height: 120,
                                    child: Card(
                                        elevation: 10,
                                        color: Colors.blue,
                                        child:Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${stats[3]['label']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Text('${stats[3]['value']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                            ],
                                          ),
                                        )
                                    ))),
                            Expanded(
                                child: Container(
                                    height: 120,
                                    child: Card(
                                        elevation: 10,
                                        color: Colors.purple,
                                        child:Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${stats[4]['label']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Text('${stats[4]['value']}',style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                            ],
                                          ),
                                        )
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    const Center(child: Text("Today's Stats")),
                    const Center(child: Text("Yesterday's Stats")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
