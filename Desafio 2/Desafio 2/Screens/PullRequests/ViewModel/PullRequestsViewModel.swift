//
//  PullRequestsViewModel.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 16/12/21.
//

import Foundation
import UIKit

class PullRequestsViewModel: ObservableObject, Identifiable {
    @Published var pullRequests: [PullRequestViewModel] = []
    
    init(service: RepositoriesService = GitHubService(), repositoryName: String = "", repositoryOwner: String = "") {
        service.getPullRequests(fromRepository: repositoryName, ownedBy: repositoryOwner) { success, results, error in
            if success {
                self.pullRequests = results?.map { PullRequestViewModel(title: $0.title, body: $0.body, authorName: $0.author.name, authorProfilePictureURL: $0.author.profilePicture, createdAt: $0.createdAt)} ?? []
            } else {
                self.pullRequests = []
            }
        }
    }
}

class PullRequestViewModel: ObservableObject, Identifiable {
    @Published var title: String = "-"
    @Published var body: String = "-"
    @Published var authorName: String = "-"
    @Published var authorProfilePictureURL: String = "-"
    @Published var createdAt: String = "-"
    
    init(title: String, body: String, authorName: String, authorProfilePictureURL: String, createdAt: String) {
        self.title = title
        self.body = body
        self.authorName = authorName
        self.authorProfilePictureURL = authorProfilePictureURL
        self.createdAt = createdAt
    }
}
