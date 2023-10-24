//
//  DropDownView.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct DropDownView: View {

    var placeHolder: String = "Select Option"
    var options: [String] = []
    var nominee: [NomineeModel] = []
    @State private var selectedOption = ""
    var selectedNominee: (String) -> Void

    var body: some View {
            Section {
                Picker("", selection: $selectedOption) {
                    if selectedOption.isEmpty {
                        Text(placeHolder).tag(Optional<String>(nil))
                            .style(.body)
                    }
                    ForEach(options, id: \.self) { option in
                        HStack {
                            Text(option).tag(Optional(option))
                            Spacer()
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                .tint(.black)
                .pickerStyle(.menu)
                .onReceive([self.selectedOption].publisher.first()) { value in
                    if let selectedNomine = nominee.filter({ "\($0.first_name ?? "") \($0.last_name ?? "")" == value }).first {
                        self.selectedNominee(selectedNomine.nominee_id ?? "")
                    }
                }
            }
        .padding(16)
     }
}
