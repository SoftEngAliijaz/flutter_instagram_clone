import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/add_post_screen.dart';
import 'package:flutter_instagram_clone/screens/feed_screen.dart';
import 'package:flutter_instagram_clone/screens/profile_screen.dart';
import 'package:flutter_instagram_clone/screens/search_screen.dart';
import 'package:image_picker/image_picker.dart';

class AppUtils {
  // Function for picking an image from a specified source (gallery or camera).
  static pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file =
        await imagePicker.pickImage(source: source); // Picking an image file.
    if (file != null) {
      return await file
          .readAsBytes(); // Returning the bytes of the picked image.
    }
  }

  // Function for displaying snackbars.
  static showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      // Showing a snackbar with the provided text.
      SnackBar(
        content: Text(text),
      ),
    );
  }

  static const webScreenSize =
      600; // Constant for defining the screen size for web.

  // List of widgets representing items on the home screen.
  static List<Widget> homeScreenItems = [
    const FeedScreen(), // Adding feed screen.
    const SearchScreen(), // Adding search screen.
    const AddPostScreen(), // Adding screen for adding a post.
    const Text('notifications'), // Adding a text widget for notifications.
    ProfileScreen(
        uid: FirebaseAuth.instance.currentUser!
            .uid), // Adding profile screen with current user's ID.
  ];
}

class AppColors {
  // Definition of various color constants used in the app.
  static const Color mobileBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color webBackgroundColor = Color.fromRGBO(18, 18, 18, 1);
  static const Color mobileSearchColor = Color.fromRGBO(38, 38, 38, 1);
  static const Color blueColor = Color.fromRGBO(0, 149, 246, 1);
  static const Color primaryColor = Colors.white; // Primary color is white.
  static const Color secondaryColor = Colors.grey; // Secondary color is grey.
}
