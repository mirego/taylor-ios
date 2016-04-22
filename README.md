# Taylor

iOS Framework with a bunch of classes and helpers for Swift. 

## Installation

You will need [Carthage](github.com/carthage/carthage) to use Taylor in your project.

	1. Create a `Cartfile`
	2. Add `github "mirego/taylor-ios" "master"`
	3. Run `carthage bootstrap --platform ios --use-ssh`
	4. Drop the generated `Taylor.framework` into your project

:warning: Don't forget to add the "Copy framework" build phase, as explained in [the official documentation](https://github.com/carthage/carthage#if-youre-building-for-ios-tvos-or-watchos).

## What about Jenkins?

Carthage is installed on all of our Jenkins slaves. Add the following to your build script:
	
```shell
BUILD_PREBUILD_SCRIPT="carthage_bootstrap.sh"
```

In "carthage_bootstrap.sh":
	
```shell
carthage bootstrap --platform ios --use-ssh
```

## License

`Taylor` is © 2016 [Mirego](http://www.mirego.com).

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
