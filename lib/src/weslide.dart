import 'package:flutter/material.dart';
import 'weslide_controller.dart';

class WeSlide extends StatefulWidget {
  final Widget footer;
  final Widget body;
  final Widget panel;
  final Widget collapsed;
  final double panelMinSize;
  final double panelMaxSize;
  final double borderRadiusBegin;
  final double borderRadiusEnd;
  final double parallaxOffset;
  final double footerOffset;
  final double backdropOpacity;
  final Color backdropColor;
  final bool hideFooter;
  final bool parallax;
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
    this.borderRadiusBegin = 12.0,
    this.borderRadiusEnd = 0.0,
    this.parallaxOffset = 0.1,
    this.backdropOpacity = 0.8,
    this.backdropColor = Colors.black,
    this.footerOffset = 60.0,
    this.hideFooter = true,
    this.parallax = true,
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
    // Get screen Height when rebuild
    widget.controller.screenHeight = MediaQuery.of(context).size.height;
    // Tween Border Animation
    widget.controller.borderRadiusAnimation = Tween<double>(begin: widget.borderRadiusBegin, end: widget.borderRadiusEnd).animate(widget.controller.ac);
    // Fade Animation sequence
    widget.controller.fadeAnimation = TweenSequence(widget.fadeSequence).animate(widget.controller.ac);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // Body
        AnimatedBuilder(
          animation: widget.controller.ac,
          builder: (context, child) {
            return Positioned(
              top: widget.parallax ? (widget.controller.ac.value * (widget.panelMaxSize - widget.panelMinSize) * widget.parallaxOffset) : 0.0,
              child: child,
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height - widget.panelMinSize,
            width: MediaQuery.of(context).size.width,
            child: widget.body,
          ),
        ),
        // Overlay Effect
        AnimatedBuilder(
          animation: widget.controller.ac,
          builder: (context, _) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: widget.controller.ac.value == 0.0 ? null : widget.backdropColor.withOpacity(widget.backdropOpacity * widget.controller.ac.value),
            );
          },
        ),
        // Collapse Panel

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
                      topLeft: Radius.circular(widget.controller.borderRadiusAnimation.value),
                      topRight: Radius.circular(widget.controller.borderRadiusAnimation.value),
                    ),
                    child: child,
                  ),
                ),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              widget.collapsed ?? Container(),
              widget.panel != null
                  ? FadeTransition(
                      opacity: widget.controller.fadeAnimation,
                      child: ValueListenableBuilder(
                        valueListenable: widget.controller.isPanelVisible,
                        builder: (_, __, ___) {
                          return IgnorePointer(
                            ignoring: widget.controller.isPanelVisible.value,
                            child: widget.panel,
                          );
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),

        // NavigationBar
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
    );
  }
}
