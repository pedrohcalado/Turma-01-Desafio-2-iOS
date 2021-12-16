//
//  RepositoriesViewModel.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

import Foundation

class RepositoriesViewModel: ObservableObject, Identifiable {
    @Published var repositories: [RepositoryViewModel] = []
    
    init(service: RepositoriesService) {
        service.getRepositories { success, results, error in
            if success {
                // TODO - ajustar para ObjectMapper
                self.repositories = results?.repositories.map { RepositoryViewModel(repositoryName: $0.repositoryName, owner: $0.owner.ownerName, pictureURL: $0.owner.profilePicture, stars: String($0.stars), forks: String($0.forks), description: $0.description ?? "")} ?? []
            } else {
                self.repositories = []
            }
        }
    }
}

class RepositoryViewModel: ObservableObject, Identifiable {
    @Published var repositoryName: String = "-"
    @Published var owner: String = "-"
    @Published var pictureURL: String = ""
    @Published var stars: String = "-"
    @Published var forks: String = "-"
    @Published var description: String = "-"
                    
    init(repositoryName: String, owner: String, pictureURL: String, stars: String, forks: String, description: String) {
        self.repositoryName = repositoryName
        self.owner = owner
        self.pictureURL = pictureURL
        self.stars = stars
        self.forks = forks
        self.description = description
    }
}
