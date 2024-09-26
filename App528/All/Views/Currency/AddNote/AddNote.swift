//
//  AddNote.swift
//  App528
//
//  Created by IGOR on 14/09/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: CurrencyViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New note")
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
                    
                    VStack(spacing: 18) {
                        
                        HStack {
                            
                            Text("Select currency")
                                .foregroundColor(Color("bg3"))
                                .font(.system(size: 14, weight: .medium))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.currencies, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentCUr = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(viewModel.currentCUr)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                 Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                            })
                        }
                        
                        HStack {
                            
                            Image(viewModel.currentCUr)
                            
                            Text(viewModel.currentCUr)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                        }
                        
                        ZStack(content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .opacity(viewModel.curTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.curTitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))

                        ZStack(content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .opacity(viewModel.curText.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.curText)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                    }
                }
                
                Button(action: {
                    
                    viewModel.curCurrency = viewModel.currentCUr
                    
                    viewModel.addNote()
                    
                    viewModel.curText = ""
                    viewModel.curTitle = ""
                    
                    viewModel.fetchNoteAs()
      
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.curText.isEmpty || viewModel.curTitle.isEmpty ? 0.5 : 1)
                .disabled(viewModel.curText.isEmpty || viewModel.curTitle.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddNote(viewModel: CurrencyViewModel())
}
