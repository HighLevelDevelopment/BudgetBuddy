import 'package:budgetbuddy/common/my_theme.dart';
import 'package:budgetbuddy/spent/controllers/spent_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SpentTableWidget extends StatefulWidget {
  const SpentTableWidget({super.key});

  @override
  State<SpentTableWidget> createState() => _SpentTableWidgetState();
}

class _SpentTableWidgetState extends State<SpentTableWidget> {
  final SpentTableController spentTableController = Get.put(SpentTableController());
  final PagingController pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    spentTableController.fetchData();
    pagingController.itemList = spentTableController.spents;
    pagingController.nextPageKey = null;
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        _getHeader(),
        const Divider(
          thickness: 2,
          color: MyTheme.highlightColor,
        ),
        _getBody(),
      ]),
    );
  }

  Widget _getHeader() {
    return Row(
      children: [
        _getTitle('Description', 2, () {}),
        _getTitle('Category', 1, () {}),
        _getTitle('Type', 1, () {}),
        _getTitle('Value', 1, () {}),
      ],
    );
  }

  Widget _getTitle(String title, int flex, void Function()? onTap) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title, 
                style: const TextStyle(
                  color: MyTheme.highlightColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
              )
            )
          )
        ),
      )
    );
  }

  Widget _getBody() {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: PagedListView.separated(
          pagingController: pagingController, 
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              dynamic data = item;
              return SizedBox(
                height: 40,
                child: Row(
                  children: [
                    _getField(data.description, 2),
                    _getField(data.category, 1),
                    _getField(data.type, 1),
                    _getField(data.spentAmount, 1),
                  ]
                ),
              );
            }
          ), 
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.5,
            color: MyTheme.darkColor,
          ),
        ),
      ),
    );
  }

  Widget _getField(dynamic data, int flex) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          data.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}