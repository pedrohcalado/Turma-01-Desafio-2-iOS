//
//  Repository.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

import Foundation

typealias Repositories = [Repository]

struct Repository: Codable {
    let repositoryName: String
    let owner: Owner
    let stars: Int
    let forks: Int
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case repositoryName = "name"
        case owner
        case stars = "stargazers_count"
        case forks = "forks_count"
        case description
    }
    
}

struct GitHubReponse: Codable {
    let repositories: Repositories
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}

struct Owner: Codable {
    let ownerName: String
    let profilePicture: String
    
    enum CodingKeys: String, CodingKey {
        case ownerName = "login"
        case profilePicture = "avatar_url"
    }
}
