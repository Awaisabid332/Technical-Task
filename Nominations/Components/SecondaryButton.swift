//
//  SecondaryButton.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct SecondaryButton: View {

    var title: String = ""
    var textColor: Color? = .black
    var bgColor: Color = .white
    var isMaxWidth: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action, label: {
            Text(title)
                .style(.button)
                .foregroundColor(textColor)
                .textCase(.uppercase)
                .frame(maxWidth: isMaxWidth ? .infinity : 87)
                .padding()
                .background(bgColor)
                .border(.black, width: 2)
        })
     }
}
