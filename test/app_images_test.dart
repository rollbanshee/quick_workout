import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quick_workout/features/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.avatar).existsSync(), isTrue);
    expect(File(AppImages.logo1w).existsSync(), isTrue);
    expect(File(AppImages.notification).existsSync(), isTrue);
    expect(File(AppImages.onboardingR1).existsSync(), isTrue);
    expect(File(AppImages.onboardingR2).existsSync(), isTrue);
    expect(File(AppImages.onboardingU1).existsSync(), isTrue);
    expect(File(AppImages.onboardingU2).existsSync(), isTrue);
    expect(File(AppImages.strategies).existsSync(), isTrue);
    expect(File(AppImages.strategiesBig).existsSync(), isTrue);
  });
}
