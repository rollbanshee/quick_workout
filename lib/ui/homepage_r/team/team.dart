import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/team/player_info.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/team_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/team/add_new_player.dart';
import 'package:quick_workout/ui/homepage_r/team/player_card.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/appbar.dart';
import 'package:quick_workout/widgets/homepage/empty_screen.dart';
import 'package:quick_workout/ui/homepage_r/team/team_widgets/team_listview_item.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTeam = context.watch<TeamProvider>();
    final List<PlayerInfo> cards =
        providerTeam.box.values.cast<PlayerInfo>().toList();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
          child: Column(
            children: [
              AppBarWIdget(
                  provider: providerTeam,
                  title: context.t.team.appbar,
                  onPress: () {
                    providerTeam.clearTextControllers();
                    showAppModalBottomSheet(context, const AddNewPlayer());
                  }),
              cards.isEmpty
                  ? EmptyScreenWidget(
                      text: t.team.empty_screen[1],
                      svgAssetName: AppSvgs.teamEmpty)
                  : Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: TeamListViewItemWidget(
                                    avatar: cards[index].avatar,
                                    playerName: cards[index].playerName,
                                    playerPosition: cards[index].playerPosition,
                                    onPress: () {
                                      showAppModalBottomSheet(
                                          context,
                                          PlayerCard(
                                            index: index,
                                          ));
                                    }),
                              );
                            }),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
