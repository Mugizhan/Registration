import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SlotLayout(config: {
      Breakpoints.small:SlotLayout.from(
        key: Key('small'),
        builder: (context)=>HomeMobileView()
      ),
      Breakpoints.mediumAndUp:SlotLayout.from(
          key: Key('large'),
          builder: (context)=>HomeMobileView()
      )
    });
  }
}



class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override
  String? selectedCountry;

  final List<Map<String,String>> country=[
    {
      'logo':'Asset/image/flag/usa.png',
      'name':'USA'
    },
    {
    'logo':'Asset/image/flag/india.png',
      'name':'India'
    },
    {
    'logo':'Asset/image/flag/uae.png',
      'name':'UAE'
    }
  ];
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        leading: Icon(Icons.short_text,color: Colors.white,size: 40),
        actions: [
         Padding(
             padding: EdgeInsets.symmetric(horizontal: 30),
             child: Icon(Icons.notifications_none,color: Colors.white,size: 40)
         ),

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                padding: EdgeInsets.all(30),
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
                         fontSize: 30,
                         fontWeight: FontWeight.bold
                       ),),


                       SizedBox(
                         width: 120,
                         height: 50,
                         child: DropdownButtonFormField(
                           value: selectedCountry ?? 'USA', // Default selected value
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             border: OutlineInputBorder(
                               borderSide: BorderSide.none,
                               borderRadius: BorderRadius.circular(30),
                             ),
                             contentPadding: EdgeInsets.symmetric(horizontal: 12),
                             prefixIcon: Padding(
                               padding: const EdgeInsets.only(left: 1, right: 1),
                               child: Image.asset(
                                 country.firstWhere(
                                       (c) => c['name'] == selectedCountry,
                                   orElse: () => country[0],
                                 )['logo'] ?? '',
                                 width: 30,
                                 height: 30,
                               ),
                             ),
                           ),
                           isExpanded: true,
                           dropdownColor: Colors.white,
                           icon: Icon(Icons.arrow_drop_down_sharp,size: 25),
                           items: country.map((country) {
                             return DropdownMenuItem<String>(
                               value: country['name'],
                               child: Text(
                                 country['name'] ?? '',
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontSize: 15,
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                             );
                           }).toList(),
                           onChanged: (value) {
                             setState(() {
                               selectedCountry = value;
                             });
                           },
                         ),
                       ),



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

                    SizedBox(height: 20),
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
                  )
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,      // Color when selected
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Container(
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              height: 42,
              width: 70,
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            activeIcon: Container(
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 42,
              width: 70,
              child: Icon(Icons.bar_chart),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            activeIcon: Container(
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 42,
              width: 70,
              child: Icon(Icons.newspaper),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            activeIcon: Container(
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 42,
              width: 70,
              child: Icon(Icons.info),
            ),
            label: 'Profile',
          ),
        ],
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
