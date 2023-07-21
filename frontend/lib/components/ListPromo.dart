import 'package:flutter/material.dart';

class ListPromo extends StatefulWidget {
  @override
  _ListPromoState createState() => _ListPromoState();
}

class _ListPromoState extends State<ListPromo> {
  PageController? _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    // Start auto-sliding
    startAutoSlide();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      // Animate to the next page
      _pageController?.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // Start auto-slide again
      startAutoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
              getImageUrl(index),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  String getImageUrl(int index) {
    switch (index) {
      case 0:
        return "https://images.tokopedia.net/img/home/defaultbanner/59e9ecd0-b91b-40d4-aef8-b1057be0_auto_x2.jpg?ect=4g";
      case 1:
        return "https://images.tokopedia.net/img/NsjrJu/2020/9/25/b1d2ed1e-ef80-4d7a-869f-a0394f0629be.jpg?ect=4g";
      case 2:
        return "https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/7/13/039df565-dd90-4835-afcf-f8070be80401.jpg?ect=4g";
      default:
        return "";
    }
  }
}
