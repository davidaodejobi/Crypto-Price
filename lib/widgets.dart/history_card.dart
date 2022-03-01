import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HistoryCard extends StatelessWidget {
  final String? status;
  final num? marketCap;
  final num? dollarAmount;
  final DateTime? date;
  final String? imageUrl;
  final String? name;

  HistoryCard({
    this.marketCap,
    this.dollarAmount,
    this.date,
    this.status,
    this.imageUrl,
    this.name,
    Key? key,
  }) : super(key: key);

  //check the status of the coin and return the color
  Map<String, Color> stat = {
    'Received': Colors.green,
    'Sent': Colors.red,
  };

  Color? getColor(String status) {
    return stat[status];
  }

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
                Row(
                  children: [
                    Text(
                      marketCap.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        name!,
                        style: Theme.of(context).textTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat.yMMMMd().format(date!),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Text(
            '\$${dollarAmount!.toStringAsFixed(2)}',
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: getColor(status!)),
          ),
        ],
      ),
    );
  }
}
