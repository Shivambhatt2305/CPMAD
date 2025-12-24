import 'package:get/get.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/add_edit_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.ADD_EDIT, page: () => const AddEditPage()),
  ];
}
