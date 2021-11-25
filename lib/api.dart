
import 'dart:convert';
import 'package:http/http.dart' as http;
  
   
class ApiService {  
 static Future<Map<dynamic,dynamic>> getDetails() async {  
   
   final response = await http.get(Uri.parse('https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6'));  
   if (response.statusCode == 200) {  
     
     print(json.decode(response.body));
     return json.decode(response.body);
      
     
   } else {  
     return null;  
   }  
 }  
   
   
}  