import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gigatech_coding_test/modules/home/home_screen_controller.dart';
import 'package:gigatech_coding_test/routes/app_routes.dart';
import 'package:gigatech_coding_test/themes/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/asset_constant.dart';
import '../../utils/globals.dart';
import '../../utils/strings.dart';
import '../../utils/widgets/input_field_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetHomeController>(
      init: GetHomeController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ThemeColor.white,
              centerTitle: true,
              title: Text(
                'Logged as: ${controller.title}',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    color: HexColor.fromHex("#808080")),
              ),
            ),
            body: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    height: Get.height,
                    color: ThemeColor.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        // scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'List of Pokemon',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: ThemeColor.gray900),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              controller: controller.scrollController,
                              itemCount: controller.pokemonList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    controller.resetData();
                                    await controller.fetchPokemonAbilities(
                                        controller.pokemonList[index].url
                                            .toString());

                                    Get.to(const MyDialog(), popGesture: true);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: ThemeColor.gray200),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0, vertical: 16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                HexColor.fromHex("#EDE5FF"),
                                            child: SvgPicture.asset(
                                                AssetConstant.userIcon),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            controller.pokemonList[index].name
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                color: ThemeColor.gray700),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              controller.resetData();
                                              await controller
                                                  .fetchPokemonAbilities(
                                                      controller
                                                          .pokemonList[index]
                                                          .url
                                                          .toString());

                                              Get.to(const MyDialog(),
                                                  opaque: false,
                                                  popGesture: true);
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 78,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ThemeColor.blue700),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16))),
                                              child: Center(
                                                  child: Text(
                                                'Abilities',
                                                style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: ThemeColor.blue700),
                                                textAlign: TextAlign.center,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  List<Widget> getChildren(GetHomeController controller) {
    List<Widget> children = [];

    for (var i = 0; i < controller.pokemonDetails!.abilities!.length; i++) {
      children.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
            onTap: () {},
            child: Text(
              i.toString(),
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: HexColor.fromHex('#595959')),
            )),
      ));
    }
    return children;
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetHomeController>(
        init: GetHomeController(),
        builder: (controller) => AlertDialog(
              elevation: 1.0,
              backgroundColor: Colors.transparent,
              // title: Text(widget.title),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 24),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                "Abilities",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: ThemeColor.primaryBlack),
                              ),
                            ),
                            Container(
                              height: 8,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: ThemeColor.gray200),
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                          .pokemonDetails?.abilities?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Text(
                                      controller.pokemonDetails!
                                          .abilities![index].ability!.name!
                                          .toString(),
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor.fromHex('#595959')),
                                    );
                                  }),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.0, right: 16),
                            child: Icon(FeatherIcons.x),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
