//
//  DescriptionView.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
/// Description View  used for details about input
struct DescriptionView: View {
    
    var title: String = "I’d like to nominate... "
    var description: String = "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic."
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .textCase(.uppercase)
                .style(.boldHeadlineSmall)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(description)
                .style(.body)
                .foregroundStyle(.cubeDarkGrey)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
    }
}

#Preview {
    DescriptionView()
}
