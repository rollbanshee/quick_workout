import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/strategies_provider.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/homepage/textfield.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class EditStrategies extends StatelessWidget {
  final int index;
  const EditStrategies({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final providerStrategies = context.watch<StrategiesProvider>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: const TextMain17Widget(
            maxLines: 1,
            text: 'Editing',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: TextFieldWidget(
              onChanged: providerStrategies.checkControllerEmpty,
              controller: providerStrategies.controllerTitle,
              hintText: 'Title',
              maxLines: 1),
        ),
        TextFieldWidget(
            onChanged: providerStrategies.checkControllerEmpty,
            // maxLength: 4,
            controller: providerStrategies.controllerAbbreviation,
            hintText: 'Abbreviation',
            maxLines: 1),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
          child: TextFieldWidget(
              onChanged: providerStrategies.checkControllerEmpty,
              controller: providerStrategies.controllerText,
              hintText: 'Text',
              maxLines: 10),
        ),
        BouncingButtonWidget(
            checkEmpty: providerStrategies.checkAnyControllerEmpty,
            buttonName: 'Save',
            onPress: () {
              providerStrategies.saveEditStrategies(index);
              Navigator.pop(context);
              providerStrategies.clearTextControllers();
            })
      ],
    );
  }
}
