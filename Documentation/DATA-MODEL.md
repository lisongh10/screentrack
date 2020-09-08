# Data Models

**Overview**\
This document describes the data model and data structure used in ScreenTrack. Note that as of Septemper 6, 2020, these models are far from finalized as it is too early in development to be able to tell.

## Contents

- [Day](#day)
- [ScreenSession](#screensession)
- [ScreenImage](#screenimage)
- [ImageData](#imagedata)

## Day

**Description**\
The _Day_ struct represents one day in ScreenTrack. Each day consists of a _date_ and an array of _sessions_ along with an UUID.

```swift
struct Day: Codable, Hashable, Identifiable {
    var id: UUID
    var date: Date
    var sessions: [ScreenSession]
}
```

## ScreenSession

**Description**\
The _ScreenSession_ struct represents one session of ScreenTrack usage. A user may have multiple sessions per day. A _ScreenSession_ consists of an array of _ScreenImage_ structs along with an UUID.

__Notes__\
In the future, this struct would theoretically contain information related to sorting and organizing user activity.

```swift
struct ScreenSession: Codable, Hashable, Identifiable {
    var id: UUID
    var images: [ScreenImage]
}
```

## ScreenImage

**Description**\
The _ScreenImage_ struct represents one image taken of the user's device. Each image consists of its _imageURL_ which is the file path that the image is stored to on the user's device and its _imageData_ which stores the metadata related to each screen-shot.

__Notes__
The _imageURL_ attribute is debatable. It is too early in development to be able to see if we need this an imageURL associated with every __ScreenImage__. Ideally, we would be able to use the built in UIImage and read images directly.

```swift
struct ScreenImage: Codable, Hashable, Identifiable {
    var id: UUID
    var imageURL: String
    var imageData: ImageData
}
```

## ImageData

**Description**\
The _ImageData_ struct represents the metadata that is associated with each screen-shot image. _ImageData_ consists of entirely optional values except for its UUID.

**Notes**\
Consider a new structure for _path_ and _title_ so the data model is more robust.

```swift
struct ImageData: Codable, Hashable, Identifiable {
    var id: UUID
    var softwareName: String?
    var timeStamp: Date?
    var path: String?
    var title: String?
}
```
