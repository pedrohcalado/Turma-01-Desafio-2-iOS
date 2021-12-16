//
//  PullRequest.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 16/12/21.
//

typealias PullRequests = [PullRequest]

struct PullRequest: Codable {
    let title: String
    let body: String
    let author: Author
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case body
        case author = "user"
        case createdAt = "created_at"
    }
}

struct Author: Codable {
    let name: String
    let profilePicture: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case profilePicture = "avatar_url"
    }
}
