//
//  User.swift
//  ThreadsTutorials
//
//  Created by usradmin on 4/7/24.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
