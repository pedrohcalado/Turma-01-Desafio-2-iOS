//
//  RepositorioCell.swift
//  DesafioGitUi (iOS)
//
//  Created by FRANCISCO SAMUEL DA SILVA MARTINS on 14/12/21.
//

import SwiftUI

struct RepositorioCell : View {
    var repositorio : RepositorioDTO
    var body: some View {
        HStack {
            Image(systemName: repositorio.autorImagem).resizable().scaledToFit().frame( height: 70).cornerRadius(4)
            VStack(alignment: .leading, spacing: 5) {
                Text(repositorio.nomeRepositorio).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(0.5)
                Text("Autor: \(repositorio.nomeAutor)").font(.subheadline).foregroundColor(.secondary)
                Text("Estrelas: \(repositorio.numeroEstrelas)")
                Text("Forks: \(repositorio.numeroForks)")
            }
        }
    }
}
