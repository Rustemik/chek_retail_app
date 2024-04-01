import 'package:chek_retail_app/Domain/Models/sort_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({
    super.key,
    required Function(SortTypes p1) applySort,
    required SortTypes lastSortType,
  })  : _applySort = applySort,
        _lastSortType = lastSortType;

  final Function(SortTypes p1) _applySort;
  final SortTypes _lastSortType;

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState(_lastSortType);
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  SortTypes _sortValue;

  _SortBottomSheetState(SortTypes lastSortType) : _sortValue = lastSortType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.90,
        minHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SizedBox(
        width: double.infinity,
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
                  Text(
                    "Сортировка",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
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
                  title: Text(
                    "Без сортировки",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  value: SortTypes.noSort,
                  groupValue: _sortValue,
                  onChanged: (value) {
                    setState(() {
                      _sortValue = value!;
                    });
                  }),
              SizedBox(height: 20),
              Divider(),
              Text(
                "По имени",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 18),
              SortRadio(
                title: Text(
                  "По имени от А до Я",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                value: SortTypes.byNameAcc,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
              ),
              SizedBox(height: 36),
              SortRadio(
                title: Text(
                  "По имени от Я до А",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                value: SortTypes.byNameDec,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                "По цене",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 18),
              SortRadio(
                title: Text(
                  "По возрастанию",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                value: SortTypes.byPriceAcc,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
              ),
              SizedBox(height: 36),
              SortRadio(
                title: Text(
                  "По убыванию",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                value: SortTypes.byPriceDec,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
              ),
              SizedBox(height: 26),
              Divider(),
              Text(
                "По типу",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 18),
              SortRadio(
                title: Text(
                  "По типу от А до Я",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                value: SortTypes.byTypeAcc,
                groupValue: _sortValue,
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
              ),
              SizedBox(height: 36),
              SortRadio(
                title: Text(
                  "По типу от Я до А",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff67CD00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Готово",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    widget._applySort(_sortValue);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
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
