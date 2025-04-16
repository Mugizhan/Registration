import 'package:form1/ui/register.dart';
import 'package:go_router/go_router.dart';

class AppRouter{

 static GoRouter router=GoRouter(
     initialLocation: '/',
     routes: [
   GoRoute(
       name:'register',
       path: '/',
       builder: (context,state)=>RegisterScreen()
   ),
 ]);
}