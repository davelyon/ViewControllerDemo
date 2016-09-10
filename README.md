### What is this?

This is a set of simple demos from a talk I gave on a variety of concepts relating to views and view controllers.

### ViewCrusher

This demo shows how Content Hugging and Compression resistance work on a view.

Drag the slider to increase or decrease the vertical size.

The segmented control indicates if the compression and hugging values are default (disabled) or specified (enabled)

### EdgesForExtended

A demo that allows tweaking various configurations for `edgesForExtendedRect` and related properties. It is not exhaustive.

### Tinting

A demo of how `tintAdjustmentMode` works with system and custom views.

Tap "Go Dark" to set the `tintAdjustmentMode` to `.dimmed`

Change:

```swift
typealias ButtonType = UIButton
```

to:

```swift
typealias ButtonType = SmarterCustomButton
```

to see the expected behavior.

### RTL

This demo does some nasty, hacky things to force everything in to Right-to-left layout. You can push a view controller (tap "Push Something"), and you can see how `imageFlippedForRightToLeftLayoutDirection()` works on the custom bar button image.

