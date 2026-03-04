import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String titulo;
  final Widget child;

  const InfoCard({super.key, required this.titulo, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
