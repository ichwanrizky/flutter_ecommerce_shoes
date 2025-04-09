import 'dart:io';

Map<String, dynamic> handleError(dynamic e) {
  if (e is SocketException) {
    return {
      'status': false,
      'message':
          'Cannot connect to the server. Please check your internet connection.',
    };
  } else if (e is FormatException) {
    return {
      'status': false,
      'message': 'Invalid data format received from the server.',
    };
  } else {
    return {
      'status': false,
      'message': 'An unknown error occurred: ${e.toString()}',
    };
  }
}
