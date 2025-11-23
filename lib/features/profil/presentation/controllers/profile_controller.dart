import 'package:flutter/material.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/get_profile.dart';

class ProfileController extends ChangeNotifier {
  final GetProfile getProfileData;

  ProfileEntity? profile;
  bool isLoading = false;

  ProfileController({required this.getProfileData});

  Future<void> loadProfile() async {
    isLoading = true;
    notifyListeners();

    profile = await getProfileData();
    isLoading = false;

    notifyListeners();
  }
}
