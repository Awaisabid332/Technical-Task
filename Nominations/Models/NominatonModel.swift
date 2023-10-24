//
//  NominatonModel.swift
//  Nominations
//
//  Created by AWS Macbook on 22/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominatonModel: Codable, Hashable {

    let process: String?
    let reason: String?
    let nominee_id: String?

    enum CodingKeys: String, CodingKey {
        case process
        case reason
        case nominee_id
    }
}
