//
//  RepositoryDTO.swift
//  DesafioGitUi (iOS)
//
//  Created by FRANCISCO SAMUEL DA SILVA MARTINS on 14/12/21.
//

import Foundation

struct RepositorioDTO : Identifiable{
    let id = UUID()
    let nomeRepositorio : String
    let descricao: String
    let nomeAutor: String
    let autorImagem: String
    let numeroEstrelas: Int
    let numeroForks: Int
}
