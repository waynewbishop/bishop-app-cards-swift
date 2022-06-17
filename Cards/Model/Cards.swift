//
//  Cards.swift
//  Cards
//
//  Created by Wayne Bishop on 5/4/22.
//

import Foundation
import GroupActivities

/*
Abstract:
The activity in which users draw together.
*/

import Foundation
import GroupActivities

//an object that returns the metadata computed property

struct Cards: GroupActivity {
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Cards", comment: "Cards with Friends..")
        metadata.subtitle = "Play fun card games with friends"
        metadata.type = .generic
        return metadata
    }
}
