//
//  PullRequestDTO.swift
//  DesafioGitUi (iOS)
//
//  Created by FRANCISCO SAMUEL DA SILVA MARTINS on 14/12/21.
//

import Foundation

struct PullRequestDTO: Identifiable {
    let id = UUID()
    let titulo : String
    let estado : String
    let url : String
    let numero: Int
    let autorImagem : String
    let autorNome : String
}

