//
//  DataModel.swift
//  Screenbar
//
//  Created by Li on 9/7/20.
//

import Foundation
import AppKit

struct Day: Codable, Hashable, Identifiable {
    
    var id: UUID
    var date: Date
    var sessions: [ScreenSession]
    
}

struct ScreenSession: Codable, Hashable, Identifiable {
    
    var id: UUID
    var images: [ScreenImage]
    
}

struct ScreenImage: Codable, Hashable, Identifiable {
    
    var id: UUID
    var imageURL: String
    var imageData: ImageData
    
}

struct ImageData: Codable, Hashable, Identifiable {
    
    var id: UUID
    var softwareName: String?
    var timeStamp: Date?
    //split into url path and file path?
    var path: String?
    //split into page title and file title?
    var title: String?
    
}
