import 'package:chek_retail_app/Domain/Models/sort_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({
    super.key,
    required Function(SortTypes p1) applySort,
  }) : _applySort = applySort;

  final Function(SortTypes p1) _applySort;

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  SortTypes _sortValue = SortTypes.noSort;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Сортировка"),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // RadioListTile(
            //     title: Text("Без сортировки"),
            //     value: SortTypes.noSort,
            //     groupValue: _sortValue,
            //     onChanged: (value) {
            //       setState(() {
            //         _sortValue = value!;
            //       });
            //     }),
            // RadioListTile(
            //   title: Text("По имени от А до Я"),
            //   value: SortTypes.byNameAcc,
            //   groupValue: _sortValue,
            //   onChanged: (value) {
            //     setState(() {
            //       _sortValue = value!;
            //     });
            //   },
            // ),
            SizedBox(height: 32),
            SortRadio(
                title: Text("Без сортировки"),
                value: SortTypes.noSort,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value!;
                  });
                }),
            SizedBox(height: 26),
            Divider(),
            Text("По имени"),
            SortRadio(
              title: Text("По имени от А до Я"),
              value: SortTypes.byNameAcc,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            SortRadio(
              title: Text("По имени от Я до А"),
              value: SortTypes.byNameDec,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            Divider(),
            Text("По цене"),
            SortRadio(
              title: Text("По возрастанию"),
              value: SortTypes.byPriceAcc,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            SortRadio(
              title: Text("По убыванию"),
              value: SortTypes.byPriceDec,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            Divider(),
            Text("По типу"),
            SortRadio(
              title: Text("По типу от А до Я"),
              value: SortTypes.byTypeAcc,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            SortRadio(
              title: Text("По типу от Я до А"),
              value: SortTypes.byTypeDec,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            SizedBox(height: 8),

            Expanded(
              child: Container(),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("ГОТОВО"),
                onPressed: () {
                  widget._applySort(SortTypes.byNameAcc);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortRadio extends StatelessWidget {
  Widget title;
  SortTypes value;
  SortTypes groupValue;
  Function(SortTypes value) onChanged;

  SortRadio({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: value == groupValue
                  ? Border.all(width: 7, color: Colors.green)
                  : Border.all(width: 2, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 16),
          title,
        ],
      ),
    );
  }
}
