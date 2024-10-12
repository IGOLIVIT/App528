//
//  Not.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {

                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text("The newest information especially for you")
                        .foregroundColor(Color("bg3"))
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notifications")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
