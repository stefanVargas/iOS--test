//
//  VisualFormatPatterns.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation

import Foundation

class VisualFormatPatterns {
    
    static let h = "H:"
    static let v = "V:"
    static let edge = "|"
    static let mainView = "[v0]"
    static let fullHorDefault = "H:|-4-[v0]-2-|"
    static let fullVerDefault = "V:|-4-[v0]-2-|"
    static let fullHorTotal = "H:|[v0]|"
    static let fullVerTotal = "V:|[v0]|"
    static let fullHorSmall = "H:|-[v0]-|" /// == -8-[v0]-8-
    static let fullVerSmall = "V:|-[v0]-|" /// == -8-[v0]-8-
    static let fullHorBig = "H:|-16-[v0]-16-|"
    static let fullVerBig = "V:|-16-[v0]-16-|"
    static func ajustableInCenterVer (top: Int, bottom: Int) -> String {  return "V:|-(>=\(top))-[v0]-(>=\(bottom))-|" }
    static func ajustableInCenterHor (left: Int,right: Int) -> String {  return "H:|-(>=\(left))-[v0]-(>=\(right))-|" }
    
}
