/// [File] home_screen.dart
///
/// This file holds the app's [HomeScreen]
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/locator.dart';
import '../../../../core/shared/widgets/custom_button.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../error/presentation/widgets/error_wrapper.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc = getIt.get<HomeBloc>();

  @override
  void initState() {
    bloc.add(InitHomeEvent());
    super.initState();
  }

// Logs user out and navigates back to the login screen
  void handleLogOut() {
    bloc.add(LogoutHomeEvent());
    context.pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ErrorWrapper(
      widget: Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen"),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            bloc: bloc,
            listener: (context, state) {
              // Place any logic you want to be triggered by a state change
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    // User image
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: state.user.photoUrl.urlString,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Spacing
                    const SizedBox(
                      height: 50,
                    ),

                    // User name
                    Text(
                      state.user.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // User Bio
                    Text(
                      state.user.bio,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    // Spacing
                    const SizedBox(
                      height: 25,
                    ),

                    // Log out button
                    CustomButton(
                      isGradient: true,
                      function: handleLogOut,
                      isDark: false,
                      activated: true,
                      child: const Text(
                        "Log Out",
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
