import 'package:flutter/material.dart';
import 'weslide_controller.dart';

class WeSlide extends StatefulWidget {
  final Widget footer;
  final Widget body;
  final Widget panel;
  final Widget collapsed;
  final double panelMinSize;
  final double panelMaxSize;
  final double panelWidth;
  final double panelBorderRadiusBegin;
  final double panelBorderRadiusEnd;
  final double bodyBorderRadiusBegin;
  final double bodyBorderRadiusEnd;
  final double bodyWidth;
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

  /// Controls the animations like open or close panel
  /// If null, this widget will create its own [WeSlideController]
  final WeSlideController controller;
  final List<TweenSequenceItem<double>> fadeSequence;
  final Duration animateDuration;

  WeSlide({
    this.controller,
    this.footer,
    this.body,
    this.panel,
    this.collapsed,
    this.panelMinSize = 150.0,
    this.panelMaxSize = 400.0,
    this.panelWidth,
    this.panelBorderRadiusBegin = 0.0,
    this.panelBorderRadiusEnd = 0.0,
    this.bodyBorderRadiusBegin = 0.0,
    this.bodyBorderRadiusEnd = 0.0,
    this.bodyWidth,
    this.transformScaleBegin = 1.0,
    this.transformScaleEnd = 0.9,
    this.parallaxOffset = 0.1,
    this.backdropOpacity = 0.0,
    this.backdropColor = Colors.black,
    this.panelBackground = Colors.black,
    this.footerOffset = 60.0,
    this.hideFooter = true,
    this.hidecollapsed = true,
    this.parallax = false,
    this.transformScale = false,
    List<TweenSequenceItem<double>> fadeSequence,
    this.animateDuration = const Duration(milliseconds: 300),
  })  : assert(body != null, 'Body could not be null'),
        assert(panelMinSize >= 0.0, 'panelMinSize cannot be negative'),
        assert(panel != null, 'panel could not be null'),
        assert(panelMaxSize >= panelMinSize, 'panelMaxSize cannot be less than panelMinSize'),
        fadeSequence = fadeSequence ??
            [
              TweenSequenceItem<double>(weight: 1.0, tween: Tween(begin: 1, end: 0)),
              TweenSequenceItem<double>(weight: 8.0, tween: Tween(begin: 0, end: 0)),
            ];

  @override
  _WeSlideState createState() => _WeSlideState();
}

class _WeSlideState extends State<WeSlide> with SingleTickerProviderStateMixin {
  WeSlideController _controller;
  WeSlideController get _effectiveController => widget.controller ?? _controller;

  @override
  void initState() {
    if (_effectiveController == null) {
      _controller = WeSlideController();
    }
    // Animation controller;
    _effectiveController.ac = AnimationController(vsync: this, duration: widget.animateDuration);
    // panel Border radius animation
    _effectiveController.panelborderRadius = Tween<double>(begin: widget.panelBorderRadiusBegin, end: widget.panelBorderRadiusEnd).animate(_effectiveController.ac);
    // body border radius animation
    _effectiveController.bodyBorderRadius = Tween<double>(begin: widget.bodyBorderRadiusBegin, end: widget.bodyBorderRadiusEnd).animate(_effectiveController.ac);
    // Transform scale animation
    _effectiveController.scaleAnimation = Tween<double>(begin: widget.transformScaleBegin, end: widget.transformScaleEnd).animate(_effectiveController.ac);
    // Fade Animation sequence
    _effectiveController.fadeAnimation = TweenSequence(widget.fadeSequence).animate(_effectiveController.ac);
    // Super Init State
    super.initState();
  }

  // Dispose
  @override
  void dispose() {
    _effectiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Get MediaQuery Sizes
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // update panel height to controller when rebuild
    _effectiveController.panelHeight = widget.panelMaxSize;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        /** Body widget **/
        AnimatedBuilder(
          animation: _effectiveController.ac,
          builder: (context, child) {
            return Positioned(
              top: widget.parallax ? (_effectiveController.ac.value * (widget.panelMaxSize - widget.panelMinSize) * widget.parallaxOffset) : 0.0,
              child: Transform.scale(
                scale: widget.transformScale ? _effectiveController.scaleAnimation.value : 1.0,
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_effectiveController.bodyBorderRadius.value),
                    topRight: Radius.circular(_effectiveController.bodyBorderRadius.value),
                  ),
                  child: child,
                ),
              ),
            );
          },
          child: Container(
            height: _height - widget.panelMinSize,
            width: widget.bodyWidth ?? _width,
            child: widget.body,
          ),
        ),
        /** Overlay Effect **/
        AnimatedBuilder(
          animation: _effectiveController.ac,
          builder: (context, _) {
            return Container(
              color: _effectiveController.ac.value == 0.0 ? null : widget.backdropColor.withOpacity(widget.backdropOpacity * _effectiveController.ac.value),
            );
          },
        ),
        /* Fill with background color behind panel border radius */
        Positioned(
          bottom: 0.0,
          width: widget.panelWidth ?? _width,
          height: widget.panelMinSize,
          child: Container(
            color: widget.panelBackground,
          ),
        ),
        /** Panel widget **/
        AnimatedBuilder(
          animation: _effectiveController.ac,
          builder: (_, child) {
            return SlideTransition(
              position: _effectiveController.getAnimationOffSet(maxSize: widget.panelMaxSize, minSize: widget.panelMinSize),
              child: GestureDetector(
                onVerticalDragUpdate: _effectiveController.handleVerticalUpdate,
                onVerticalDragEnd: _effectiveController.handleVerticalEnd,
                child: AnimatedContainer(
                  height: widget.panelMaxSize,
                  width: widget.panelWidth ?? _width,
                  duration: Duration(milliseconds: 200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_effectiveController.panelborderRadius.value),
                      topRight: Radius.circular(_effectiveController.panelborderRadius.value),
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
                      opacity: _effectiveController.fadeAnimation,
                      child: ValueListenableBuilder(
                        valueListenable: _effectiveController.isPanelVisible,
                        builder: (_, __, ___) {
                          return IgnorePointer(
                            ignoring: _effectiveController.isPanelVisible.value && widget.hidecollapsed,
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
        widget.footer != null
            ? AnimatedBuilder(
                animation: _effectiveController.ac,
                builder: (context, child) {
                  return Positioned(
                    bottom: widget.hideFooter ? _effectiveController.ac.value * -widget.footerOffset : 0.0,
                    width: MediaQuery.of(context).size.width,
                    child: widget.footer,
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
