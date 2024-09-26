//
//  SettingsView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                VStack(spacing: 8) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Rate app")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                         
                            Spacer()
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "") else { return }
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                         
                            Spacer()
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
