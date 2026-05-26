# Taylor

iOS Framework with a bunch of classes and helpers for Swift.

## Requirements

- iOS 12.0+, tvOS 12.0+
- Xcode 15+
- Swift 5.0+

## Installation

You can use [Carthage](//github.com/carthage/carthage) to install `Taylor` by adding it to your `Cartfile`:

```
github "mirego/taylor-ios"
```

### Swift Package Manager

Add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/mirego/taylor-ios.git", from: "1.6.1")
```

Or add it via Xcode: **File › Add Package Dependencies…** and enter the repository URL.

### Manually

1. Download and drop the Swift file you need in your project.  
2. Congratulations!

## Usage example

```swift
import Taylor

let button = UIButton(type: .Custom)
button.setBorder(width: 2, color: .redColor())
```

## Safe area insets

Taylor provides a backward compatible version of `safeAreaInsets` property for UIView. The original API is available on iOS 11 and above and the replacement fills the gap on older OS version (iOS 7 to 10 inclusively). It is an opt-in feature that requires to be enabled in order to work.

To enable the feature, place this piece of code the earliest possible in your AppDelegate's `application:didFinishLaunching:withOptions` method:
```swift
UIViewController.enableCompatibilitySafeAreaInsets()
```

Your can now access the `compatibilitySafeAreaInsets` property from any UIView. On iOS 11 and above, this property returns `safeAreaInsets`. To receive safe area update callbacks, your view must conform to the `CompatibilitySafeAreaInsetsUpdate` protocol.

To cover every iOS versions, your subview could look like this:
```swift
class BaseView: UIView, CompatibilitySafeAreaInsetsUpdate {
    func compatibilitySafeAreaInsetsDidChange() {
        commonSafeAreaInsetsDidChange()
    }

    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        commonSafeAreaInsetsDidChange()
    }

    func commonSafeAreaInsetsDidChange() {
        setNeedsLayout()
    }
}
```

## Bonus

* There is a `no-bitcode` branch that's (hopefully) kept up to date with the master.

## License

Taylor is © 2016 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/taylor-ios/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
