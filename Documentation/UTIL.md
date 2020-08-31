# Utilities

**Overview**\
This document describes utility functions such as their usage, and use cases.

## Contents

- [Using SF Symbols on macOS](#using-sf-symbols-on-macos)

## Using SF Symbols on macOS

**Description**\
SF Symbols are only available on macOS 11, therefore I created the following public function. This function uses SF Symbols whenever the user is using macOS 11+. Otherwise, the user is default to images in the project assets.

```swift
public func useSFSymboleIfPossible(fromOldImage: String, toNewSFSymbol: String);
```

**Parameters**\

```
{
    fromOldImage: [old image file names to use]
    toNewSFSymbol: [sf symbol name]
}
```
