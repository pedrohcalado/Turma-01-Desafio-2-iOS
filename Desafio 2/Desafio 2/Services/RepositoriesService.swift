//
//  RepositoriesService.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

protocol RepositoriesService {
    func getRepositories(nextPageToLoad: Int, completion: @escaping (_ success: Bool, _ results: GitHubReponse?, _ error: String?) -> Void)
    func getPullRequests(fromRepository repositoryName: String, ownedBy repositoryOwner: String, completion: @escaping (Bool, PullRequests?, String?) -> Void)
}
