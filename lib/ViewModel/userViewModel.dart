import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/userRepository.dart' as userRepo;

class userViewModel implements MyRequest {

  login({email, password}) async {
    final result = await userRepo.login(email, password);
    print(result);
    if (result is User && result != null) {
      onSuccess = true;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  register(User user) async {
    final result = await userRepo.register(user);
    print(result);
    if (result != null && result != "success") {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
      return result;
    }
  }


  update(User user) async {
    final result = await userRepo.update(user);
    print(result);
    if (result is User && result != null) {
      onSuccess = true;
      responseMessage = "User Updated";
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  bool isloading = false;

  @override
  bool onSuccess;

  @override
  String responseMessage = "None";
}