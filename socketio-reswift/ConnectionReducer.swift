//
//  ConnectionReducer.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

class ConnectionReducer: NSObject, Reducer {
    typealias ReducerStateType = ConnectionState

    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
        let state = state ?? initialState()

        switch action {
        case let action as ConnectionAction:
            return ConnectionState(status: action.connectionStatus)
        default:
            break
        }

        return state
    }

    func initialState() -> ReducerStateType {
        return ConnectionState(status: ConnectionState.Status.unknown)
    }

}

struct ConnectionAction: Action {
    let connectionStatus: ConnectionState.Status
}
