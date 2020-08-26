import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/aboutusRepository.dart'as aboutusRepo;

class aboutusViewModel implements MyRequest {

  getAboutUs() async {
    final result = await (aboutusRepo.getAboutUs());
    if (result != null ) {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  bool isloading = true;

  @override
  bool onSuccess;

  @override
  String responseMessage = "None";
}