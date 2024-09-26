//
//  CurrencyView.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI

struct CurrencyView: View {
    
    @StateObject var viewModel = CurrencyViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Currency")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                if viewModel.notes.isEmpty {
                    
                    VStack {
                        
                        Image(systemName: "note.text")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 40))
                            .padding()
                        
                        Text("Add your first note. This may be useful for investment")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("New note")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .padding()
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.notes, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedNote = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        HStack {
                                            
                                            Image(index.curCurrency ?? "")
                                            
                                            Text(index.curCurrency ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                        }
                                        .padding(.bottom, 8)
                                        
                                        Text(index.curTitle ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Text(index.curText ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                })
                            }
                        }
                    }
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
                .opacity(viewModel.notes.isEmpty ? 0 : 1)
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchNoteAs()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NotDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrencyView()
}
