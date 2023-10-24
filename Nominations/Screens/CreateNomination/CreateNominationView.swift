//
//  CreateNominationView.swift
//  Nominations
//
//  Created by AWS Macbook on 22/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct CreateNominationView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @ObservedObject var createNominationViewModel = CreateNominationViewModel()
    @State var reasonText = ""
    @State var process = "fair"
    @State var selectedNominee = ""
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBarView(title: "Create a nomination")
            ScrollView {
                Image(.nomination)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                DescriptionView()
                    .padding(.top, 5)
                CompulsoryLabel(title: "Cube’s name")
                    .padding()
                    .frame(height: 24)
                DropDownView(options: homeViewModel.nominees.map { nominee in
                    return "\(nominee.first_name ?? "") \(nominee.last_name ?? "")"
                }, nominee: homeViewModel.nominees,selectedNominee: { nomineeID in
                    selectedNominee = nomineeID
                })
                .frame(height: 30)
                .frame(maxWidth: .infinity)
                .border(.cubeMidGrey, width: 1)
                .padding(16)
                Divider()
                    .padding(16)
                DescriptionView(title: "I’d like to nominate THIS CUBE BECAUSE...", description: "Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
                    .padding(.top, 5)
                CompulsoryLabel(title: "Reasoning")
                    .padding()
                    .frame(height: 24)
              TextView(text: $reasonText, placeholder: "", title: "")
                .frame(maxWidth: .infinity)
                .padding(16)
                Divider()
                .padding(16)
                DescriptionView(title: "IS HOW WE CURRENTLY RUN CUBE OF THE MONTH FAIR?", description: "As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
                    .padding(.top, 5)
                SmileyRadioGroupView(radioButoonAction: { processValue in
                    self.process = processValue
                })
                    .padding(16)
            }
            submitNominationView()
                .frame(maxWidth: .infinity, maxHeight: 92)
                .background(.white)
                .shadow(.strong)
        }
        .background(.cubeLightGrey)
        .fullScreenCover(isPresented: $createNominationViewModel.isNominationCreated) {
            NominationSubbmittedView()
        }
    }
    
    //Create Nomination bottom view
    func submitNominationView() -> some View {
        HStack(spacing: 14) {
            SecondaryButton(title: "BACK", isMaxWidth: false) {
                // Action for Back new nomination button
                dismiss()
            }
            .padding(.top, 21)
            PrimaryButton(title: "SUBMIT NOMINATION", isActive: (!reasonText.isEmpty) ? .active : .inActive) {
                // Action for submit new nomination button
                createNominationViewModel.submitNomination(process: process, reason: reasonText, nomineeID: selectedNominee)
            }
            .padding(.top, 21)
        }
        .padding(24)
    }
}

#Preview {
    CreateNominationView()
}
