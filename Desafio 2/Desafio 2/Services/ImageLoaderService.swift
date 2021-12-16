//
//  ImageLoader.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/16/21.
//

import SwiftUI
//import Alamofire

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        // ver de usar Kingfisher
        
//        let request = AF.request("https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")
//        request.validate().responseDecodable(of: GitHubReponse.self) { response in
//            switch response.result {
//            case .success:
//                self.image = UIImage(data: response.data) ?? UIImage()
//            case .failure(let error):
//                completion(false, nil, "Error when fetching repositories: \(error)")
//            }
//        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
