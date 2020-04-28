//
//  InterfaceController.swift
//  FoodFinderWatch Extension
//
//  Created by Akua Afrane-Okese on 2020/04/28.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var ingredientsLabel: WKInterfaceLabel!
    let session = WCSession.default
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        session.delegate = self
        session.activate()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        titleLabel.setText(message["title"] as? String)
        ingredientsLabel.setText(message["ingredients"] as? String)
        print("Recieved: \(message)")
    }
}
