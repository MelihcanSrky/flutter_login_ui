import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/feature/map/widgets/custom_icon_button.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              buildTopBar(context),
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.5, -0.09),
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            backgroundColor: Theme.of(context).backgroundColor,
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/icons/map.svg",
              height: Dimens.margin_32.h,
              width: Dimens.margin_32.w,
            )),
        SizedBox(
          height: Dimens.margin_8.h,
        ),
        FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/icons/send-2.svg",
            )),
      ]),
    );
  }

  Container buildTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          // left: Dimens.margin_16.w,
          // right: Dimens.margin_16.w,
          top: Dimens.margin_16.h,
          bottom: Dimens.margin_8.h),
      color: Theme.of(context).highlightColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.margin_16.w,
            ),
            child: Row(
              children: [
                buildBackButton(context),
                SizedBox(
                  width: Dimens.margin_8.w,
                ),
                buildSeachTextField(context)
              ],
            ),
          ),
          SizedBox(
            height: Dimens.margin_8.h,
          ),
          BuildCardList()
        ],
      ),
    );
  }

  Container BuildCardList() {
    return Container(
      height: Dimens.margin_56.h - 4.h,
      child: ListView(
        padding: EdgeInsets.symmetric(
            vertical: Dimens.margin_8.h, horizontal: Dimens.margin_12.w),
        scrollDirection: Axis.horizontal,
        children: [
          CustomIconButton(
            label: "Katman",
            icon: "assets/icons/layer.svg",
          ),
          CustomIconButton(
            label: "Limit Bul",
            icon: "assets/icons/format-square.svg",
          ),
          CustomIconButton(
            label: "Ölçüm",
            icon: "assets/icons/ruler.svg",
          ),
          CustomIconButton(
            label: "Diğerleri",
            icon: "assets/icons/more-circle.svg",
          ),
        ],
      ),
    );
  }

  Expanded buildSeachTextField(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: Dimens.margin_48.h,
        child: CustomTextField(
          labelText: "Haritada arayın...",
          prefixIcon: "assets/icons/search-outline.svg",
          borderRadius: 100,
          floatingLabelBehavior: false,
          prefixIconColor: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }

  Container buildBackButton(BuildContext context) {
    return Container(
      width: Dimens.margin_48.w,
      height: Dimens.margin_48.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Theme.of(context).shadowColor),
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
