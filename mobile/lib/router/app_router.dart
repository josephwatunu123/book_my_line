import 'package:go_router/go_router.dart';
import 'package:mobile/features/home/home_view.dart';
import 'package:mobile/features/queue_info/model/queue_session.dart';
import 'package:mobile/features/queue_info/queue_info_view.dart';

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

        return QueueInfoView(givenQueue: queue);
      },
    ),
  ],
);
