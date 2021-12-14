//
//  ContentView.swift
//  Shared
//
//  Created by FRANCISCO SAMUEL DA SILVA MARTINS on 14/12/21.
//

import SwiftUI

struct RepositorioListView: View {
    var repositorios : [RepositorioDTO] = [RepositorioDTO(nomeRepositorio: "samuelssss", descricao: "teste", nomeAutor: "claudio", autorImagem: "heart.fill", numeroEstrelas: 20, numeroForks: 15),RepositorioDTO(nomeRepositorio: "paudsdsd", descricao: "teste", nomeAutor: "paulo", autorImagem: "heart.fill", numeroEstrelas: 10, numeroForks: 20),RepositorioDTO(nomeRepositorio: "claudsd", descricao: "teasda", nomeAutor: "fffff", autorImagem: "heart.fill", numeroEstrelas: 8, numeroForks: 20)]
    
    var body: some View {
        
        NavigationView {
            List(repositorios, id: \.id) { repositorio in
                NavigationLink(destination: PullRequestsView(repositorio: repositorio.nomeRepositorio, criador: repositorio.nomeAutor)) {
                    RepositorioCell(repositorio: repositorio)

                }
            }.navigationTitle("Repositios Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepositorioListView()
    }
}
