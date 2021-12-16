//
//  RepositoriesService.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

protocol RepositoriesService {
    func getRepositories(completion: @escaping (_ success: Bool, _ results: GitHubReponse?, _ error: String?) -> Void)
}
