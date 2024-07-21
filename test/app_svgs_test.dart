import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quick_workout/features/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.camera).existsSync(), isTrue);
    expect(File(AppSvgs.logoQw).existsSync(), isTrue);
    expect(File(AppSvgs.matches).existsSync(), isTrue);
    expect(File(AppSvgs.matchesEmpty).existsSync(), isTrue);
    expect(File(AppSvgs.rateUs).existsSync(), isTrue);
    expect(File(AppSvgs.settings).existsSync(), isTrue);
    expect(File(AppSvgs.shareApp).existsSync(), isTrue);
    expect(File(AppSvgs.strategies).existsSync(), isTrue);
    expect(File(AppSvgs.strategiesEmpty).existsSync(), isTrue);
    expect(File(AppSvgs.team).existsSync(), isTrue);
    expect(File(AppSvgs.teamEmpty).existsSync(), isTrue);
    expect(File(AppSvgs.usagePolicy).existsSync(), isTrue);
    expect(File(AppSvgs.workout).existsSync(), isTrue);
    expect(File(AppSvgs.workoutEmpty).existsSync(), isTrue);
  });
}
