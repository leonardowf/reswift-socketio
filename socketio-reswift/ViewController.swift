//
//  ViewController.swift
//  socketio-reswift
//
//  Created by Leonardo Wistuba de França on 10/16/16.
//  Copyright © 2016 Leonardo. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    @IBOutlet weak var labelConnectionStatus: UILabel!
    @IBOutlet weak var labelNumberOfClicks: UILabel!
    @IBOutlet weak var labelNumberOfConnections: UILabel!

    var props: ViewProps? {
        didSet {
            render()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        store.subscribe(self) { state in
            (state.countState,
             state.connectionState)
        }
    }

    func render() {
        guard let props = props else {
            return
        }

        labelNumberOfClicks.text = props.numberOfClicksText
        labelConnectionStatus.text = props.connectionStatusText
        labelNumberOfConnections.text = props.connectedUsersText

    }

    @IBAction func onClick(_ sender: UIButton) {
        socket.emit(event: "click")
    }

    struct ViewProps {
        let connectedUsersText: String
        let numberOfClicksText: String
        let connectionStatusText: String
    }
}



extension ViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = (CountState, ConnectionState)

    func newState(state: (CountState, ConnectionState)) {

        let connectedUsers = "Usuários conectados: \(state.0.connections)"
        let numberOfClicks = "Número de cliques: \(state.0.clicks)"
        let connectionStatus = "Estado da conexão: \(connectionStatusToString(state.1.status))"

        let props = ViewController.ViewProps(connectedUsersText: connectedUsers, numberOfClicksText: numberOfClicks, connectionStatusText: connectionStatus)

        self.props = props
    }

    func connectionStatusToString(_ status: ConnectionState.Status) -> String {
        switch status {
        case .connected:
            return "Conectado"
        case .connecting:
            return "Conectando..."
        case .error:
            return "Erro!!!"
        case .unknown:
            return "Ainda nem sei"

        }
    }
}

