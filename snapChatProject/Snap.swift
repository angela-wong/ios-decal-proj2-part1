//
//  Snap.swift
//  snapChatProject
//
//  Created by Angela Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    
    let username: String
    let feed: String
    let pic: UIImage
    var read: Bool = false
    
    init(username: String, feed: String, pic: UIImage) {
        self.pic = pic
        self.username = username
        self.feed = feed
    }
    
}
