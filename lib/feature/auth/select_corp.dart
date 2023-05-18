import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_button.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/res/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../../res/strings.dart';
import '../../res/typography.dart';
import 'login.dart';

class SelectCorpPage extends StatefulWidget {
  const SelectCorpPage({Key? key}) : super(key: key);

  @override
  State<SelectCorpPage> createState() => _SelectCorpPageState();
}

class _SelectCorpPageState extends State<SelectCorpPage> {
  late List mockCorpsList;

  @override
  void initState() {
    super.initState();
    mockCorpsList = corpsList;
  }

  void sortListByName() {
    setState(() {
      mockCorpsList.sort((a, b) => a["corp"].compareTo(b["corp"]));
    });
  }

  void sortListByDest() {
    setState(() {
      mockCorpsList.sort((a, b) => a["dest"].compareTo(b["dest"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppbar(_height),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimens.margin_16.w),
          child: Column(
            children: [
              SizedBox(
                height: Dimens.margin_16.h,
              ),
              buildSearchTextField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    icon: "assets/icons/sort.svg",
                    text: Strings.sortByName,
                    onPressed: sortListByName,
                  ),
                  CustomTextButton(
                    icon: "assets/icons/candle-outline.svg",
                    text: Strings.sortByDest,
                    onPressed: sortListByDest,
                  ),
                ],
              ),
              SizedBox(
                height: Dimens.margin_8.h,
              ),
              buildListView()
            ],
          ),
        ));
  }

  Expanded buildListView() {
    return Expanded(
      child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: mockCorpsList.length,
          itemBuilder: (context, index) {
            return buildListTile(index, context);
          }),
    );
  }

  Container buildListTile(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).dividerColor, width: 1.w))),
      child: ListTile(
        leading: Material(
            elevation: 3,
            shadowColor: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(Dimens.margin_8.r),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.margin_8.w, vertical: Dimens.margin_8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.margin_8.r),
                  color: Theme.of(context).cardColor),
              child: SvgPicture.asset(
                "assets/icons/location.svg",
              ),
            )),
        title: Text(
          mockCorpsList[index]["corp"].toString(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
      ),
    );
  }

  Widget buildSearchTextField() {
    return Material(
      elevation: 2,
      shadowColor: Theme.of(context).dividerColor,
      borderRadius: BorderRadius.circular(Dimens.margin_64),
      child: CustomTextField(
        labelText: "Arama yapın...",
        prefixIcon: "assets/icons/search-outline.svg",
        borderRadius: 100,
        floatingLabelBehavior: false,
        prefixIconColor: Theme.of(context).primaryColorDark,
      ),
    );
  }

  AppBar buildAppbar(double _height) {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(Strings.selectCorp,
          style: CustomTypography.h3
              .copyWith(color: Theme.of(context).primaryColorDark)),
      toolbarHeight: _height * 0.1.h,
    );
  }
}
