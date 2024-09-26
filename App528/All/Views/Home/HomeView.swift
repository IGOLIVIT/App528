//
//  HomeView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    if viewModel.photoProfile.isEmpty {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 32, weight: .regular))
                                .frame(width: 40, height: 40)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                                .frame(width: 60, height: 60)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg3")))
                                .padding(1)
                        })
                        
                    } else {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = true
                            }
                            
                        }, label: {
                            
                            Image(viewModel.photoProfile)
                                .resizable()
                                .cornerRadius(10)
                                .frame(width: 40, height: 40)
                                .frame(width: 60, height: 60)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg3")))
                                .padding(1)
                        })
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        if viewModel.nameProfile.isEmpty {
                            
                            Text("Username")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.nameProfile)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                            
                        }
                        
                        Text("Welcome!")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 15, weight: .regular))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    
                    Button(action: {}, label: {
                        Text("Hide advice")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 12, weight: .regular))
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        S1()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom)
                            
                            Text("Optimize expenses")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                    })
                    
                    NavigationLink(destination: {
                        
                        S21()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image(systemName: "handbag.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom)
                            
                            Text("Optimize expenses")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg3")))
                    })
                    
                    NavigationLink(destination: {
                        
                        S31()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image(systemName: "latch.2.case.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom)
                            
                            Text("Optimize expenses")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
      
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                    })
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        HStack {
                            
                            Text("Income")
                                .foregroundColor(.green)
                                .font(.system(size: 17, weight: .medium))
                            
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.green)
                                .font(.system(size: 17, weight: .medium))
                        }
                        
                        Text("$ \(viewModel.inc)\(Text(".000").foregroundColor(Color("bg3")))")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        HStack {
                            
                            Text("Expenses")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .medium))
                            
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .medium))
                        }
                        
                        Text("$ \(viewModel.exp)\(Text(".000").foregroundColor(Color("bg3")))")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        HStack {
                            
                            Text("Today")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.exp)")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("During the week")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.exp)")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Per month")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.exp)")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .background(Circle().fill(Color.yellow))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            CategoriesView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            ProfileView()
        })
    }
}

#Preview {
    HomeView()
}
