//
//  CategoriesView.swift
//  App528
//
//  Created by IGOR on 12/09/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Category")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()

                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 40)
                
                if viewModel.currentType == "Expenses" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentCat == index ? .black : Color("bg3"))
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 5)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3").opacity(viewModel.currentCat == index ? 1 : 0)))
                                })
                            }
                        })
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentCat == index ? .black : Color("bg3"))
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 5)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3").opacity(viewModel.currentCat == index ? 1 : 0)))
                                })
                            }
                        })
                    }
                }
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 24)
                                    .background(RoundedRectangle(cornerRadius: 7).fill(Color("bg3").opacity(viewModel.currentType == index ? 1 : 0)))
                            })
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 25)
                .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.05)))
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddExp = true
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.currentCat.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentCat.isEmpty ? true : false)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddExp, content: {
            
            AddExp(viewModel: viewModel)
        })
    }
}

#Preview {
    CategoriesView(viewModel: HomeViewModel())
}
