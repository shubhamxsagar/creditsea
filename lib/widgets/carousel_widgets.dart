import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:credit_sea/Theme/theme.dart';

class CarouselWidget extends StatelessWidget {
  final PageController carouselController;
  final Function(int) onPageChanged;

  const CarouselWidget({
    Key? key,
    required this.carouselController,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: ThemeColors.primaryColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/icons/logo_hr.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Expanded(
                child: PageView(
                  controller: carouselController,
                  onPageChanged: onPageChanged,
                  children: [
                    _buildPageContent(
                        "assets/icons/first.png",
                        "Flexible Loan Options",
                        "Loan types to cater to different financial needs",
                        context),
                    _buildPageContent(
                        "assets/icons/second.png",
                        "Instant Loan Approval",
                        "Users will receive approval within minutes",
                        context),
                    _buildPageContent(
                        "assets/icons/third.png",
                        "24x7 Customer Care",
                        "Dedicated customer support team",
                        context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SmoothPageIndicator(
                  controller: carouselController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white,
                    dotWidth: MediaQuery.of(context).size.width * 0.02,
                    dotHeight: MediaQuery.of(context).size.width * 0.02,
                    expansionFactor: 3.0,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
      String icon, String title, String subtitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.contain,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.034,
                  color: Colors.grey[300]),
            ),
          ],
        ),
      ),
    );
  }
}
