//
//  AppReducer.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

class AppReducer: NSObject, Reducer {
    typealias ReducerStateType = AppState

    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {

        return ReducerStateType(countState: CountReducer().handleAction(action: action, state: state?.countState),
                                connectionState: ConnectionReducer().handleAction(action: action, state: state?.connectionState))
    }

}
