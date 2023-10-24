//
//  NomineeModel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NomineeModel: Codable, Hashable {

    let nominee_id: String?
    let first_name: String?
    let last_name: String?

    enum CodingKeys: String, CodingKey {
        case nominee_id
        case first_name
        case last_name
    }
}
