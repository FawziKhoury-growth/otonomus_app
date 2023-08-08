import 'package:flutter/material.dart';

class LoadingIndicatorOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    hide(); // Hide any existing overlay

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Stack(
          children: [
            ModalBarrier(color: Colors.black.withOpacity(0.3), dismissible: false),
            Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}