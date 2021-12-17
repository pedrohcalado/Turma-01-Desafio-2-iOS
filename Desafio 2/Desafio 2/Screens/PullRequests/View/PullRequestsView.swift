//
//  PullRequestsView.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 16/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PullRequestsView: View {
    var repositoryName: String
    var repositoryOwner: String
    
    @ObservedObject var pullRequestsViewModel: PullRequestsViewModel
    
    init(repositoryName: String, repositoryOwner: String) {
        self.repositoryName = repositoryName
        self.repositoryOwner = repositoryOwner
        self.pullRequestsViewModel = PullRequestsViewModel(service: GitHubService(), repositoryName: repositoryName, repositoryOwner: repositoryOwner)
    }
    
    var body: some View {
        NavigationView {
            List(pullRequestsViewModel.pullRequests, id: \.id) { item in
                
                VStack(alignment: .leading) {
                    HStack {
                        WebImage(url: URL(string: item.authorProfilePictureURL))
                            .resizable()
                            .placeholder(Image(systemName: "photo"))
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
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
                }.onTapGesture {
                    UIApplication.shared.open(URL(string: item.htmlURL) ?? K.gitHubURL)
                }
            }
            .navigationBarTitle("Pull Requests", displayMode: .inline)
        }
    }
}
