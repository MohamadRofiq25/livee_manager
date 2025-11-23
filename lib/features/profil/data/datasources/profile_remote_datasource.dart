import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return ProfileModel(
      id: "1",
      name: "Mohamad Rofiqul. A.",
      email: "mohamadrofiq@gmail.com",
      phone: "0812 3456 7890",
      role: "Operator / Admin",
      image: "assets/logo.png",
    );
  }
}
