//
//  ContentView.swift
//  Sopt38th-SwiftUI
//
//  Created by mandoo on 5/16/26.
//

import SwiftUI

struct MessageView: View {
    
    let message: Message
    let isSelected: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 10)
                    .foregroundStyle(isSelected ? .blue : .gray)
                
                Circle()
                    .frame(width: 12, height: 12)
                    .padding(.top, 35)
                    .padding(.leading, 30)
                    .foregroundStyle(isSelected ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(message.name)
                    .font(.title2)
                
                Text(message.message)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("오전 9:41")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(20)
    }
}
