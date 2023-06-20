import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/models/service_model.dart';
import 'package:quickjobsbol/src/services/services.dart';

class ServiceService{
  final _services = Services();

  Future<List<ServiceModel>> getService() async{
    String url = '${Globals.apiUrl}/services';
    final response = await _services.getHttp(url, 1);
    if(response.statusCode == 200){
      final serviceModel = serviceModelFromJson(response.body);
      return serviceModel;
    }else{
      return [];
    }
  }

}