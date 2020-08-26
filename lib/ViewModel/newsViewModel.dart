
import 'package:vintage_barber/Models/News.dart';
import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/newsRepository.dart'as newsRepo;

class newsViewModel implements MyRequest {

  getAllNews() async {
    final result = await newsRepo.getNews();
    if (result is List<News> && result != null ) {
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