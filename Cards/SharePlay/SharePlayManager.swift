//
//  SharePlayManager.swift
//  Cards
//
//  Created by Sam Warfield on 11/24/21.
//

import Foundation
import GroupActivities

class SharePlayManager {
    @Published var gameID: UUID?
        
    var messenger: GroupSessionMessenger?
    
    var groupSession: GroupSession<CardGameGroupActivity>?
    
    func activate() {
        Task {
            do {
                let activated = try await CardGameGroupActivity().activate()
                print("Activated: \(activated)")
            }
            catch {
                print(error)
            }
        }
        
        waitForSession()
    }
    
    private func waitForSession() {
        Task {
            for await session in CardGameGroupActivity.sessions() {
                print("New Session: \(session.id)")
                self.configureGroupSession(session)
            }
        }
    }
    
    private func configureGroupSession(_ session: GroupSession<CardGameGroupActivity>) {
        session.join()
        groupSession = session
        
        messenger = GroupSessionMessenger(session: session)
        
        configureMessenger()
    }
    
    private func configureMessenger() {
        Task {
            guard let messenger = messenger else {
                return
            }
            
            for await message in messenger.messages(of: CardGameMessage.self) {
                let participant = message.1.source
                print("New message from: \(participant.id)")
                
                handle(message.0)
            }
        }
    }
    
    private func handle(_ message: CardGameMessage) {
        print("Message: \(message)")
        gameID = message.gameID
    }
    
    func send() {
        Task {
            guard let messenger = messenger else {
                return
            }
            
            do {
                let message = CardGameMessage(id: UUID(), gameID: gameID)
                print("Sending message: \(message)")
                try await messenger.send(message)
            }
            catch {
                print("Send failed: \(error)")
            }
        }
    }
}
