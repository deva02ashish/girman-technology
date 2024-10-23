import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:girman_technology/src/data_layer/models/users_response_model.dart';

class FirebaseStorageProvider extends ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  UserResponseModel _userResponseModel = UserResponseModel();
  List<Users> _usersList = [];

  List<Users> get usersList => _usersList;

  UserResponseModel get userResponseModel => _userResponseModel;

  /// Method to fetch user data from FireStore
  Future<void> fetchUsersData() async {
    try {
      /// Access the document '1234/234' and retrieve the 'users' field
      DocumentSnapshot documentSnapshot =
          await _fireStore.collection('1234').doc('234').get();

      /// Check if the document exists and contains user data
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        _userResponseModel = UserResponseModel.fromJson(data);
        _usersList = _userResponseModel.users ?? [];
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('No user data found');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  /// Method to search for users by name or location
  void searchUsers(String query) {
    /// Convert query to lowercase for case-insensitive search
    query = query.toLowerCase();

    /// Filter the list of users based on the query
    List<Users> filterList = _usersList.where((user) {
      /// Check if name or location contains the search query
      return user.name!.toLowerCase().contains(query) ||
          user.location!.toLowerCase().contains(query);
    }).toList();

    if (query.isEmpty || query == "") {
      _usersList = _userResponseModel.users ?? [];
      notifyListeners();
    } else {
      _usersList = filterList;
      notifyListeners();
    }
  }
}
