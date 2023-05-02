import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:nnz/src/components/sharing_detail/share_auth_card.dart';
import 'package:nnz/src/components/sharing_detail/share_example_data.dart';
import 'package:nnz/src/components/sharing_detail/sharing_button.dart';
import 'package:nnz/src/pages/share/my_shared_detail.dart';

class SharedAuthCheck extends StatefulWidget {
  const SharedAuthCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<SharedAuthCheck> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<SharedAuthCheck> {
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates
      .map((candidate) => StackAuthCard(candidate: candidate))
      .toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(55.0),
                cardBuilder: (context, index) => cards[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.undo,
                    heroTag: "swipe_left_button",
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.rotate_left,
                      color: Colors.black,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    heroTag: "left_button",
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    heroTag: "right_button",
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.check),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Get.to(() => MySharedDetail()),
              child: const SharingButton(
                  btnheight: 12, btnwidth: 130, btntext: "완료"),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction.name == 'left') {
      debugPrint("$previousIndex 거절 다음 $currentIndex");
    }
    if (direction.name == 'right') {
      debugPrint("$previousIndex 수락 다음 $currentIndex");
    }
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
