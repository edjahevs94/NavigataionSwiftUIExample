//
//  Article.swift
//  navigationExample
//
//  Created by EdgardVS on 19/12/22.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()
    let title : String
    let author: String
    
}

extension Article {
    static let example: [Article] = [
        .init(title: "Making 5 Apps in 1 hour", author: "Flo writes Code"),
        .init(title: "Combine Mastery", author: "BigMountainStudio"),
        .init(title: "Dad Jokes", author: "Stewart Lynch")
    ]
}
