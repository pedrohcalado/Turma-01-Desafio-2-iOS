//
//  GitHubService.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

import Foundation
import Alamofire

class GitHubService: RepositoriesService {
    
    func getRepositories(nextPageToLoad: Int = 1, completion: @escaping (Bool, GitHubReponse?, String?) -> Void) {
        print("https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(nextPageToLoad)")
        let request = AF.request("https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(nextPageToLoad)")
        request.validate().responseDecodable(of: GitHubReponse.self) { response in
            switch response.result {
            case .success:
                print("REPOSITORIES", response.value?.repositories.count ?? "SEM REPOS")
                completion(true, response.value, nil)
            case .failure(let error):
                completion(false, nil, "Error when fetching repositories: \(error)")
            }
        }
    }
    
    func getPullRequests(fromRepository repositoryName: String, ownedBy repositoryOwner: String, completion: @escaping (Bool, PullRequests?, String?) -> Void) {
        let request = AF.request("https://api.github.com/repos/\(repositoryOwner)/\(repositoryName)/pulls")
        request.validate().responseDecodable(of: PullRequests.self) { response in
            switch response.result {
            case .success:
                print("PULL REQUESTS")
                completion(true, response.value, nil)
            case .failure(let error):
                print("DEU RUIM")
                completion(false, nil, "Error when fetching pull requests: \(error)")
            }
        }
    }
}
