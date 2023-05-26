import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/feature/map/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  int? selectedIndex = -1;
  String? selectedLayer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      onVerticalDragStart: (details) => _focusNode.unfocus(),
      onHorizontalDragStart: (details) => _focusNode.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).highlightColor,
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Stack(children: [
          SafeArea(
            bottom: false,
            child: Container(
              child: Column(
                children: [buildTopBar(context), buildMap()],
              ),
            ),
          ),
          if (selectedIndex != -1) buildSlidingUpPanel(context)
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildFloatingActionButtons(context),
      ),
    );
  }

  SlidingUpPanel buildSlidingUpPanel(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: 250,
      backdropEnabled: true,
      backdropOpacity: 0,
      onPanelClosed: () {
        setState(() {
          selectedIndex = -1;
        });
      },
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.highValue),
          topRight: Radius.circular(context.highValue)),
      panel: Container(
        height: 200.h,
        child: Center(
          child: Text(selectedLayer ?? ""),
        ),
      ),
      padding: context.paddingNormalHorizontal,
      header: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This is the header : " + selectedLayer.toString() ?? "",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = -1;
                    });
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/close-circle-twotone.svg",
                  ))
            ],
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }

  Expanded buildMap() {
    return Expanded(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }

  Column buildFloatingActionButtons(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
          backgroundColor: Theme.of(context).backgroundColor,
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/map.svg",
            height: (context.normalValue * 2).h,
            width: (context.normalValue * 2).w,
          )),
      SizedBox(
        height: (context.lowValue).h,
      ),
      FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/send-2.svg",
            color: Colors.white,
            height: (context.normalValue * 2).h,
            width: (context.normalValue * 2).w,
          )),
    ]);
  }

  Container buildTopBar(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).highlightColor, boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColorDark,
          blurRadius: 4,
          offset: Offset(0, (context.lowValue / 2).h),
        ),
      ]),
      padding: EdgeInsets.only(
          top: context.normalValue.h, bottom: context.lowValue.h),
      child: Column(
        children: [
          Padding(
            padding: context.paddingNormalHorizontal,
            child: Row(
              children: [
                buildBackButton(context),
                SizedBox(
                  width: context.lowValue.w,
                ),
                buildSeachTextField(context)
              ],
            ),
          ),
          SizedBox(
            height: context.lowValue.h,
          ),
          BuildCardList()
        ],
      ),
    );
  }

  Container BuildCardList() {
    return Container(
      height: context.highValue * 2 + context.lowValue.h,
      child: ListView(
        padding: EdgeInsets.symmetric(
            vertical: context.lowValue.h, horizontal: context.highValue.w / 2),
        scrollDirection: Axis.horizontal,
        children: [
          CustomIconButton.radio(
            label: "Katman",
            icon: "assets/icons/layer.svg",
            value: 0,
            groupValue: selectedIndex,
            onPressed: () {
              setState(() {
                selectedIndex = 0;
                selectedLayer = "Katman";
              });
            },
          ),
          CustomIconButton.radio(
            label: "Limit Bul",
            icon: "assets/icons/format-square.svg",
            value: 1,
            groupValue: selectedIndex,
            onPressed: () {
              setState(() {
                selectedIndex = 1;
                selectedLayer = "Limit Bul";
              });
            },
          ),
          CustomIconButton.radio(
            label: "Ölçüm",
            icon: "assets/icons/ruler.svg",
            value: 2,
            groupValue: selectedIndex,
            onPressed: () {
              setState(() {
                selectedIndex = 2;
                selectedLayer = "Ölçüm";
              });
            },
          ),
          CustomIconButton.radio(
            label: "Diğer İşlemler",
            icon: "assets/icons/more-circle.svg",
            value: 3,
            groupValue: selectedIndex,
            onPressed: () {
              setState(() {
                selectedIndex = 3;
                selectedLayer = "Diğer İşlemler";
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded buildSeachTextField(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: CustomTextField(
          isShadowBorder: true,
          isSearchBox: true,
          verticalPadding: context.highValue.h / 2,
          focusNode: _focusNode,
          controller: _searchController,
          labelText: "Haritada arayın...",
          borderRadius: 100,
          floatingLabelBehavior: false,
        ),
      ),
    );
  }

  Container buildBackButton(BuildContext context) {
    return Container(
      width: context.highValue.w * 2,
      height: context.highValue.h * 2,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
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
