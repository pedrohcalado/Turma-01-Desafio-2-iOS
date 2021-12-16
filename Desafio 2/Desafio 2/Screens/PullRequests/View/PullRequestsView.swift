//
//  PullRequestsView.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 16/12/21.
//

import SwiftUI

struct PullRequestsView: View {
    var repositoryName: String
    var repositoryOwner: String
    
    @ObservedObject var pullRequestsViewModel: PullRequestsViewModel
    
    init(repositoryName: String, repositoryOwner: String) {
        self.repositoryName = repositoryName
        self.repositoryOwner = repositoryOwner
        self.pullRequestsViewModel = PullRequestsViewModel(service: GitHubService(), repositoryName: repositoryName, repositoryOwner: repositoryOwner)
        print("ENTROU")
    }
    
//    @StateObject var pullRequestsViewModel = PullRequestsViewModel(service: GitHubService())
    
    var body: some View {
        NavigationView {
            List(pullRequestsViewModel.pullRequests, id: \.id) { item in
                VStack(alignment: .leading) {
                    HStack {
                        CustomImageView(urlString: "\(item.authorProfilePictureURL)")
                        VStack(alignment: .leading, spacing: 3) {
                            HStack {
                                Text("Title: ")
                                    .fontWeight(.semibold)
                                Text("\(item.title)")
                            }
                            HStack {
                                Text("Author: ")
                                    .fontWeight(.semibold)
                                Text("\(item.authorName)")
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        HStack {
                            Text("Created at:")
                                .fontWeight(.semibold)
                            Text("\(item.createdAt)")
                        }
                        
                        
                        HStack {
                            Text("Body:")
                                .fontWeight(.semibold)
                            Text("\(item.body)")
                                .lineLimit(2)
                                .minimumScaleFactor(0.9)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Pull Requests")
        }
    }
}

//struct PullRequestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PullRequestsView()
//    }
//}
