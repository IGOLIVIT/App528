//
//  ProfileView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.bottom, 30)
                
                if viewModel.photoProfile.isEmpty {
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 32, weight: .regular))
                        .frame(width: 70, height: 70)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        .frame(width: 100, height: 100)
                        .background(RoundedRectangle(cornerRadius: 35).stroke(Color("bg3")))
                        .padding(1)
                    
                } else {
                    
                    Image(viewModel.photoProfile)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 70, height: 70)
                        .frame(width: 100, height: 100)
                        .background(RoundedRectangle(cornerRadius: 35).stroke(Color("bg3")))
                        .padding(1)
                }
                
                HStack {
                    
                    if viewModel.nameProfile.isEmpty {
                        
                        Text("Username")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 18, weight: .regular))
                        })
                        
                    } else {
                        
                        Text(viewModel.nameProfile)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 16, weight: .semibold))
                        })
                        
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddProfile, content: {
            
            AddProfile(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
