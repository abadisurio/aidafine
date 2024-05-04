import 'package:aidafine/app/themes/text_theme.dart';
import 'package:aidafine/engine/engine.dart';
import 'package:flutter/material.dart';

class BubbleCarousel extends StatelessWidget {
  const BubbleCarousel({
    required this.catalogs,
    super.key,
  });

  final List<Catalog> catalogs;

  static const double size = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) {
          return const SizedBox(width: 8);
        },
        // physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.red,
              border: Border.all(
                color: Theme.of(context).textTheme.bodyMedium?.color ??
                    Colors.white,
              ),
            ),
            height: size,
            width: size,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Produk keuangaaan $index ',
                  style: TextStyleTheme(context).titleLarge,
                ),
                const Text('Deskripsi lalalala hahaha haha'),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      [
                        Icons.monetization_on_outlined,
                        Icons.food_bank_outlined,
                        Icons.save_outlined,
                      ][index % 3],
                      size: 40,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Lihat'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
