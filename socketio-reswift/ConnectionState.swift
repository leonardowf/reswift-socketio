//
//  ConnectionStatus.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift


class ConnectionState: NSObject, StateType {
    enum Status {
        case unknown
        case connected
        case connecting
        case error
    }

    let status: Status

    init(status: Status) {
        self.status = status
    }

}
