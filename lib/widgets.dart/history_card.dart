import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String? status;
  final String? cryptoAmount;
  final String? dollarAmount;
  final String? date;
  final String? imageUrl;

  const HistoryCard({
    this.cryptoAmount,
    this.dollarAmount,
    this.date,
    this.status,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 16,
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  status!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                Text(
                  cryptoAmount!,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 10),
                Text(
                  date!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Text(
            dollarAmount!,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: randomGenerator()),
          ),
        ],
      ),
    );
  }
}
