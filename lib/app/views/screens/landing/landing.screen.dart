import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/app/views/components/error/error.view.dart';
import 'package:mon_app_flutter/app/views/components/loading/loading.view.dart';
import 'package:mon_app_flutter/app/views/screens/landing/landing.state.dart';
import 'package:mon_app_flutter/app/views/screens/landing/landing.view_model.dart';

@RoutePage()
class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<LandingState> state = ref.watch(landingViewModelProvider);
    final LandingViewModel viewModel = ref.watch(
      landingViewModelProvider.notifier,
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return state.when(
      data: (LandingState data) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              bottom: false,
              child: Column(
                spacing: 16,
                children: <Widget>[
                  const Spacer(flex: 5),
                  const Spacer(flex: 5),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'title',
                          style: textTheme.displayLarge?.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: viewModel.navigateToHome,
                    child: Text('hey'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error:
          (Object error, StackTrace stackTrace) =>
              ErrorView(error: error.toString()),
      loading: () => const LoadingView(),
    );
  }
}
