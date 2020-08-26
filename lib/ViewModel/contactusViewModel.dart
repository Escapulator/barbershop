import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/aboutusRepository.dart'as contactusRepo;

class contactusViewModel implements MyRequest {

  getContactUs() async {
    final result = await (contactusRepo.getAboutUs());
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