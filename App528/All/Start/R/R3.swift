//
//  R3.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 8) {
                    
                    Text("Learn financial literacy")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text("A selection of useful tips")
                        .foregroundColor(Color("bg3"))
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    R3()
}
