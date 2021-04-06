//
//  MyApplication.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 3/30/21.
//  Copyright © 2021 An Tran. All rights reserved.
//

import UIKit
import Tealeaf
class MyApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        TLFApplicationHelper.sharedInstance()?.send(event)
        super.sendEvent(event)
    }
    override func sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool{
        TLFApplicationHelper.sharedInstance()?.sendAction(action, to: target, from: sender, for: event)
        return super.sendAction(action, to: target, from: sender, for: event)
    }
}
