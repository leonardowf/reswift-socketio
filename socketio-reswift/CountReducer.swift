//
//  CountReducer.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

class CountReducer: NSObject, Reducer {
    typealias ReducerStateType = CountState

    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
        let state = state ?? initialState()

        switch action {
        case let action as ReceivedNumberOfClicks:
            return CountState(clicks: action.value, connections: state.connections)
        case let action as ReceivedNumberOfConnections:
            return CountState(clicks: state.clicks, connections: action.value)
        default:
            break;
        }

        return state
    }

    func initialState() -> ReducerStateType {
        return CountState(clicks: 0, connections: 0)
    }
}

struct ReceivedNumberOfConnections: Action {
    let value: Int
}

struct ReceivedNumberOfClicks: Action {
    let value: Int
}

