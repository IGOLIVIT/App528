//
//  TabBar.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .frame(width: 13, height: 13)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
                            .font(.system(size: 10, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.black))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Currency = "Currency"
    
    case Settings = "Settings"
                
}
