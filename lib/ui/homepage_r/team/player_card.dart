// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/models/team/player_info.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/team_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/team/edit_player.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/circle_avatar.dart';
import 'package:quick_workout/widgets/homepage/delete_cancel_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/edit_delete_row.dart';
import 'package:quick_workout/ui/homepage_r/team/team_widgets/player_card_age_salary.dart';
import 'package:quick_workout/ui/homepage_r/team/team_widgets/player_card_info.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';

class PlayerCard extends StatelessWidget {
  final int index;
  const PlayerCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final providerTeam = context.watch<TeamProvider>();
    final List<PlayerInfo> cards =
        providerTeam.box.values.cast<PlayerInfo>().toList();
    final bool checkIndex = index == cards.length;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
          child: CircleAvatarWidget(
            width: 120.w,
            height: 120.w,
            image: checkIndex ? null : cards[index].avatar,
          ),
        ),
        TextMain22Widget(
          maxLines: 1,
          textMain: checkIndex ? 'empty' : cards[index].playerName,
        ),
        SizedBox(
          height: 4.h,
        ),
        TextSecond15Widget(
          text: checkIndex ? 'empty' : cards[index].playerPosition,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: PlayerCardAgeSalaryWidget(
                  title: context.t.team.player_mbs[0],
                  text: checkIndex ? 'empty' : cards[index].playerAge,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                flex: 1,
                child: PlayerCardAgeSalaryWidget(
                  title: context.t.team.player_mbs[1],
                  text: checkIndex ? 'empty' : '\$${cards[index].playerSalary}',
                ),
              ),
            ],
          ),
        ),
        PlayerCardInfoWidget(
          info: checkIndex ? 'empty' : cards[index].description,
        ),
        Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
            child: EditDeleteRowWidget(
              onPressEdit: () {
                providerTeam.editPlayer(index);
                showAppModalBottomSheet(context, EditPlayer(index: index));
              },
              onPressDelete: () async {
                bool? pop = await showDeleteConfirmation(context, () {
                  providerTeam.deleteItem(index);
                }, context.t.team.player_delete_confirmation[1]);
                pop == true ? Navigator.pop(context) : null;
              },
            )),
      ],
    );
  }
}
