//
//  GetNominationsModel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct GetNominationsResponseModel: Codable, Hashable {

    let data: [NominatonModel]?

    enum CodingKeys: String, CodingKey {
        case data
    }
}
