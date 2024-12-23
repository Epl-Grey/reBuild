import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSources{
    Future<AuthResponse> signInUser(String email, String password);
    Future<AuthResponse> signUpUser(String email, String password, String name, String surname, bool isCustomer);
    Future<void> signOutUser();
    String getMyId();
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  final SupabaseClient supabaseClient;

  UserRemoteDataSourcesImpl({required this.supabaseClient});

  @override
  Future<AuthResponse> signInUser(String email, String password) async {
    return await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthResponse> signUpUser(String email, String password, String name, String surname, bool isCustomer) async {
    return await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'surname': surname,
        'isCustomer': isCustomer,
      }
    );
  }

  @override
  Future<void> signOutUser() async {
    return await supabaseClient.auth.signOut();
  }
  
  @override
  String getMyId() => supabaseClient.auth.currentUser!.id;
}