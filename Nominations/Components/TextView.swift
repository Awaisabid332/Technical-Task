//
//  TextView.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct TextView: View {

    @Binding var text: String
    @State var placeholder: String
    var title: String
    var textColor: Color = .black
    var placeholderColor: Color = .gray
    var titleColor: Color = .black
    var bgColor: Color = .white

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                VStack {
                    TextField(placeholder, text: $text, axis: .vertical)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .foregroundColor(textColor)
                        .padding()
                    Spacer()
                }
            }
            .frame(height: 207)
            .background(bgColor)
            .border(.cubeDarkGrey, width: 1)
        }
    }
}
