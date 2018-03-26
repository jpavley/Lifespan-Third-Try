//
//  SharedState.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 3/24/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import UIKit

protocol SharedState {
    var userProfile: UserProfile? { get set }
    var lifeSpan: Lifespan? { get set }
    var lifeClock: LifeClock? { get set }
}

extension SharedState {
    
    func prepareState(for segue: UIStoryboardSegue) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.destination is SharedState {
            
            var destination = segue.destination as! SharedState
            destination.userProfile = userProfile
            destination.lifeSpan = lifeSpan
            destination.lifeClock = lifeClock
        }
    }
    
}
