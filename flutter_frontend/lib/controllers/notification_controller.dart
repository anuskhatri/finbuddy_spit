import 'package:bobhack/constants.dart';
import 'package:bobhack/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList<Notifications> notifications = <Notifications>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fill with static data instead of fetching from API
    _populateStaticNotifications();
  }

  void _populateStaticNotifications() {
    notifications.value = [
      Notifications(
        id: 1,
        accountId: 1, // Use an integer for accountId
        content: 'Your transaction of \$100 was successful.',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)).toString(),
        isRead: false,
      ),
      Notifications(
        id: 2,
        accountId: 2, // Use an integer for accountId
        content: 'Your account balance is low.',
        timestamp: DateTime.now().subtract(Duration(hours: 1)).toString(),
        isRead: false,
      ),
      Notifications(
        id: 3,
        accountId: 3, // Use an integer for accountId
        content: 'New features have been added to your app!',
        timestamp: DateTime.now().subtract(Duration(days: 1)).toString(),
        isRead: true,
      ),
      Notifications(
        id: 4,
        accountId: 4, // Use an integer for accountId
        content: 'Your payment of \$50 is due soon.',
        timestamp: DateTime.now().subtract(Duration(days: 2)).toString(),
        isRead: false,
      ),
    ];
    notifications.refresh();
  }

  void deleteNotification(int id) {
    notifications.removeWhere((notification) => notification.id == id);
  }
}
