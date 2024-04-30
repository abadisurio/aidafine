import 'package:aidafine/shared/blocs/user_bloc/user_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox.expand(
            child: ColoredBox(
              color: Colors.red,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/1000/1600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Sign In to Continue'),
                          const SizedBox(height: 12),
                          if (state.authState == AuthState.signedOut)
                            AnimatedSize(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOutCirc,
                              child: state.authState == AuthState.loading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<UserBloc>()
                                            .add(const SignInWithGoogle());
                                      },
                                      child: const Text('Sign In with Google'),
                                    ),
                            )
                          else
                            AnimatedSize(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOutCirc,
                              child: state.authState == AuthState.loading
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<UserBloc>()
                                            .add(const SignOut());
                                      },
                                      child: const Text('Sign Out'),
                                    ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
