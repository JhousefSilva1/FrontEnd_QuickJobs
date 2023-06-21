import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/models/request_model.dart';
import 'package:quickjobsbol/src/services/services.dart';

class RequestService{
  final _services = Services();

  Future<List<RequestModel>> getRequest() async{
    String url = '${Globals.apiUrl}/requests';
    final response = await _services.getHttp(url, 1);
    if(response.statusCode == 200){
      final requestModel = requestModelFromJson(response.body);
      return requestModel;
    }else{
      return [];
    }
  }
}