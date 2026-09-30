import 'package:go_router/go_router.dart';
import 'package:mobile/features/home/home_view.dart';
import 'package:mobile/features/queue/queue_view.dart';

import '../features/queue/model/queue_session.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/queue',
      name: 'queue',
      builder: (context, state) {
        final queue = state.extra as QueueSession;

        return QueueView(givenQueue: queue);
      },
    ),
  ],
);
