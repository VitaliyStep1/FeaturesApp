//
//  MainScreenView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 23.08.2024.
//

import SwiftUI

struct MainScreenView: View {
  @State var isTicTacToeScreenPresented = false
  var body: some View {
    NavigationStack {
      VStack {
        Button("Tic Tac Toe") {
          isTicTacToeScreenPresented = true
        }
      }
      // navigationDestination(isPresented should be inside NavigationStack block
      .navigationDestination(isPresented: $isTicTacToeScreenPresented) {
        TicScreenView(rows: 3)
      }
    }
  }
}

#Preview {
  MainScreenView()
}
