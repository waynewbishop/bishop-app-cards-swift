//
//  WebSocketClient.swift
//  Cards
//
//  Created by Sam Warfield on 11/22/21.
//

import Foundation

class WebSocketClient {
    private let delegateQueue = OperationQueue()
    private let urlSessionDelegate = WebsocketURLSessionDelegate()
    private lazy var urlSession = URLSession(configuration: .default, delegate: urlSessionDelegate, delegateQueue: delegateQueue)
    private(set) var delegate = WebSocketClientDelegate()
    private weak var webSocketTask: URLSessionWebSocketTask?
    
    var isSocketOpen: Bool {
        webSocketTask != nil && delegate.isSocketOpen
    }
    
    func connect() {
        print("Socket is open: \(isSocketOpen)")
        
        guard isSocketOpen == false else {
            return
        }
        
        let url = URL(string: "ws://localhost:8080/connect")!
        let task = urlSession.webSocketTask(with: url)
        task.delegate = delegate
        
        webSocketTask = task
        
        webSocketTask?.resume()
        
        setupOnMessageRecieve()
    }
    
    func send(message: URLSessionWebSocketTask.Message) {
        print("WebSocket sending \(message)")
        webSocketTask?.send(message) { error in
            print("WebSocket sent message: \(message)")
            if let error = error {
                print("WebSocket sending error: \(error)")
            }
        }
    }
    
    func setupOnMessageRecieve() {
        webSocketTask?.receive { result in
            switch result {
            case .failure(let error):
                print("Failed to receive message: \(error)")
                
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text message: \(text)")
                case .data(let data):
                    print("Received binary message: \(data)")
                    DispatchQueue.main.async {
                        self.received(data)
                    }
                @unknown default:
                    fatalError()
                }
            }
            self.setupOnMessageRecieve()
        }
    }
    
    func received(_ data: Data) {
        print("\(String(data: data, encoding: .utf8) ?? "none")")
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}

final class WebSocketClientDelegate: NSObject, URLSessionWebSocketDelegate {
    @Published private(set) var isSocketOpen = false
    func urlSession(_ session: URLSession,
                    webSocketTask: URLSessionWebSocketTask,
                    didOpenWithProtocol protocol: String?) {
        print("socket did open")
        DispatchQueue.main.async {
            self.isSocketOpen = true
        }
    }
    
    func urlSession(_ session: URLSession,
                    webSocketTask: URLSessionWebSocketTask,
                    didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
                    reason: Data?) {
        print("socket did close")
        isSocketOpen = false
    }
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print(#function)
    }
    
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        print(#function)
    }
}

final class WebsocketURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print(#function)
    }
    
    func urlSession(_ session: URLSession,
                    didBecomeInvalidWithError error: Error?) {
        print(#function)
    }
    
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
        print(#function)
        return (URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
    }
}
