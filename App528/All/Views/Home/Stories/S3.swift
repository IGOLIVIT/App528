//
//  S3.swift
//  App528
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI

struct S3: View {

    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image("s3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    })
                    
                    Spacer()
                    
                }
                
                Spacer()

            }
            .padding()
        }
    }
}

#Preview {
    S3()
}
