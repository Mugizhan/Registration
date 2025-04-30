import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/bloc/home_bloc/home_bloc.dart';
import 'package:form1/bloc/home_bloc/home_state.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_bloc/home_event.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeBloc(),
  child: Scaffold(
    body: SlotLayout(config: {
        Breakpoints.small:SlotLayout.from(
          key: Key('small'),
          builder: (context)=>HomeMobileView()
        ),
        Breakpoints.mediumAndUp:SlotLayout.from(
            key: Key('medium'),
            builder: (context)=>HomeLaptopView()
        )
      }),
  ),
);
  }
}



class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override

  final Map<String, String> countryFlag = {
    'USA': 'Asset/image/flag/usa.png',
    'India': 'Asset/image/flag/india.png',
    'UAE': 'Asset/image/flag/uae.png',
  };

  final List<String> countries = ['USA', 'India', 'UAE'];



 Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    final selectedCountry = state.selectedCountry;
    return Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.75,
                padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.06),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[800],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Covid-19",style: TextStyle(
                         color:Colors.white,
                         fontSize:  30,
                           fontWeight: FontWeight.bold
                       ),
                       ),
                SizedBox(
                  width: 120,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      value: countries.contains(selectedCountry)
                          ? selectedCountry
                          : countries.first,
                      items: countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Row(
                            children: [
                              Image.asset(
                                countryFlag[country] ?? '',
                                width: 35,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Flexible(
                                child: Text(
                                  country,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<HomeBloc>().add(CountryChanged(country: value));
                        }
                      },
                    ),
                  ),
                )


                     ],
                   ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.1),
                    Text("Are you feeling sick?",style: TextStyle(
                        color:Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: MediaQuery.of(context).size.width*0.05),
                    Text("If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",style: TextStyle(
                        color:Colors.grey[200],
                        fontSize: 18,

                    ),),

                    SizedBox(height: MediaQuery.of(context).size.width*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.red[400],
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white,size: 30,),
                            SizedBox(width: 8),
                            Text('Call Now',style: TextStyle(color: Colors.white,fontSize:18),),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.messenger, color: Colors.white,size: 30,),
                            SizedBox(width: 8),
                            Text('Send SMS',style: TextStyle(color: Colors.white,fontSize:18),),
                          ],
                        ),
                      )
                    ],
                  ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prevention',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('Asset/image/logo1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12), // Optional for rounded corners
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Avoid close \ncontact',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ],
                            ),
                            Column(

                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('Asset/image/logo2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12), // Optional for rounded corners
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Clean your \n hands often',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),   textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ],
                            ),Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('Asset/image/logo3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12), // Optional for rounded corners
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Wear a \n facemask',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ), textAlign: TextAlign.center,

                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        image:DecorationImage(image: AssetImage('Asset/image/banner.png'))
                      ),
                    )


                    // Content here
                  ],
                ),
              ),
            ],
          ),
        );
  },
),
      ),

    );
  }
}





class HomeLaptopView extends StatefulWidget {
  const HomeLaptopView({super.key});

  @override
  State<HomeLaptopView> createState() => _HomeLaptopViewState();
}

class _HomeLaptopViewState extends State<HomeLaptopView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text('Laptop'),
    );
  }
}
