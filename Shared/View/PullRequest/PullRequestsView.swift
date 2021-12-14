//
//  PullRequestsView.swift
//  DesafioGitUi (iOS)
//
//  Created by FRANCISCO SAMUEL DA SILVA MARTINS on 14/12/21.
//

import SwiftUI

struct PullRequestsView: View {
    var repositorio : String
    var criador : String
    let pullRequests : [PullRequestDTO] = [PullRequestDTO(titulo: "ahoy", estado: "open", url: "dasdas", numero: 2, autorImagem: "heart.fill", autorNome: "lerry"), PullRequestDTO(titulo: "batman", estado: "close", url: "bbbbbb", numero: 5, autorImagem: "heart.fill", autorNome: "cleber"), PullRequestDTO(titulo: "gatcha", estado: "closed", url: "heart.fill", numero: 5, autorImagem: "heart.fill", autorNome: "termer")]
    var body: some View {
        NavigationView { List(pullRequests, id: \.id){ pullRequest in
            PullRequestCell(pullRequest: pullRequest)}}
    }
    
}

struct PullRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestsView(repositorio: "vsouza", criador: "awesome-ios")
    }
}
