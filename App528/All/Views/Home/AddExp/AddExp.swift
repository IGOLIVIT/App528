//
//  AddExp.swift
//  App528
//
//  Created by IGOR on 12/09/2024.
//

import SwiftUI

struct AddExp: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.currentCat)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                router.wrappedValue.dismiss()
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
                    
                    VStack(spacing: 26) {
                        
                        ZStack(content: {
                            
                            Text("$ 0.00")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 32, weight: .bold))
                                .opacity(viewModel.exSum.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.exSum)
                                .foregroundColor(Color.white)
                                .font(.system(size: 32, weight: .medium))
                            
                        })
                        
                        ZStack(content: {
                            
                            Text("Today")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 15, weight: .bold))
                                .opacity(viewModel.exDate.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.exDate)
                                .foregroundColor(Color.white)
                                .font(.system(size: 15, weight: .medium))
                            
                        })
                        
                        ZStack(content: {
                            
                            Text("Comment")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 15, weight: .bold))
                                .opacity(viewModel.exComment.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.exComment)
                                .foregroundColor(Color.white)
                                .font(.system(size: 15, weight: .medium))
                            
                        })
                    }
                }
                
                Button(action: {
                    
                    if viewModel.currentType == "Income" {
                        
                        viewModel.inc += Int(viewModel.exSum) ?? 0
                        
                    } else if viewModel.currentType == "Expenses" {
                        
                        viewModel.exp += Int(viewModel.exSum) ?? 0

                    }
                    
                    viewModel.exCat = viewModel.currentCat
                    
                    viewModel.addExp()
                    
                    viewModel.exSum = ""
                    viewModel.exDate = ""
                    viewModel.exComment = ""
                    viewModel.currentCat = ""
                    
                    viewModel.fetchExpenses()
      
                    withAnimation(.spring()) {
                        
                        viewModel.isAddExp = false
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Comfirm")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.exDate.isEmpty || viewModel.exSum.isEmpty || viewModel.exComment.isEmpty ? 0.5 : 1)
                .disabled(viewModel.exDate.isEmpty || viewModel.exSum.isEmpty || viewModel.exComment.isEmpty ? true : false)
                
            }
            .padding()
        }
    }
}

#Preview {
    AddExp(viewModel: HomeViewModel())
}
