#  Data Models
__Overview__\
This document describes the data model and data structure used in ScreenTrack

## Contents
- [Day](#day)
- [ScreenSession](#screensession)
- [ScreenImage](#screenimage)
- [ImageData](#imagedata)

## Day
__Description__\
The _Day_ struct represents one day in ScreenTrack. Each day consists of a _date_ and an array of _sessions_ along with an UUID.

```swift
struct Data: Codable, Hashable, Identifiable {
    var id: UUID
    var date: Date
    var sessions: [ScreenSession]
}
```

## ScreenSession
__Description__\
The _ScreenSession_ struct represents one session of ScreenTrack usage. A user may have multiple sessions per day. A _ScreenSession_ consists of an array of _ScreenImage_ structs along with an UUID.

```swift
struct ScreenSession: Codable, Hashable, Identifiable {
    var id: UUID
    var images: [ScreenImage]
}
```

## ScreenImage
__Description__\
The _ScreenImage_ struct represents one image taken of the user's device. Each image consists of its _imageURL_ which is the file path that the image is stored to on the user's device and its _imageData_ which stores the metadata related to each screen-shot.

```swift
struct ScreenImage: Codable, Hashable, Identifiable {
    var id: UUID
    var imageURL: String
    var imageData: ImageData
}
```

## ImageData
__Description__\
The _ImageData_ struct represents the metadata that is associated with each screen-shot image. _ImageData_ consists of entirely optional values except for its UUID.

__Notes__\
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

