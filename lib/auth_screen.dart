import 'package:credit_sea/Theme/theme.dart';
import 'package:credit_sea/widgets/carousel_widgets.dart';
import 'package:credit_sea/widgets/container_widgets.dart';
import 'package:flutter/material.dart';

class CombinedScreen extends StatefulWidget {
  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  final PageController _carouselController = PageController();
  int _currentPage = 0;
  int _selectedContentIndex = 0;

  void _onNextButtonPressed(int index) {
    setState(() {
      _selectedContentIndex = index;
    });

    if (_currentPage < 2) {
      _carouselController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onBackButtonPressed() {
    setState(() {
      if (_selectedContentIndex > 0) {
        _selectedContentIndex--;
      }

      if (_currentPage > 0) {
        _carouselController.animateToPage(
          _currentPage - 1,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.primaryColor,
        body: Column(
          children: [
            CarouselWidget(
              carouselController: _carouselController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(2.0),
                child: DynamicContentWidget(
                  selectedIndex: _selectedContentIndex,
                  onNextButtonPressed: _onNextButtonPressed,
                  onBackButtonPressed: _onBackButtonPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
