import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/modules/home_module/logic/services/content_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeVM {
  final BehaviorSubject<int> bottomNavBarIndex = BehaviorSubject<int>();
  final BehaviorSubject<List<ContentModel>> contents =
      BehaviorSubject<List<ContentModel>>();
  final ContentService contentService;
  HomeVM({
    required this.contentService,
  }) {
    bottomNavBarIndex.add(0);
    contentService.getContent().then((value) {
      contents.add(value);
    });
  }
}
