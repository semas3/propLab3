//
//  GameDelegate.swift
//  lab3Prop
//
//  Created by student on 20.12.2023.
//

import Foundation

class GameDelegate : GameDelegateProtocol {
    var res: String = ""
    func addToGameString(str: String) {
        res += str
    }
    
    func clearGameString() {
        res = ""
    }
    

    
    func getGameResult() -> String {
        return res
    }
    
}
