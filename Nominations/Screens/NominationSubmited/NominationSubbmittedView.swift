//
//  NominationSubbmittedView.swift
//  Nominations
//
//  Created by AWS Macbook on 24/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubbmittedView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @ObservedObject var createNominationViewModel = CreateNominationViewModel()
    @State var reasonText = ""
    @State var process: SmileyType = .fair
    @State private var showAlert = false
    @State var isNewNomination: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBarView(title: "Nomination Submitted")
            ScrollView {
                Image(.nominationSubmitted)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(spacing: 8) {
                    Text("NOMINATION SUBMITTED")
                        .textCase(.uppercase)
                        .style(.boldHeadlineLarge)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Thank you for taking the time to fill out this form! Why not nominate another cube?")
                        .style(.body)
                        .foregroundStyle(.cubeDarkGrey)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(16)
            }
            submitNominationView()
                .frame(maxWidth: .infinity)
                .background(.white)
                .shadow(.strong)
        }
        .background(.cubeLightGrey)
        .fullScreenCover(isPresented: $isNewNomination) {
            ContentView()
        }
    }
    
    //Create New Nomination or Back to Home bottom view
    func submitNominationView() -> some View {
        VStack(spacing: 14) {
            PrimaryButton(title: "CREATE NEW NOMINATION", isActive: .active) {
                // Action for submit new nomination button
                isNewNomination.toggle()
            }
            SecondaryButton(title: "BACK", isMaxWidth: true) {
                // Action for Back new nomination button
                dismiss()
            }
        }
        .padding(24)
    }
}

#Preview {
    NominationSubbmittedView()
}
