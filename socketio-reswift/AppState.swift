//
//  AppState.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

struct AppState: StateType {
    let countState: CountState
    let connectionState: ConnectionState
}
