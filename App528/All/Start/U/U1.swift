//
//  U1.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color(.white)
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Increase your income")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text("Financial control")
                        .foregroundColor(Color("bg3"))
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .frame(height: 290)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("bg")))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    U1()
}
