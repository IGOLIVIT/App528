//
//  LoadingView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160)
                    .padding(.bottom, 190)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 120)
            }
        }
    }
}

#Preview {
    LoadingView()
}
