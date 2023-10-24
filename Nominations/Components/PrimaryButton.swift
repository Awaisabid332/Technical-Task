//
//  PrimaryButton.swift
//  Nominations
//
//  Created by AWS Macbook on 22/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct PrimaryButton: View {

    var title: String = ""
    var textColor: Color? = .white
    var isActive: ButtonState = .active
    var action: () -> Void

    var body: some View {
        Button(action: action, label: {
            Text(title)
                .style(.button)
                .foregroundColor(textColor)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isActive == .active ? .black : .cubeMidGrey)
        })
        .disabled(isActive == .active ? false : true)
     }
}
