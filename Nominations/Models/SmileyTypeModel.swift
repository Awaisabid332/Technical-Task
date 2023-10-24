//
//  SmileyTypeModel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct SmileyTypeModel: Identifiable, Hashable {
    
    let id: String
    let name: String
    let type: SmileyType

    static var options: [SmileyTypeModel] {
        [
            SmileyTypeModel(id: "Fair", name: "Fair", type: .fair),
            SmileyTypeModel(id: "VeryUnfair", name: "Very Unfair", type: .very_nnfair),
            SmileyTypeModel(id: "NotSure", name: "Not sure", type: .not_sure),
            SmileyTypeModel(id: "VeryFair", name: "Very Fair", type: .very_fair)
        ]
    }
}
