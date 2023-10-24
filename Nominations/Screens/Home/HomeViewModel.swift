//
//  HomeViewModel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class HomeViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var nominations = [NominatonModel]()
    @Published var nominees = [NomineeModel]()
    
    init() {
        getAllNominee()
        getNominations()
    }
    
    func getNominations() {
        AF.request(RequestRouter.getNominations)
            .publishDecodable(type: GetNominationsResponseModel.self)
            .compactMap{ $0.value }
            .map { $0.data ?? [] }
            .sink { completion in
            } receiveValue: { (receivedValue: [NominatonModel]) in
                self.nominations = receivedValue
            }
            .store(in: &subscription)
    }
    
    func getAllNominee() {
        AF.request(RequestRouter.getNominee)
            .publishDecodable(type: GetNomineeResponseModel.self)
            .compactMap{ $0.value }
            .map { $0.data ?? [] }
            .sink { completion in
            } receiveValue: { (receivedValue: [NomineeModel]) in
                self.nominees = receivedValue
            }
            .store(in: &subscription)
    }
}
