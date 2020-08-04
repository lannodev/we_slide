import 'dart:math';

import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'weslide_controller.dart';

// ignore: must_be_immutable
class WeSlide extends StatefulWidget {
  // This is the widget that will be below as a footer,
  // this can be used as a [BottomNavigationBar]
  final Widget footer;

  // This is the widget that will be hided with [Panel].
  // You can fit any widget. This parameter is required
  final Widget body;

  // This is the widget that will slide over the [Body].
  // You can fit any widget.
  final Widget panel;

  // This is the header that will be over the [Panel].
  // You can fit any widget.
  final Widget panelHeader;

  // This is the initial value that set the panel min height.
  // If the value is greater than 0, panel will be this size over [body]
  // By default is [150.0]. Set [0.0] if you want to hide [Panel]
  final double panelMinSize;

  // This is the value that set the panel max height.
  // When slide up the panel this value define the max height
  // that panel will be over [Body]. By default is [400.0]
  // if you want that panel cover the whole [Body], set with
  // MediaQuery.of(context).size.height
  final double panelMaxSize;

  // This is the value that set the panel width
  // by default is MediaQuery.of(context).size.width
  final double panelWidth;

  // Set this value to create a border radius over Panel.
  // When panelBorderRadiusBegin is diffrent from panelBorderRadiusEnd
  // and the panel is slide up, this create an animation border over panel
  // By default is 0.0
  final double panelBorderRadiusBegin;

  // Set this value to create a border radius over Panel.
  // When panelBorderRadiusBegin is diffrent from panelBorderRadiusEnd
  // and the panel is slide up, this create an animation border over panel
  // By default is 0.0
  final double panelBorderRadiusEnd;

  // Set this value to create a border radius over Body.
  // When bodyBorderRadiusBegin is diffrent from bodyBorderRadiusEnd
  // and the panel is slide up, this create an animation border over body
  // By default is 0.0
  final double bodyBorderRadiusBegin;

  // Set this value to create a border radius over Body.
  // When bodyBorderRadiusBegin is diffrent from bodyBorderRadiusEnd
  // and the panel is slide up, this create an animation border over body.
  // By default is 0.0
  final double bodyBorderRadiusEnd;

  // This is the value that set the body width.
  // By default is MediaQuery.of(context).size.width
  final double bodyWidth;

  // Set this value to create a parallax effect when the panel is slide up.
  // By default is 0.1
  final double parallaxOffset;

  // Set this value to create an hide animation with footer
  // Is recommended to set [footer] height value.
  // by default is 60.0
  final double footerOffset;

  // This is the value that defines opacity overlay effect bethen body and panel.
  final double overlayOpacity;

  // This is the value that defines Transform scale begin effect
  // By default is 1.0
  final double transformScaleBegin;

  // This is the value that defines Transform scale end effect
  // by default is 0.9
  final double transformScaleEnd;

  // This is the value that defines overlay color effect.
  // By default is Colors.black
  final Color overlayColor;

  // This is the value that defines background color panel.
  // By default is Colors.black
  final Color panelBackground;

  // This is the value that defines if you want to hide the footer.
  // By default is true
  final bool hideFooter;

  // This is the value that defines if you want to hide the [panelHeader].
  // By default is true
  final bool hidePanelHeader;

  // This is the value that defines if you want to enable paralax effect.
  // By default is false
  final bool parallax;

  // This is the value that defines if you want to enable transform scale effect.
  // By default is false
  final bool transformScale;

  // This is the value that create a fade transition over panel header
  final List<TweenSequenceItem<double>> fadeSequence;

  // This is the value that sets the duration of the animation.
  // By default is 300 milliseconds
  final Duration animateDuration;

  // This object used to control animations, using methods like hide or show
  // to display panel or check if is visible with variable [isOpened]
  WeSlideController controller;

