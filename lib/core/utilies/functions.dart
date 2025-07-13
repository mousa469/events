  import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/utilies/keys.dart';

determineEventImage({required String category}) {
    if (category == Keys.gaming) {
      return AppAssets.gamingCategory;
    } else if (category == Keys.bookClub) {
      return AppAssets.bookCategory;
    } else if (category == Keys.workshop) {
      return AppAssets.workCategory;
    } else if (category == Keys.exhibtion) {
      return AppAssets.exhibitionCategory;
    } else if (category == Keys.holiday) {
      return AppAssets.holidayCategory;
    } else if (category == Keys.eating) {
      return AppAssets.eatingCategory;
    } else if (category == Keys.Birthday) {
      return AppAssets.birthdayCategory;
    } else if (category == Keys.meeting) {
      return AppAssets.meetingCategory;
    } else {
      return AppAssets.SportCategory;
    }
  }