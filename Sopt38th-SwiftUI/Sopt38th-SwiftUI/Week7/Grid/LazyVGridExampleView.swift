//
//  LazyVGridExampleView.swift
//  Sopt38th-SwiftUI
//
//  Created by mandoo on 5/23/26.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { value in
                    ZStack {
                        Rectangle()
                            .frame(width: 170, height: 160)
                            .foregroundStyle(Color.blue)
                            .cornerRadius(10)
                        
                        VStack {
                            Rectangle()
                                .frame(width: 140, height: 100)
                                .foregroundStyle(Color.mint)
                                .cornerRadius(10)
                            
                            Text("아이템 \(value)\n")
                                .foregroundStyle(Color.black)
                                .font(.headline)
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
