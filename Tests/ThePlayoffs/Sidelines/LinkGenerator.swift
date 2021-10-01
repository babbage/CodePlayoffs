//
//  LinkGenerator.swift
//  
//
//  Created by Duncan Babbage on 30/09/21.
//

import Foundation

class LinkGenerator {
    
    static func link() -> String {
        let linkString = "https://" + randomString(maxLength: 10) + "." + randomString(maxLength: 3) + "/" + randomString(maxLength: 15) + "/" + randomString(maxLength: 10)
        return linkString
    }
    
    private static func randomString(maxLength: Int) -> String {
        let length = Int.random(in: 2..<maxLength)
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let randomString = String(randomCharacters)
        return randomString
    }

}
