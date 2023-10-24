//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var isCreateNewNomination: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBarView()
            ScrollView {
                NominationsHeaderView()
                if homeViewModel.nominations.isEmpty {
                    emptyView()
                        .padding(.top, 78)
                } else {
                    ForEach(homeViewModel.nominations, id: \.self) { nomination in
                        NominationCardView(nominees: homeViewModel.nominees, nomineeID: nomination.nominee_id ?? "", reason: nomination.reason ?? "")
                        Divider()
                    }
                }
            }
            createNominationView()
                .frame(maxWidth: .infinity, maxHeight: 92)
                .background(.white)
                .shadow(.strong)
        }
        .background(.cubeLightGrey)
        .fullScreenCover(isPresented: $isCreateNewNomination) {
            CreateNominationView()
        }
    }
    
    //Empty view for incase of no nominations found
    func emptyView() -> some View {
        VStack(spacing: 25) {
            Image(.emptyIcon)
                .resizable()
                .foregroundStyle(.white)
                .frame(size: 88)
            Text("once you submit a nomination, you will be able to SEE it here.")
                .textCase(.uppercase)
                .style(.boldHeadlineMedium)
                .foregroundColor(.cubeDarkGrey)
                .padding(24)
        }
    }
    
    //Create Nomination bottom view
    func createNominationView() -> some View {
        VStack {
            PrimaryButton(title: "CREATE NEW NOMINATION") {
                // Action for create new nomination button
                isCreateNewNomination.toggle()
            }
            .padding(.top, 21)
            .padding(24)
        }
    }

}

#Preview {
    ContentView()
}
