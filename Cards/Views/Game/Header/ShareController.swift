//
//  SharePlayView.swift
//  Cards
//
//  Created by Wayne Bishop on 7/14/22.
//

import SwiftUI
import GroupActivities
import UIKit


struct ShareController: UIViewControllerRepresentable {
    
    var activity = Cards()
    typealias UIViewControllerType = GroupActivitySharingController
    
    func makeUIViewController(context: Context) -> GroupActivitySharingController {
         return try! GroupActivitySharingController(activity)
    }
    
    func updateUIViewController(_ uiViewController: GroupActivitySharingController, context: Context) {
    }
    
}
