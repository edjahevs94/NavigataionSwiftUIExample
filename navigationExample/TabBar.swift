//
//  TabBar.swift
//  navigationExample
//
//  Created by EdgardVS on 19/12/22.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .green
        case .person:
            return .red
        case .leaf:
            return .orange
       
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                  Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                            .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                            .foregroundColor(selectedTab == tab ? tabColor : .gray)
                            .font(.system(size: 22))
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                        }
                        Text("\(tab.rawValue.firstUppercased)").foregroundColor(.gray)
                            .animation(nil)
                    }
                  Spacer()
                    
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.house))
    }
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
