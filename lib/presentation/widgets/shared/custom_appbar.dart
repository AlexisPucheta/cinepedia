import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary, size: 30),
              SizedBox(width: 10),
              Text('Cinepedia', style: titleStyle),
              const Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
