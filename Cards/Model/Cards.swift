//
//  Cards.swift
//  Cards
//
//  Created by Wayne Bishop on 2/3/22.
//

import Foundation
import GroupActivities

struct Cards: GroupActivity {
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Cards App", comment: "Title of group activity")
        metadata.type = .generic
        return metadata
    }
}
