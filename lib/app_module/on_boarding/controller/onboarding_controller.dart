import 'package:bomjour/app_module/country_selection/view/country_selection.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';

class OnBoardingController extends ChangeNotifier {
  var selectedPageIndex = 0;
  var onboardingLoader = false;
  var onboardingList = <OnBoardingModelData>[];
   PageController ? pageController;
  bool isLastPage = false;
  bool dataFetched = false;
  Future<void> fetchDataIfNeeded() async {
    if (!dataFetched) {
      initializePageController();
      await getOnBoardingData();
    }
  }

  Future<void> getOnBoardingData() async {
    try {
      updateOnboardingLoader(true);
      var profData = await ApiManger.onboardingModel();
      if (profData != null) {
        onboardingList = profData.data as List<OnBoardingModelData>;
        notifyListeners();
        dataFetched = true;
      } else {
        updateOnboardingLoader(false);
      }
    } catch (e) {
      updateOnboardingLoader(false);
      debugPrint(e.toString());
    } finally {
      updateOnboardingLoader(false);
    }
  }

  void initializePageController() {
    pageController = PageController();
  }

  void disposePageController() {
    pageController?.dispose();
  }

  void forwardAction({required BuildContext context}) {
    if (isLastPage) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CountrySelectionView()),
      );

    } else {
      pageController?.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void updateOnboardingLoader(bool val) {
    onboardingLoader = val;
    notifyListeners();
  }

  @override
  void dispose() {
    disposePageController();
    super.dispose();
  }
}
