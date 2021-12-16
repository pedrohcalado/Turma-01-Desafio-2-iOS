//
//  RepositoriesView.swift
//  Desafio 2
//
//  Created by PEDRO HENRIQUE CALADO on 12/15/21.
//

import SwiftUI

struct RepositoriesView: View {
    @StateObject var repositoriesViewModel = RepositoriesViewModel(service: GitHubService())
    
    var body: some View {
        NavigationView {
            List(repositoriesViewModel.repositories, id: \.id) { item in
                NavigationLink(
                    destination: PullRequestsView(repositoryName: item.repositoryName, repositoryOwner: item.owner),
                    label: {
                        VStack(alignment: .leading) {
                            HStack {
                                CustomImageView(urlString: "\(item.pictureURL)")
                                VStack(alignment: .leading, spacing: 3) {
                                    HStack {
                                        Text("Name: ")
                                            .fontWeight(.semibold)
                                        Text("\(item.repositoryName)")
                                    }
                                    HStack {
                                        Text("Author: ")
                                            .fontWeight(.semibold)
                                        Text("\(item.owner)")
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    HStack {
                                        Text("Stars:")
                                            .fontWeight(.semibold)
                                        Text("\(item.stars)")
                                    }
                                    HStack {
                                        Text("Forks: ")
                                            .fontWeight(.semibold)
                                        Text("\(item.forks)")
                                    }
                                }
                                
                                HStack {
                                    Text("Description:")
                                        .fontWeight(.semibold)
                                    Text("\(item.description)")
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.9)
                                }
                                
                            }
                        }
                    }
                )
                
            }
            .navigationBarTitle("Swift Repositories")
        }
    }
}

//struct RepositoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoriesView()
//    }
//}
