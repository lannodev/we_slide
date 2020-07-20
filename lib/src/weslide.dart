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
  final bool hideCollapsed;
  final bool parallax;
  final bool transformScale;
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
    this.hideCollapsed = true,
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
  AnimationController _ac;
  Animation<double> _panelborderRadius;
  Animation<double> _bodyBorderRadius;
  Animation<double> _scaleAnimation;
  Animation _fadeAnimation;

  WeSlideController _controller;
  WeSlideController get _effectiveController => widget.controller ?? _controller;

  @override
  void initState() {
    if (_effectiveController == null) {
      _controller = WeSlideController();
    }

    _effectiveController.hide = hide;
    _effectiveController.show = show;

    // Animation controller;
    _ac = AnimationController(vsync: this, duration: widget.animateDuration);
    // panel Border radius animation
    _panelborderRadius = Tween<double>(begin: widget.panelBorderRadiusBegin, end: widget.panelBorderRadiusEnd).animate(_ac);
    // body border radius animation
    _bodyBorderRadius = Tween<double>(begin: widget.bodyBorderRadiusBegin, end: widget.bodyBorderRadiusEnd).animate(_ac);
    // Transform scale animation
    _scaleAnimation = Tween<double>(begin: widget.transformScaleBegin, end: widget.transformScaleEnd).animate(_ac);
    // Fade Animation sequence
    _fadeAnimation = TweenSequence(widget.fadeSequence).animate(_ac);
    // Super Init State
    super.initState();
  }

  // Dispose
  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  //hide the panel
  void hide() {
    if (_ac.value < 1.0) return;
    _ac.reverse().then((x) {
      _effectiveController.isPanelVisible.value = false;
    });
  }

  //show the panel
  void show() {
    if (_ac.value > 0.0) return;
    _ac.forward().then((x) {
      _effectiveController.isPanelVisible.value = true;
    });
  }

  // Gesture Vertical End
  void _handleVerticalEnd(DragEndDetails endDetails) {
    if (_ac.value >= 0.5) {
      _ac.forward().then((x) {
        _effectiveController.isPanelVisible.value = true;
      });
    } else {
      _ac.reverse().then((x) {
        _effectiveController.isPanelVisible.value = false;
      });
    }
  }

  // Gesture Vertical Update
  void _handleVerticalUpdate(DragUpdateDetails updateDetails) {
    var fractionDragged = updateDetails.primaryDelta / widget.panelMaxSize;
    _ac.value -= 1.5 * fractionDragged;
  }

  // Get Body Animation
  Animation<Offset> _getAnimationOffSet({@required double minSize, @required double maxSize}) {
    final _closedPercentage = (widget.panelMaxSize - minSize) / widget.panelMaxSize;
    final _openPercentage = (widget.panelMaxSize - maxSize) / widget.panelMaxSize;
    return Tween<Offset>(begin: Offset(0.0, _closedPercentage), end: Offset(0.0, _openPercentage)).animate(_ac);
  }

  @override
  Widget build(BuildContext context) {
    //Get MediaQuery Sizes
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        /** Body widget **/
        AnimatedBuilder(
          animation: _ac,
          builder: (context, child) {
            return Positioned(
              top: widget.parallax ? (_ac.value * (widget.panelMaxSize - widget.panelMinSize) * -widget.parallaxOffset) : 0.0,
              child: Transform.scale(
                scale: widget.transformScale ? _scaleAnimation.value : 1.0,
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_bodyBorderRadius.value),
                    topRight: Radius.circular(_bodyBorderRadius.value),
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
          animation: _ac,
          builder: (context, _) {
            return Container(
              color: _ac.value == 0.0 ? null : widget.backdropColor.withOpacity(widget.backdropOpacity * _ac.value),
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
          animation: _ac,
          builder: (_, child) {
            return SlideTransition(
              position: _getAnimationOffSet(maxSize: widget.panelMaxSize, minSize: widget.panelMinSize),
              child: GestureDetector(
                onVerticalDragUpdate: _handleVerticalUpdate,
                onVerticalDragEnd: _handleVerticalEnd,
                child: AnimatedContainer(
                  height: widget.panelMaxSize,
                  width: widget.panelWidth ?? _width,
                  duration: Duration(milliseconds: 200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_panelborderRadius.value),
                      topRight: Radius.circular(_panelborderRadius.value),
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
              widget.collapsed != null && widget.hideCollapsed
                  ? FadeTransition(
                      opacity: _fadeAnimation,
                      child: ValueListenableBuilder(
                        valueListenable: _effectiveController.isPanelVisible,
                        builder: (_, __, ___) {
                          return IgnorePointer(
                            ignoring: _effectiveController.isPanelVisible.value && widget.hideCollapsed,
                            child: widget.collapsed,
                          );
                        },
                      ),
                    )
                  : Container(),
              /** collapsed widget is null **/
              widget.collapsed != null && !widget.hideCollapsed ? widget.collapsed : Container(),
            ],
          ),
        ),
        // Footer Widget
        widget.footer != null
            ? AnimatedBuilder(
                animation: _ac,
                builder: (context, child) {
                  return Positioned(
                    bottom: widget.hideFooter ? _ac.value * -widget.footerOffset : 0.0,
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
