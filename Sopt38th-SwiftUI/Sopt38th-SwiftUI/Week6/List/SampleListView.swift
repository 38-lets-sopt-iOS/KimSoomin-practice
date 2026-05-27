//
//  SampleListView.swift
//  Sopt38th-SwiftUI
//
//  Created by mandoo on 5/16/26.
//

import SwiftUI

struct SampleListView: View {
    let items = ["사과", "바나나", "오렌지", "포도", "수박", "망고", "어쩌고", "저쩌고", "졸려요"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}
