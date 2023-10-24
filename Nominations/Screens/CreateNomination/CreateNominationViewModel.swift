//
//  CreateNominationViewModel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Alamofire
import Combine

class CreateNominationViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var isNominationCreated: Bool = false
    
    func submitNomination(process: String, reason: String, nomineeID: String) {
        AF.request(RequestRouter.createNomination(params: NominatonModel(process: process, reason: reason, nominee_id: nomineeID)))
            .publishDecodable(type: CreateNominationResponseModel.self)
            .compactMap{ $0.value }
            .map { $0.data ?? NominatonModel(process: "", reason: "", nominee_id: "") }
            .sink { completion in
            } receiveValue: { _ in
                self.isNominationCreated.toggle()
            }
            .store(in: &subscription)
    }
}
