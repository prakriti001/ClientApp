import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/api.dart';  
 
   
void main() => runApp(MyApp());  
   
class MyApp extends StatelessWidget {  
 @override  
 Widget build(BuildContext context) {  
   return MaterialApp(  
     theme: ThemeData(  
       primarySwatch: Colors.purple,  
     ),  
     home: ClientPage(),  
   );  
 }  
}  
   
class ClientPage extends StatefulWidget {  
 @override  
 _ClientPageState createState() => _ClientPageState();  
}  
   
class _ClientPageState extends State<ClientPage> {  
 @override  
 Widget build(BuildContext context) {  
   return Scaffold(  
     appBar: AppBar(  
       title: Text('ListExample'),  
     ),  
     body: FutureBuilder( 
        
       future: ApiService.getDetails(), 
        
       builder: (context, snapshot) { 
         final client = snapshot.data;  
          
         if (snapshot.connectionState==ConnectionState.done) {
           
           print(snapshot.data); 
           return ListView.separated(  
             separatorBuilder: (context, index) {  
               return Divider(  
                 height: 2,  
                 color: Colors.black,  
               );  
             },  
             itemBuilder: (context, index) {  
               return ListTile(  
                 title: Text(client['clients'][index]['name']),  
                 subtitle: Text(client['clients'][index]['company']),  
               );  
             },  
             itemCount: client['clients'].length,  
           );  
         }  
         else{return Center(  
           child: CircularProgressIndicator(),  
         );}  
       },  
     ),  
      
   );  
 }  
}  