import 'package:flutter/material.dart';
import 'weslide_controller.dart';

class WeSlide extends StatefulWidget {
  final Widget footer;
  final Widget body;
  final Widget panel;
  final Widget collapsed;
  final double panelMinSize;
  final double panelMaxSize;
  final double panelBorderRadiusBegin;
  final double panelBorderRadiusEnd;
  final double bodyBorderRadiusBegin;
  final double bodyBorderRadiusEnd;
  final double parallaxOffset;
  final double footerOffset;
  final double backdropOpacity;
  final double transformScaleBegin;
  final double transformScaleEnd;
  final Color backdropColor;
  final Color panelBackground;
  final bool hideFooter;
  final bool hidecollapsed;
  final bool parallax;
  final bool transformScale;
  final WeSlideController controller;
  final List<TweenSequenceItem<double>> fadeSequence;
  final Duration animateDuration;

  WeSlide({
    WeSlideController controller,
    this.footer,
    this.body,
    this.panel,
    this.collapsed,
    this.panelMinSize = 200.0,
    this.panelMaxSize = 0.0,
    this.panelBorderRadiusBegin = 12.0,
    this.panelBorderRadiusEnd = 0.0,
    this.bodyBorderRadiusBegin = 0.0,
    this.bodyBorderRadiusEnd = 12.0,
    this.transformScaleBegin = 1.0,
    this.transformScaleEnd = 0.9,
    this.parallaxOffset = 0.1,
    this.backdropOpacity = 0.8,
    this.backdropColor = Colors.black,
    this.panelBackground = Colors.black,
    this.footerOffset = 60.0,
    this.hideFooter = true,
    this.hidecollapsed = false,
    this.parallax = true,
    this.transformScale = true,
    List<TweenSequenceItem<double>> fadeSequence,
    this.animateDuration = const Duration(milliseconds: 300),
  })  : assert(body != null, 'Body Widget could not be null'),
        controller = controller ?? WeSlideController(),
        fadeSequence = fadeSequence ??
            [
              TweenSequenceItem<double>(weight: 1.0, tween: Tween(begin: 1, end: 0)),
              TweenSequenceItem<double>(weight: 8.0, tween: Tween(begin: 0, end: 0)),
            ];

  @override
  _WeSlideState createState() => _WeSlideState();
}

class _WeSlideState extends State<WeSlide> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // Animation controller;
    widget.controller.ac = AnimationController(vsync: this, duration: widget.animateDuration);
    // panel Border radius animation
    widget.controller.panelborderRadius = Tween<double>(begin: widget.panelBorderRadiusBegin, end: widget.panelBorderRadiusEnd).animate(widget.controller.ac);
    // body border radius animation
    widget.controller.bodyBorderRadius = Tween<double>(begin: widget.bodyBorderRadiusBegin, end: widget.bodyBorderRadiusEnd).animate(widget.controller.ac);
    // Transform scale animation
    widget.controller.scaleAnimation = Tween<double>(begin: widget.transformScaleBegin, end: widget.transformScaleEnd).animate(widget.controller.ac);
    // Fade Animation sequence
    widget.controller.fadeAnimation = TweenSequence(widget.fadeSequence).animate(widget.controller.ac);
    // Super Init State
    super.initState();
  }

  // Dispose
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery Size
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // Get screen height when rebuild
    widget.controller.screenHeight = _height;

    return Container(
      //color: widget.background,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          /** Body widget **/
          AnimatedBuilder(
            animation: widget.controller.ac,
            builder: (context, child) {
              return Positioned(
                top: widget.parallax ? (widget.controller.ac.value * (widget.panelMaxSize - widget.panelMinSize) * widget.parallaxOffset) : 0.0,
                child: Transform.scale(
                  scale: widget.transformScale ? widget.controller.scaleAnimation.value : 1.0,
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.controller.bodyBorderRadius.value),
                      topRight: Radius.circular(widget.controller.bodyBorderRadius.value),
                    ),
                    child: child,
                  ),
                ),
              );
            },
            child: Container(
              height: _height - widget.panelMinSize,
              width: _width,
              child: widget.body,
            ),
          ),
          /** Overlay Effect **/
          AnimatedBuilder(
            animation: widget.controller.ac,
            builder: (context, _) {
              return Container(
                color: widget.controller.ac.value == 0.0 ? null : widget.backdropColor.withOpacity(widget.backdropOpacity * widget.controller.ac.value),
              );
            },
          ),
          /* Fill with background color behind panel border radius */
          Positioned(
            bottom: 0.0,
            width: MediaQuery.of(context).size.width,
            height: widget.panelMinSize,
            child: Container(color: widget.panelBackground),
          ),
          /** Panel widget **/
          AnimatedBuilder(
            animation: widget.controller.ac,
            builder: (context, child) {
              return SlideTransition(
                position: widget.controller.getAnimationOffSet(maxSize: widget.panelMaxSize, minSize: widget.panelMinSize),
                child: GestureDetector(
                  onVerticalDragUpdate: widget.controller.handleVerticalUpdate,
                  onVerticalDragEnd: widget.controller.handleVerticalEnd,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.controller.panelborderRadius.value),
                        topRight: Radius.circular(widget.controller.panelborderRadius.value),
                      ),
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                /** Panel widget **/
                widget.panel ?? Container(),
                /** collapsed widget **/
                widget.collapsed != null && widget.hidecollapsed
                    ? FadeTransition(
                        opacity: widget.controller.fadeAnimation,
                        child: ValueListenableBuilder(
                          valueListenable: widget.controller.isPanelVisible,
                          builder: (_, __, ___) {
                            return IgnorePointer(
                              ignoring: widget.controller.isPanelVisible.value && widget.hidecollapsed,
                              child: widget.collapsed,
                            );
                          },
                        ),
                      )
                    : Container(),
                /** collapsed widget is null **/
                widget.collapsed != null && !widget.hidecollapsed ? widget.collapsed : Container(),
              ],
            ),
          ),
          // Footer Widget
          AnimatedBuilder(
            animation: widget.controller.ac,
            builder: (context, child) {
              return Positioned(
                bottom: widget.hideFooter ? widget.controller.ac.value * -widget.footerOffset : 0.0,
                width: MediaQuery.of(context).size.width,
                child: widget.footer ?? Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
