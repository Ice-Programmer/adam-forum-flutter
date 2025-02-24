import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  final bool isSelected;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final IconData? unselectedAnimateIcon;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onPressed;
  final double iconSize;
  final bool applyRotationOnDeselect;
  final double startY;

  const AnimatedIconButton({
    super.key,
    required this.isSelected,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onPressed,
    this.iconSize = 32,
    this.applyRotationOnDeselect = false,
    this.unselectedAnimateIcon,
    this.startY = -30,
  });

  @override
  AnimatedIconButtonState createState() => AnimatedIconButtonState();
}

class AnimatedIconButtonState extends State<AnimatedIconButton>
    with TickerProviderStateMixin {
  final GlobalKey _buttonKey = GlobalKey();
  final Random _random = Random();

  @override
  void didUpdateWidget(AnimatedIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      _playAnimation(widget.isSelected);
    }
  }

  void _playAnimation(bool isSelected) {
    final unselected = widget.unselectedAnimateIcon ?? widget.unselectedIcon;
    final icon = isSelected ? widget.selectedIcon : unselected;
    final color = isSelected ? widget.selectedColor : widget.unselectedColor;
    final applyRotation = !isSelected && widget.applyRotationOnDeselect;
    _createParticles(icon, color, applyRotation);
  }

  void _createParticles(IconData icon, Color color, bool applyRotation) {
    final renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final buttonPosition = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;

    // 延迟到当前帧结束后执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < 5; i++) {
        final entry = OverlayEntry(
          builder: (context) => Particle(
            startOffset:
                buttonPosition + Offset(buttonSize.width / 2 - 12, widget.startY),
            icon: icon,
            color: color,
            shouldRotate: applyRotation,
            random: _random,
          ),
        );
        Overlay.of(context).insert(entry);
        Future.delayed(const Duration(milliseconds: 800), entry.remove);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _buttonKey,
      iconSize: widget.iconSize,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          widget.isSelected ? widget.selectedIcon : widget.unselectedIcon,
          color:
              widget.isSelected ? widget.selectedColor : widget.unselectedColor,
          key: ValueKey<bool>(widget.isSelected),
        ),
      ),
      onPressed: widget.onPressed,
    );
  }
}

class Particle extends StatefulWidget {
  final Offset startOffset;
  final IconData icon;
  final Color color;
  final bool shouldRotate;
  final Random random;

  const Particle({
    super.key,
    required this.startOffset,
    required this.icon,
    required this.color,
    required this.shouldRotate,
    required this.random,
  });

  @override
  ParticleState createState() => ParticleState();
}

class ParticleState extends State<Particle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  late Animation<double> _opacity;
  late Animation<double> _scale;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    final endDy = widget.startOffset.dy - 80;
    final endDx =
        widget.startOffset.dx + (widget.random.nextDouble() - 0.5) * 40;

    _offset = Tween<Offset>(
      begin: widget.startOffset,
      end: Offset(endDx, endDy),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuad,
    ));

    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scale = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _rotation = Tween<double>(
      begin: 0,
      end: widget.shouldRotate
          ? pi / 3 * (widget.random.nextBool() ? 1 : -1)
          : 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Positioned(
        left: _offset.value.dx,
        top: _offset.value.dy,
        child: Opacity(
          opacity: _opacity.value,
          child: Transform(
            transform: Matrix4.identity()
              ..scale(_scale.value)
              ..rotateZ(_rotation.value),
            alignment: Alignment.center,
            child: Icon(widget.icon, color: widget.color, size: 20),
          ),
        ),
      ),
    );
  }
}
