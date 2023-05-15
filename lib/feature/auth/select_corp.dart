import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomTextButton.dart';
import 'package:flutter_netigma_login/res/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    icon: AssetImage("assets/icons/sort.png"),
                    text: Strings.sortByName,
                  ),
                  CustomTextButton(
                    icon: AssetImage("assets/icons/candle-outline.png"),
                    text: Strings.sortByDest,
                  ),
                ],
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
          itemCount: corpsList.length,
          itemBuilder: (context, index) {
            return buildListTile(index, context);
          }),
    );
  }

  Container buildListTile(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: CustomColors.dividerGrey, width: 1.w))),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        leading: Material(
          elevation: 3,
          shadowColor: CustomColors.dividerGrey,
          borderRadius: BorderRadius.circular(Dimens.margin_8.r),
          child: Container(
              padding: EdgeInsets.all(Dimens.margin_8.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.margin_8.r),
                  color: CustomColors.secondaryBlue),
              child: ImageIcon(
                AssetImage("assets/icons/location.png"),
                color: CustomColors.primaryBlue,
              )),
        ),
        title: Text(
          corpsList[index],
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: CustomColors.primaryText),
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
      shadowColor: CustomColors.dividerGrey,
      borderRadius: BorderRadius.circular(Dimens.margin_64),
      child: TextField(
        // style: CustomTypography.h5_regular,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: ImageIcon(
            AssetImage("assets/icons/search-outline.png"),
            color: Colors.black,
          ),
          label: Text("Arama yapın..."),
          labelStyle: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  AppBar buildAppbar(double _height) {
    return AppBar(
      leading: IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/arrow-left.png")),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(Strings.selectCorp, style: CustomTypography.h3),
      toolbarHeight: _height * 0.1.h,
      // bottom: PreferredSize(
      //   child: Container(
      //     color: CustomColors.dividerGrey,
      //     height: 1.0,
      //   ),
      //   preferredSize: Size.fromHeight(1.0),
      // ),
    );
  }
}
