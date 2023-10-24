//
//  SmileyRadioGroupView.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
//List of Smiley options with radio buttons
struct SmileyRadioGroupView: View {
    
    @State var isItemSelected: Bool = false
    @State var selectedID: String = "Fair"
    var radioButoonAction: (String) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(SmileyTypeModel.options) { option in
                SmileyRadioButtonCard(radioType: option) .onTapGesture {
                    selectedID = option.id
                    isItemSelected = true
                    radioButoonAction(option.type.rawValue)
                }
            }
        }
    }
    // Simple one radio card with smiley icon
    func SmileyRadioButtonCard(radioType: SmileyTypeModel) -> some View {
        HStack(spacing: 14) {
            Image(radioType.id)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Text(radioType.name)
                .style(.boldHeadlineSmallest)
            Spacer()
            Image(selectedID == radioType.id ? .active : .inactive)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .border(selectedID == radioType.id ? .cubeDarkGrey : .cubeMidGrey, width: 1)
        .shadow(selectedID == radioType.id ? .strong : .light)
    }
}
