import 'package:vintage_barber/Models/User.dart';

class APIConstant {
  static User CURRENT_USER = null;
  static const DOMAIN = 'http://vintage.forexprofessortrading.com/';
  static const BASE_URL = 'http://vintage.forexprofessortrading.com/api/';
  static const CONTENT_URL = 'http://vintage.forexprofessortrading.com/';
  static const LOGIN_URL = '${BASE_URL}user/login';
  static const HAIR_PACKAGE_URL = '${BASE_URL}hair/package';
  static const BARBERS_URL = '${BASE_URL}hair/barbers';
  static const APPOINTMENT_SUBMIT_URL = '${BASE_URL}submit/appointments';
  static const ALL_APPOINTMENT_URL = '${BASE_URL}appointments/list';
  static const NEWS_URL = '${BASE_URL}news';
  static const ABOUTUS_URL = '${BASE_URL}more/about/us';
  static const CONTACTUS_URL = '${BASE_URL}more/contact/us';
  static const REGISTRATION_URL = '${BASE_URL}user/registration';
  static const USER_UPDATE_URL = '${BASE_URL}user/update';
  static const PRODUCT_URL = '${BASE_URL}products';
  static const CART_URL = '${BASE_URL}order/place';
}

