//
//  CountState.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

class CountState: NSObject, StateType {
    let clicks: Int
    let connections: Int

    init(clicks: Int, connections: Int) {
        self.clicks = clicks
        self.connections = connections
    }

}
