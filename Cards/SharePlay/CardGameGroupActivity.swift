//
//  CardGameGroupActivity.swift
//  Cards
//
//  Created by Sam Warfield on 11/24/21.
//

import Foundation
import GroupActivities

struct CardGameGroupActivity: GroupActivity {
    static let activityIdentifier = "com.samwarfield.card-game-with-friends"
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Card Game Activity", comment: "")
        metadata.type = .generic
        return metadata
    }
}
