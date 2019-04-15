import 'dart:async';

import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BeepCarouselSlider extends StatefulWidget {
  BeepCarouselSlider({
    @required this.items,
    this.height,
    this.aspectRatio = 2,
    this.viewportFraction = 0.8,
    this.initialPage = 0,
    this.realPage = 10000,
    this.reverse = false,
    this.autoPlay = false,
    Duration autoPlayInterval,
    Duration autoPlayAnimationDuration,
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.pauseAutoPlayOnTouch,
    bool enlargeCenterPage,
    this.onPageChanged,
    this.scrollDirection = Axis.horizontal,
  })  : autoPlayInterval = autoPlayInterval ?? const Duration(seconds: 4),
        enlargeCenterPage = enlargeCenterPage ?? false,
        autoPlayAnimationDuration =
            autoPlayAnimationDuration ?? const Duration(milliseconds: 500),
        pageController = PageController(
          viewportFraction: viewportFraction,
          initialPage: realPage + initialPage,
        );

  /// The widgets to be shown in the carousel.
  final List<String> items;

  /// Set carousel height and overrides any existing [aspectRatio].
  final double height;

  /// Aspect ratio is used if no height have been declared.
  /// Defaults to 16:9 aspect ratio.
  final double aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  /// Defaults to 0.8, which means each page fills 80% of the carousel.
  final num viewportFraction;

  /// The page to show when first creating the [BeepCarouselSlider].
  /// Defaults to 0.
  final num initialPage;

  /// The actual index of the [PageView].
  /// Defaults to 10000 to simulate infinite backwards scrolling.
  final num realPage;

  /// Reverse the order of items if set to true.
  /// Defaults to false.
  final bool reverse;

  /// Enables auto play, sliding one page at a time.
  /// Use [autoPlayInterval] to determent the frequency of slides.
  /// Defaults to false.
  final bool autoPlay;

  /// Sets Duration to determent the frequency of slides when
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
  final Duration autoPlayInterval;

  /// (Deprecated, use [autoPlayInterval] instead) Changed for ambiguous intent.
  /// interval did not explain what the variable was used for.
  /// Changing it to [autoPlayInterval] describes where it's used and for what.
  ///
  /// Sets Duration to determent the frequency of slides when
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
//  @deprecated
//  final Duration interval;

  /// (Deprecated, use [autoPlayAnimationDuration] instead) Changed for misleading intent.
  /// 'autoPlayDuration' implies reference to the duration of the entire auto play instance.
  /// Changed to 'autoPlayAnimationDuration' to sympathize its referring to the length of
  /// the animation between the page transitions.
  ///
  /// The animation duration between two transitioning pages while in auto playback.
  /// Defaults to 800 ms.

  /// The animation duration between two transitioning pages while in auto playback.
  /// Defaults to 800 ms.
  final Duration autoPlayAnimationDuration;

  /// Determines the animation curve physics.
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve autoPlayCurve;

  /// Sets a timer on touch detected that pause the auto play with
  /// the given [Duration].
  /// Touch Detection is only active if [autoPlay] is true.
  final Duration pauseAutoPlayOnTouch;

  /// (Deprecated, use [enlargeCenterPage] instead) Changed for ambiguous intent.
  /// 'distortion' provided no information on how the image was distorted.
  /// [enlargeCenterPage] is self documenting, thus making it easier to understand
  /// the api.
  ///
  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel.
  /// Defaults to false.

  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel.
  /// Defaults to false.
  final bool enlargeCenterPage;

  /// Scroll direction of this carousel.
  final Axis scrollDirection;

  /// (Deprecated, use [onPageChanged] instead) Changed for ambiguous intent.
  /// 'updateCallback' provided no information on when the callback was called.
  /// Refactored to following the [PageView] naming convention.
  ///
  /// Called whenever the page in the center of the viewport changes.

  /// Called whenever the page in the center of the viewport changes.
  final Function onPageChanged;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  final PageController pageController;

  /// Animates the controlled [BeepCarouselSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> nextPage({Duration duration, Curve curve}) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  /// Animates the controlled [BeepCarouselSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> previousPage({Duration duration, Curve curve}) {
    return pageController.previousPage(duration: duration, curve: curve);
  }

  /// Changes which page is displayed in the controlled [BeepCarouselSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    final int index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    return pageController
        .jumpToPage(pageController.page.toInt() + page - index);
  }

  /// Animates the controlled [BeepCarouselSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToPage(int page, {Duration duration, Curve curve}) {
    final int index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    return pageController.animateToPage(
        pageController.page.toInt() + page - index,
        duration: duration,
        curve: curve);
  }

  @override
  _BeepCarouselSliderState createState() => _BeepCarouselSliderState();
}

class _BeepCarouselSliderState extends State<BeepCarouselSlider>
    with TickerProviderStateMixin {
  int currentPage;
  Timer timer;

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    timer = getTimer();
  }

  Timer getTimer() {
    return Timer.periodic(widget.autoPlayInterval, (_) {
      if (widget.autoPlay) {
        widget.pageController.nextPage(
            duration: widget.autoPlayAnimationDuration,
            curve: widget.autoPlayCurve);
      }
    });
  }

  void pauseOnTouch() {
    timer.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch, () {
      timer = getTimer();
    });
  }

  Widget getWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = Container(height: widget.height, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : wrapper;
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return getWrapper(PageView.builder(
      scrollDirection: widget.scrollDirection,
      onPageChanged: (int index) {
        currentPage =
            _getRealIndex(index, widget.realPage, widget.items.length);
        if (widget.onPageChanged != null) {
          widget.onPageChanged(currentPage);
        }
      },
      controller: widget.pageController,
      reverse: widget.reverse,
      itemBuilder: (BuildContext context, int i) {
        final int index =
            _getRealIndex(i, widget.realPage, widget.items.length);

        return AnimatedBuilder(
            animation: widget.pageController,
            builder: (BuildContext context, Widget child) {
              // on the first render, the pageController.page is null,
              // this is a dirty hack
              if (widget.pageController.position.minScrollExtent == null ||
                  widget.pageController.position.maxScrollExtent == null) {
                Future<void>.delayed(const Duration(microseconds: 1), () {
                  setState(() {});
                });
                return Container();
              }
              double value = widget.pageController.page - i;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

              final double height = widget.height ??
                  MediaQuery.of(context).size.width * (1 / widget.aspectRatio);
              final double distortionValue = widget.enlargeCenterPage
                  ? Curves.easeOut.transform(value)
                  : 1.0;

              return Center(
                  child:
                      SizedBox(height: distortionValue * height, child: child));
            },
            child: getItemChild(widget.items[index], context));
      },
    ));
  }
}

Widget getItemChild(String url, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        boxShadow: BeepDimens.darkShadow),
    margin: const EdgeInsets.only(
        left: 8.0, right: 8.0, bottom: BeepDimens.padding),
    child: ClipRRect(
      borderRadius:
          const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
      child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
    ),
  );
}

/// Converts an index of a set size to the corresponding index of a collection of another size
/// as if they were circular.
///
/// Takes a [position] from collection Foo, a [base] from where Foo's index originated
/// and the [length] of a second collection Baa, for which the correlating index is sought.
///
/// For example; We have a Carousel of 10000(simulating infinity) but only 6 images.
/// We need to repeat the images to give the illusion of a never ending stream.
/// By calling _getRealIndex with position and base we get an offset.
/// This offset modulo our length, 6, will return a number between 0 and 5, which represent the image
/// to be placed in the given position.
int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

/// Returns the remainder of the modulo operation [input] % [source], and adjust it for
/// negative values.
int _remainder(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}
