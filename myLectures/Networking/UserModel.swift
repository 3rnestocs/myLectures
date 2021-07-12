//
//  Model.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/12/21.
//

import Foundation

struct User: Codable {
    var name: String
    var place: String
    var time: String
    var status: UserStatus
}

enum UserStatus: String, Codable {
    case contact
    case received
    case made
}
