import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/features/queue/model/queue_session.dart';
import 'package:mobile/widgets/custom_button.dart';

class QueueView extends StatelessWidget {
  const QueueView({super.key, required this.givenQueue});
  final QueueSession givenQueue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.24,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(queueImagePlaceholder),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    givenQueue.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: titleBlue,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: theme.colorScheme.primary.withAlpha(20),
                    ),
                    child: Text(
                      "Talk / Event",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: theme.colorScheme.primary,
                        size: 26,
                      ),
                      Text(
                        "Riverside Square ",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text("Open in Maps")),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: queueInfoCard(
                          context: context,
                          cardColor: theme.primaryColor.withAlpha(40),
                          headlineText: '24 ',
                          subText: 'people waiting',
                          icon: Icons.people,
                          iconColor: theme.colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: queueInfoCard(
                          context: context,
                          cardColor: theme.colorScheme.secondary.withAlpha(40),
                          headlineText: '45 ',
                          subText: 'mins estimated wait',
                          icon: Icons.timelapse_rounded,
                          iconColor: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  CustomButton(
                    buttonText: "Join Queue",
                    buttonColor: theme.colorScheme.secondary,
                    suffixIcon: Icons.arrow_right_alt_outlined,
                    onTap: () async {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget queueInfoCard({
  required IconData icon,
  required BuildContext context,
  required Color cardColor,
  required Color iconColor,
  required String headlineText,
  required String subText,
}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 10,
        children: [
          Icon(icon, size: 28, color: iconColor),
          Expanded(
            child: Text.rich(
              overflow: TextOverflow.clip,
              maxLines: 2,
              TextSpan(
                text: headlineText,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: titleBlue,
                ), // Parent style
                children: <InlineSpan>[
                  TextSpan(
                    text: subText,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: titleBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
