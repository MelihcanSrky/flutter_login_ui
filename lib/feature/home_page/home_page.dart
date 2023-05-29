import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/feature/home_page/widgets/operations_grid_card.dart';

import 'package:flutter_netigma_login/res/mock_data.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../map/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      onVerticalDragStart: (details) => _focusNode.unfocus(),
      onHorizontalDragStart: (details) => _focusNode.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).highlightColor,
        body: Stack(children: [
          buildBackgroundImage(_width),
          Container(
            child: Column(children: [
              SizedBox(
                height: (context.highValue.h * 2.5) + context.lowValue.h,
              ),
              Container(
                color: Theme.of(context).backgroundColor.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (context.mediumValue.h * 3) + context.lowValue.h,
                      vertical: context.lowValue.h),
                  child: Row(children: [
                    Image.asset(
                      "assets/images/Ellipse-19.png",
                      height: 70.h,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: Text("Ankara Büyükşehir Belediyesi",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).primaryColorDark)),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSearchTextField(),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        Strings.operations,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                    SizedBox(
                      height: context.normalValue.h,
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 114 / 90,
                        crossAxisSpacing: context.lowValue.w,
                        mainAxisSpacing: context.lowValue.h,
                      ),
                      itemCount: operationList.length,
                      itemBuilder: (context, index) {
                        return OperationGridCard(
                            isShadowBox: false,
                            onTap: () {
                              if (operationList[index]["label"] == "Harita") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapPage()));
                              } else {
                                SnackBar snackBar = SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text(
                                      "${operationList[index]["label"]} tıklandı."),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            iconPath: operationList[index]["iconPath"],
                            label: operationList[index]["label"]);
                      },
                    )
                  ],
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }

  Container buildBackgroundImage(double _width) {
    return Container(
      child: Image.asset(
        "assets/images/homepage-bg.png",
        fit: BoxFit.fitWidth,
        width: _width,
      ),
    );
  }

  Widget buildSearchTextField() {
    return CustomTextField(
      isShadowBorder: true,
      isSearchBox: true,
      focusNode: _focusNode,
      controller: _searchController,
      labelText: "Arama yapın...",
      borderRadius: 100,
      floatingLabelBehavior: false,
      verticalPadding: context.highValue.h / 2,
    );
  }
}
