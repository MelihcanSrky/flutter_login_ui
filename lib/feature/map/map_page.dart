import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_netigma_login/feature/map/widgets/map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  PanelController _panelController = PanelController();
  int? selectedIndex = -1;
  String? selectedLayer;

  @override
  void initState() {
    super.initState();
  }

  void setPanelState() {
    selectedIndex != -1 ? _panelController.open() : _panelController.close();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      onVerticalDragStart: (details) => _focusNode.unfocus(),
      onHorizontalDragStart: (details) => _focusNode.unfocus(),
      child: Material(
        child: buildSlidingUpPanel(
          context,
          SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).highlightColor,
                toolbarHeight: 0,
                elevation: 0,
              ),
              body: Container(
                child: Column(
                  children: [
                    buildTopBar(context),
                    MapWidget(
                      focusNode: _focusNode,
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: buildFloatingActionButtons(context),
            ),
          ),
        ),
      ),
    );
  }

  SlidingUpPanel buildSlidingUpPanel(BuildContext context, Widget child) {
    return SlidingUpPanel(
      maxHeight: 250,
      minHeight: 0,
      controller: _panelController,
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
      body: child,
      header: buildPanelHeader(context),
    );
  }

  Container buildPanelHeader(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.paddingNormalHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.lowValue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harita " + selectedLayer.toString() + " Seç",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = -1;
                      setPanelState();
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
      height: context.highValue * 2 + context.lowValue.h / 2,
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
                setPanelState();
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
                setPanelState();
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
                setPanelState();
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
                setPanelState();
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
