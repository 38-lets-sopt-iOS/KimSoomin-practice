//
//  ItemModel.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/25/26.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .rectangle1, name: "가나디", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle2, name: "오쏘몰", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle3, name: "애플워치", price: "3000", heartIsSelected: true),
            ItemModel(itemImg: .rectangle4, name: "가방", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle5, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle6, name: "틴트", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle1, name: "카메라", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle2, name: "로션", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle3, name: "락스", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle4, name: "가방", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle5, name: "헤드셋", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .rectangle6, name: "틴트", price: "4000", heartIsSelected: false)
        ]
    }
}
