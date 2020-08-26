import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Barber.dart';
import 'package:vintage_barber/Models/Booking.dart';
import 'package:vintage_barber/Models/Package.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/packageRepository.dart' as packageRepo;
import 'package:vintage_barber/Repository/barberRepository.dart' as barberRepo;
import 'package:vintage_barber/Repository/bookingRepository.dart' as bookingRepo;

class bookingViewModel implements MyRequest {

  getAllPackages() async {
    final result = await packageRepo.getPackages();
    if (result is List<Package> && result != null ) {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  addBooking() async {
    MyConstant.booking.user = APIConstant.CURRENT_USER.id;
    final result = await bookingRepo.submitAppointment(MyConstant.booking);
    isloading = true;
    if (result != null && result == "success") {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  getAllBarbers() async {
    final result = await barberRepo.getBarbers();
    if (result is List<Barber> && result != null ) {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  getAllBookings() async {
    final result = await bookingRepo.getBookings();
    if (result is List<Booking> && result != null ) {
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