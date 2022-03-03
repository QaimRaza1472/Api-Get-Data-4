import 'package:api_get_data_4/Models/app_info.dart';
import 'package:http/http.dart' as http;



 class Api_Manager{

 Future <List<AlbumModel>?> TestData()async {
      var client=http.Client();
      var responseString=null;
      var url=Uri.parse("https://jsonplaceholder.typicode.com/comments");
      var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      try {
        if (response.statusCode == 200) {
           responseString = response.body;
          print("---------------- Response ---------------");
          print(response.body);
          print("---------------- Response ---------------");
          return albumModelFromJson(responseString);
        }
      }catch (Exception){
         return albumModelFromJson(responseString);
   }
  }
}












/*


class Testing_Api_Manager{

  Future <List<AlbumModel>> TestData() async {
    var client= http.Client();
    var responseString;
    try{

      var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      print("---------------------------------");
      print(response.body);
      print("---------------------------------");
      var responseString= response.body;
      return albumModelFromJson(responseString);
    }
    catch  (Exception) {
      return albumModelFromJson(responseString);
    }
  }

}*/
