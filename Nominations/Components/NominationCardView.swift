//
//  NominationCardView.swift
//  Nominations
//
//  Created by AWS Macbook on 21/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
/// Nomination Card  view used on the Home screen.
struct NominationCardView: View {
    
    var nominees: [NomineeModel] = []
    var nomineeID: String = ""
    var reason: String = "Always goes above and..Always goes above and...."
    
    var body: some View {
        VStack(spacing: 1) {
            Text(getNomineeName())
                .style(.bodyBold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(reason)
                .style(.body)
                .foregroundStyle(.cubeDarkGrey)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 130)
        }
        .padding(24)
        .frame(height: 87)
    }
    
    func getNomineeName() -> String {
        if let nominee = nominees.filter({ $0.nominee_id == nomineeID}).first {
            return "\(nominee.first_name ?? "") \(nominee.last_name ?? "")"
        }
        return ""
    }
}

#Preview {
    NominationCardView()
}
