//
//  HomeView.swift
//  navigationExample
//
//  Created by EdgardVS on 19/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    var body: some View {
        ZStack {
            NavigationStack(path: $path) {
                List {
                    Section("People") {
                        ForEach(Person.example) { person in
                            NavigationLink(value: person){
                                VStack(alignment: .leading) {
                                    Text("\(person.name)")
                                    
                                    Text(person.age, format: .number)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            
                        }
                    }
                    
                    Section("Articles"){
                        ForEach(Article.example) { article in
                            NavigationLink(value: article) {
                                VStack(alignment: .leading) {
                                    Text("\(article.title)")
                                        .font(.headline)
                                    
                                    Text("\(article.author)")
                                        .font(.subheadline)
                                }
                            }
                        }
                        Button("Navigate to person 2") {
                            path.append(Person.example[2])
                        }
                    }
                    
                }.navigationDestination(for: Person.self) { person in
                    Text(person.name)
                        .font(.headline)
                }
                .navigationDestination(for: Article.self) { article in
                    VStack {
                        Text(article.title)
                            .font(.headline)
                        
                        Button("Pop to root") {
                            path.removeLast(path.count)
                        }
                        
                        Button("Navigate to person 1") {
                            path.append(Person.example[1])
                        }
                        
                    }
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
