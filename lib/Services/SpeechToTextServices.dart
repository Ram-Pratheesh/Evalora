// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class SpeechToTextService {
//   final stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;

//   /// Initialize speech recognition
//   Future<bool> initialize() async {
//     try {
//       bool available = await _speech.initialize(
//         onError: (error) => print('Error: $error'),
//       );
//       return available;
//     } catch (e) {
//       print('Error during initialization: $e');
//       return false;
//     }
//   }

//   /// Start listening and return recognized words via callback
//   void startListening(Function(String) onResult) {
//     if (!_isListening) {
//       _isListening = true;
//       _speech.listen(
//         onResult: (result) => onResult(result.recognizedWords),
//         listenFor: Duration(minutes: 1),
//         cancelOnError: true,
//       );
//     }
//   }

//   /// Stop listening
//   void stopListening() {
//     if (_isListening) {
//       _isListening = false;
//       _speech.stop();
//     }
//   }

//   /// Cancel ongoing recognition
//   void cancelListening() {
//     if (_isListening) {
//       _isListening = false;
//       _speech.cancel();
//     }
//   }

//   /// Check if listening is active
//   bool get isListening => _isListening;

//   /// Dispose the SpeechToText instance
//   void dispose() {
//     _speech.cancel();
//   }
// }

import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  /// Initialize speech recognition
  /// Returns true if the service is initialized successfully.
  Future<bool> initialize() async {
    try {
      bool available = await _speech.initialize(
        onError: (error) => print('Speech-to-Text Error: $error'),
      );
      if (available) {
        print('Speech-to-Text initialized successfully.');
      } else {
        print('Speech-to-Text not available.');
      }
      return available;
    } catch (e) {
      print('Error during Speech-to-Text initialization: $e');
      return false;
    }
  }

  /// Start listening and pass recognized words to the [onResult] callback.
  /// [onResult] is called whenever a new speech recognition result is available.
  void startListening(Function(String) onResult) {
    if (!_isListening) {
      _isListening = true;
      _speech.listen(
        onResult: (result) => onResult(result.recognizedWords),
        listenFor: const Duration(minutes: 1),
        cancelOnError: true,
        onSoundLevelChange: (level) {
          print('Sound level: $level');
        },
      );
      print('Speech-to-Text: Listening started.');
    }
  }

  /// Stop the ongoing listening session.
  void stopListening() {
    if (_isListening) {
      _isListening = false;
      _speech.stop();
      print('Speech-to-Text: Listening stopped.');
    }
  }

  /// Cancel the ongoing listening session.
  void cancelListening() {
    if (_isListening) {
      _isListening = false;
      _speech.cancel();
      print('Speech-to-Text: Listening cancelled.');
    }
  }

  /// Returns whether the service is currently listening.
  bool get isListening => _isListening;

  /// Dispose the SpeechToText instance to free resources.
  void dispose() {
    _speech.cancel();
    print('Speech-to-Text service disposed.');
  }
}
