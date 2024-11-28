// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!


Future<bool> changePasswordError(String? newPassword) async {
  try {
    final response = await SupaFlow.client.auth
        .updateUser(UserAttributes(password: newPassword));

    // Return true if the response contains a user
    return response.user != null;
  } catch (error) {
    // Handle errors if needed
    print('Error: $error');
    FFAppState().update(() {
      FFAppState().customError = 'Error: $error';
    });
    // Indicate that the password change failed
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
