//
//  ContentView.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 15/12/21.
//

import SwiftUI

struct RepositoriesListView: View {
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                VStack(alignment: .leading) {
                    HStack {
                        Image("github")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .trailing)
                        VStack(alignment: .leading, spacing: 3) {
                            HStack {
                                Text("Name: ")
                                    .fontWeight(.semibold)
                                Text("Repository")
                            }
                            HStack {
                                Text("Author: ")
                                    .fontWeight(.semibold)
                                Text("Author Name")
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            HStack {
                                Text("Stars:")
                                    .fontWeight(.semibold)
                                Text("10")
                            }
                            HStack {
                                Text("Forks: ")
                                    .fontWeight(.semibold)
                                Text("132")
                            }
                        }
                        
                        HStack {
                            Text("Description:")
                                .fontWeight(.semibold)
                            Text("dasdsadbvcbcvbcvbcvxbcvbxccvbxcvbvxcvzxvcvcxvvcxvcxvxcvxcvcxasdsa")
                                .lineLimit(2)
                                .minimumScaleFactor(0.9)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Swift Repositories")
        }
        
        
    }
}

// Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks

struct ContentView: View {
    var body: some View {
        RepositoriesListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
