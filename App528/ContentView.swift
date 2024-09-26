//
//  ContentView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Home

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        HomeView()
                            .tag(Tab.Home)
                        
                        CurrencyView()
                            .tag(Tab.Currency)
                        
                        SettingsView()
                            .tag(Tab.Settings)

                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