  WeSlide({
    Key key,
    this.footer,
    @required this.body,
    this.panel,
    this.panelHeader,
    this.panelMinSize = 150.0,
    this.panelMaxSize = 400.0,
    this.panelWidth,
    this.panelBorderRadiusBegin = 0.0,
    this.panelBorderRadiusEnd = 0.0,
    this.bodyBorderRadiusBegin = 0.0,
    this.bodyBorderRadiusEnd = 0.0,
    this.bodyWidth,
    this.transformScaleBegin = 1.0,
    this.transformScaleEnd = 0.85,
    this.parallaxOffset = 0.1,
    this.overlayOpacity = 0.0,
    this.overlayColor = Colors.black,
    this.panelBackground = Colors.black,
    this.footerOffset = 60.0,
    this.hideFooter = true,
    this.hidePanelHeader = true,
    this.parallax = false,
    this.transformScale = false,
    List<TweenSequenceItem<double>> fadeSequence,
    this.animateDuration = const Duration(milliseconds: 300),
    this.controller,
  })  : assert(body != null, 'Body could not be null'),
        assert(panelMinSize >= 0.0, 'panelMinSize cannot be negative'),
        assert(footerOffset >= 0.0, 'footerOffset cannot be negative'),
        assert(panel != null, 'panel could not be null'),
        assert(panelMaxSize >= panelMinSize, 'panelMaxSize cannot be less than panelMinSize'),
        fadeSequence = fadeSequence ??
            [
              TweenSequenceItem<double>(weight: 1.0, tween: Tween(begin: 1, end: 0)),
              TweenSequenceItem<double>(weight: 8.0, tween: Tween(begin: 0, end: 0)),
            ],
        super(key: key) {
    if (controller == null) {
      this.controller = WeSlideController();
    }
  }

  @override
  _WeSlideState createState() => _WeSlideState();
}

class _WeSlideState extends State<WeSlide> with SingleTickerProviderStateMixin {
  // Main Animation Controller
  AnimationController _ac;
  // Panel Border Radius Effect[Tween]
  Animation<double> _panelborderRadius;
  // Body Border Radius Effect [Tween]
  Animation<double> _bodyBorderRadius;
  // Scale Animation Effect [Tween]
  Animation<double> _scaleAnimation;
  // PanelHeader animation Effect [Tween]
  Animation _fadeAnimation;

  // Get current controller
  WeSlideController get _effectiveController => widget.controller;

  // Check if panel is visible
  bool get _ispanelVisible => _ac.status == AnimationStatus.completed || _ac.status == AnimationStatus.forward;

  @override
  void initState() {
    // Subscribe to animated when value change
    _effectiveController?.addListener(_animatedPanel);
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

  /// Required for resubscribing when hot reload occurs [ValueNotifier]
  @override
  void didUpdateWidget(WeSlide oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller?.removeListener(_animatedPanel);
    widget.controller?.addListener(_animatedPanel);
  }

  // Animate the panel [ValueNotifier]
  void _animatedPanel() {
    if (_effectiveController.value != _ispanelVisible) {
      _ac.fling(velocity: _ispanelVisible ? -2.0 : 2.0);
    }
  }

  // Dispose
  @override
  void dispose() {
    //Animation Controller
    _ac.dispose();
    // ValueNotifier
    _effectiveController?.dispose();
    super.dispose();
  }

  // Gesture Vertical Update [GestureDetector]
  void _handleVerticalUpdate(DragUpdateDetails updateDetails) {
    var fractionDragged = updateDetails.primaryDelta / widget.panelMaxSize;
    _ac.value -= 1.5 * fractionDragged;
  }

  // Gesture Vertical End [GestureDetector]
  void _handleVerticalEnd(DragEndDetails endDetails) {
    if (_ac.value >= 0.5) {
      _ac.forward().then((x) {
        _effectiveController.value = true;
      });
    } else {
      _ac.reverse().then((x) {
        _effectiveController.value = false;
      });
    }
  }

  // Get Body Animation [Paralax]
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
            height: _height - max(widget.panelMinSize, widget.footerOffset),
            width: widget.bodyWidth ?? _width,
            child: widget.body,
          ),
        ),
        /** Overlay Effect **/
        AnimatedBuilder(
          animation: _ac,
          builder: (context, _) {
            return Container(
              color: _ac.value == 0.0 ? null : widget.overlayColor.withOpacity(widget.overlayOpacity * _ac.value),
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
              /** Panel Header widget **/
              widget.panelHeader != null && widget.hidePanelHeader
                  ? FadeTransition(
                      opacity: _fadeAnimation,
                      child: ValueListenableBuilder(
                        valueListenable: _effectiveController,
                        builder: (_, __, ___) {
                          return IgnorePointer(
                            ignoring: _effectiveController.value && widget.hidePanelHeader,
                            child: widget.panelHeader,
                          );
                        },
                      ),
                    )
                  : Container(),
              /** panelHeader widget is null ?**/
              widget.panelHeader != null && !widget.hidePanelHeader ? widget.panelHeader : Container(),
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
