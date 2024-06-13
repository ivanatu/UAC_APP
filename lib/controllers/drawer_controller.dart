import '/exports/exports.dart';

class ZDrawerController with ChangeNotifier {
  ZoomDrawerController _controller = ZoomDrawerController();
  ZoomDrawerController get controller => _controller;
  void toggleDrawerSelected() {
    _controller.toggle!();
    notifyListeners();
  }
}
