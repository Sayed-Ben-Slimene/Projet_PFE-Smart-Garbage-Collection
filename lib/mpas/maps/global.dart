import 'package:firebase_auth/firebase_auth.dart';

import '../../UsersInfo/User.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
