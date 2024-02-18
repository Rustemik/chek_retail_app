import 'package:flutter/material.dart';

class Totals extends StatelessWidget {
  const Totals({
    super.key,
    required int totalCount,
    required int totalPrice,
  })  : _totalCount = totalCount,
        _totalPrice = totalPrice;

  final int _totalCount;
  final int _totalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "В вашей покупке",
          style: theme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$_totalCount товаров",
              style: theme.textTheme.bodySmall,
            ),
            Text(
              "$_totalCount руб",
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Скидка 5%",
              style: theme.textTheme.bodySmall,
            ),
            Text(
              "-50 руб",
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Итого",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text("${_totalPrice - 50} руб",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
