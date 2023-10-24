//
//  CompulsoryLabel.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

import SwiftUI

struct CompulsoryLabel: View {

    var title: String = ""

    var body: some View {
        HStack(spacing: 5) {
            Text("*")
                .style(.button)
                .foregroundStyle(.cubePink)
            Text(title)
                .style(.button)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
