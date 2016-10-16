//
//  Socket.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import SocketIO

class Socket: NSObject {
    static let sharedInstance = Socket()
    private var socket: SocketIOClient!

    override init() {
        super.init()

        socket = SocketIOClient(socketURL: URL(string: "http://192.168.0.15:8080")!, config: [.log(true), .forcePolling(true)])

        register()
    }

    private func register() {
        socket.on("connect") {data, ack in
            print("socket connected")
            store.dispatch(ConnectionAction(connectionStatus: ConnectionState.Status.connected))
        }

        socket.on("connect_error") {data, ack in
            print("socket connect_error")
            store.dispatch(ConnectionAction(connectionStatus: ConnectionState.Status.error))
        }

        socket.on("error") {data, ack in
            print("socket connect_error")
            store.dispatch(ConnectionAction(connectionStatus: ConnectionState.Status.error))
        }

        socket.on("connecting") {data, ack in
            store.dispatch(ConnectionAction(connectionStatus: ConnectionState.Status.connecting))
        }

        socket.on("number_of_clients") {data, ack in
            guard let dict = data[0] as? [AnyHashable: Any] else {
                return
            }

            guard let value = dict["value"] as? Int else {
                return
            }

            store.dispatch(ReceivedNumberOfConnections(value: value))

        }

        socket.on("number_of_clicks") {data, ack in
            guard let dict = data[0] as? [AnyHashable: Any] else {
                return
            }

            guard let value = dict["value"] as? Int else {
                return
            }

            store.dispatch(ReceivedNumberOfClicks(value: value))
        }

        socket.connect()
    }

    func emit(event: String, payload: [AnyHashable: Any]? = nil) {
        socket.emit(event)
    }

}
