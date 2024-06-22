import 'package:fcis_guide/extensions/routes.dart';
import 'package:flutter/material.dart';
import '../../view/profile/profile.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()
        {
          context.normalNewRoute(Profile());
        },
        icon: const Icon(Icons.person,color: Colors.white),
    );
  }
}

