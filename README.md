# Taylor

iOS Framework with a bunch of classes and helpers for Swift. 

## Requirements

- iOS 8.0+
- Xcode 7.3
- Swift 2.3 (use the `v1.1` tag if you need Swift < 2.3 support)

## Installation

You can use [Carthage](github.com/carthage/carthage) to install `Taylor` by adding it to your `Cartfile`:

```
github "mirego/taylor-ios"
```

### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `Taylor` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'YourLibrary'
```

### Manually

1. Download and drop the Swift file you need in your project.  
2. Congratulations!

## Usage example

```swift
import Taylor

let button = UIButton(type: .Custom)
button.setBorder(width: 2, color: .redColor())
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
