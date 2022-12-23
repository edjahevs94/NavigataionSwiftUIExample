//
//  ContentView.swift
//  navigationExample
//
//  Created by EdgardVS on 19/12/22.
//

import SwiftUI



struct ContentView: View {
  
    @State private var selectedTab: Tab = .house
  
   // @State private var path = [String]()
   
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       
            
        
        ZStack{
            
            VStack {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(Tab.house)
                    MessageView()
                        .tag(Tab.message)
                }
                
            }
            
            
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
            }
        }
         
            
        }
    
       /* NavigationStack(path: $path) {
            List {
                NavigationLink("Simple String", value: "ABC")
                Button("Navigate to XYZ"){
                    path.append("XYZ")
                }
            }.navigationDestination(for: String.self) { string in
                VStack {
                    Text(string).foregroundColor(.red)
                    
                    Button("Navigate to XYZ"){
                        path.append("XYZ")
                    }
                    Button("Pop to root"){
                        path.removeAll()
                    }
                }
            }
        } */
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
