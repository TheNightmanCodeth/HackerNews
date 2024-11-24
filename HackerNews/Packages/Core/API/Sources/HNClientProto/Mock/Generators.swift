//
//  Generators.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

enum HNMocks {
    static func author() -> String {
        ["frank", "charlie", "dennis", "dee"].randomElement() ?? "joe"
    }
    
    static func id() -> Int {
        Int.random(in: 100000...999999)
    }
    
    static func time() -> Int {
        Int(Date.now.timeIntervalSinceReferenceDate)
    }
    
    static func title() -> String {
        let shitPosts = ["Elixir", "Rust", "JavaScript"].map { "\($0) \(["Good", "Bad"].randomElement()!)" }
        
        return (shitPosts + [
            "New JavaScript library just dropped obsoleting React.js",
            "Microsoft Accidentally Sold Government Secrets to Iran",
            "LLMs Are Actually Really Stupid",
            "LLMs Will Revolutionize Human Existence",
            "SpaceX Launches 3 Sewer Rats Into Orbit \"Just in Case\""
        ]).randomElement()!
    }
}
