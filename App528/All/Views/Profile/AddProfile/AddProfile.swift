//
//  AddProfile.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct AddProfile: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit profile")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProfile = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photoForProfile, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentProfPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentProfPhoto.isEmpty {
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 32, weight: .regular))
                                    .frame(width: 70, height: 70)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                    .frame(width: 100, height: 100)
                                    .background(RoundedRectangle(cornerRadius: 35).stroke(Color("bg3")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentProfPhoto)
                                    .resizable()
                                    .cornerRadius(20)
                                    .frame(width: 70, height: 70)
                                    .frame(width: 100, height: 100)
                                    .background(RoundedRectangle(cornerRadius: 35).stroke(Color("bg3")))
                                    .padding(1)

                            }
                            
                        })
                        .padding(.bottom)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    }
                }
                
                Button(action: {
                    
                    viewModel.photoProfile = viewModel.currentProfPhoto
                    viewModel.nameProfile = viewModel.addName
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddProfile = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    AddProfile(viewModel: HomeViewModel())
}
