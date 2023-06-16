
import '../../model/user_model.dart';

class AppStrings{
  static String appTitle = 'Users Info';
  static String users = 'Users';
  static String userDeletedSuccessfully = 'User Deleted Successfully';
  static String somethingWentWrong = 'Something Went Wrong';

  static String nameHintText = 'name';
  static String emailHintText = 'email';
  static String addressHintText = 'address';
  static String mobileHintText = 'mobile number';

  static String invalidEmail = 'email is not in proper format';
  static String invalidMobile = 'Mobile Number should be 10 character long';

  static String detailsTitles(User? user) => user != null ? 'Edit User' : 'User Details';
  static String submitButtonTitle(User? user) => user != null ? 'Update Details' : 'Add User';
  static String pleaseProvideValid({required detail}) => 'Please Provide Valid $detail';


}