import 'package:example_getx_restapi/app/api/user_api.dart';
import 'package:example_getx_restapi/app/models/user.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var _dataAvailable = false.obs;
  int _count = 0;
  List<User> _users = [];
  bool? _loading = true;
  List<User> get users => _users;
  bool? get loading => _loading;

  bool get dataAvailable => _dataAvailable.value;
  int get count => _count;
  increment() {
    _count++;
    update(['counter'], _count >= 5);
  }

  Future<void> loadUsers() async {
    _loading = true;
    final data = await UserApi.instance.getUser(1);
    _users = data;
    await Future.delayed(const Duration(seconds: 3));
    _loading = false;
    update(["users"]);
  }

  Future<void> loadUsersObs() async {
    _dataAvailable.value = false;
    final data = await UserApi.instance.getUser(1);
    _users = data;
    await Future.delayed(const Duration(seconds: 3));
    _dataAvailable.value = true;
  }

  @override
  // ignore: must_call_super
  void onInit() {
    super.onReady();
    loadUsers();
    loadUsersObs();
  }
}
