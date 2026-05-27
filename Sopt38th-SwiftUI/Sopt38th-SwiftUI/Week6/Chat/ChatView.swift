//
//  ContentView.swift
//  Sopt38th-SwiftUI
//
//  Created by mandoo on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    
    let chatList: ChatListModel
    
    var body: some View {
        HStack {
            Image(chatList.profileImage)
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(chatList.name)
                        .font(.title3.bold())
                    Text(chatList.location)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Text(chatList.lastMessage)
                    .font(.caption)
            }
            
            Spacer()
           
            Image(chatList.productImage)
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding(10)
    }
}
