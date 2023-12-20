//
//  GameDelegateProtocol.swift
//  lab3Prop
//
//  Created by student on 20.12.2023.
//

import Foundation

protocol GameDelegateProtocol: AnyObject {
    func getGameResult() -> String
    func addToGameString(str: String)
    func clearGameString()
}
