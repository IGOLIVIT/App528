//
//  R1.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 8) {
                    
                    Text("Сontrol your finances")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text("Create an operation in a few clicks")
                        .foregroundColor(Color("bg3"))
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
