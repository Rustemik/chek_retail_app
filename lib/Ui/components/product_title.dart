import 'package:chek_retail_app/Domain/Models/sort_type.dart';
import 'package:chek_retail_app/Ui/Components/sort_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsTitle extends StatelessWidget {
  Function(SortTypes) _applySort;
  SortTypes _lastSortType;

  ProductsTitle(
      {super.key,
      required Function(SortTypes) applySort,
      required SortTypes lastSortType})
      : _applySort = applySort,
        _lastSortType = lastSortType;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Список покупок",
          style: theme.textTheme.bodyMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SortBottomSheet(
                  applySort: _applySort,
                  lastSortType: _lastSortType,
                ),
              );
            },
            child: Container(
              height: 32,
              width: 32,
              color: const Color(0xFFF1F1F1),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.sort,
                      size: 24,
                      color: Color(0xFF60607B),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _lastSortType != SortTypes.noSort
                            ? Colors.green
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
