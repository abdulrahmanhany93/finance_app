import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/models/userModel.dart';
import 'package:scoped_model/scoped_model.dart';

class UserController extends Model {
  bool _isGetDataLoading = true;

  bool get isGetDataLoading => _isGetDataLoading;

  UserModel _userData;

  UserModel get userData => _userData;
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  getData(String userId) async {
    _isGetDataLoading = true;
    notifyListeners();
     await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) {
      final UserModel _userModel = UserModel(
          balance: value['balance'],
          email: value['email'],
          name: value['name'],
          visa: value['visa'],
          numberOfAcc: value['numberOfAcc'],
          visaExpire: value['visaExpire']);

      _userData = _userModel;
    });

    _isGetDataLoading = false;
    notifyListeners();
  }
}
