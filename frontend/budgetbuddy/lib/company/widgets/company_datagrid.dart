import 'package:budgetbuddy/common/size_config.dart';
import 'package:budgetbuddy/company/controllers/company_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CompanyDatagrid extends StatefulWidget {
  const CompanyDatagrid({super.key});

  @override
  State<CompanyDatagrid> createState() => _CompanyDatagridState();
}

class _CompanyDatagridState extends State<CompanyDatagrid> {
  final PagingController _pagingController = PagingController(firstPageKey: 1);
  final mainController = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getTableHeader()
            ],
          )
        )
      ],
    );
  }

  Padding _getTableHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding * 2),
      child: Text("Hello World"),
    );
  }
}