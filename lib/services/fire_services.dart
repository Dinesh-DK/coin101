import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FireServices {
  FireServices._();

  static FireServices? _instance;

  static late FirebaseApp fbApp; 

  static FirebaseDatabase db = FirebaseDatabase.instance;

  static FireServices get instance {
    if(_instance == null) {
      _instance = FireServices._();
    }
    return _instance!;
  }

  void initilizeFirebase() async {
    // fbApp = await Firebase.initializeApp();
  }
}