//
//  TicScreenView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 23.08.2024.
//

import SwiftUI

struct TicScreenView: View {
  @StateObject private var viewModel = TicScreenViewModel()
  let rows: Int
  
  var body: some View {
    GeometryReader { geometry in
      let fieldWidth = geometry.size.width * 0.9
      let fieldHeight = fieldWidth
      ZStack {
        Color.cyan.ignoresSafeArea()
        VStack() {
          Spacer()
          if viewModel.isGameOver {
            VStack {
              Text("Game Over")
                .padding(.bottom, 10)
              if let winnerSignType = viewModel.winnerSignType {
                switch winnerSignType {
                case .oSign:
                  Text("Winner: O")
                    .padding(.bottom, 10)
                case .xSign:
                  Text("Winner: X")
                    .padding(.bottom, 10)
                }
              }
              Button("New Game") {
                viewModel.newGameButtonTapped()
              }
            }
            Spacer()
          }
          TicFieldView(rows: 3, delegate: viewModel)
            .frame(width: fieldWidth, height: fieldHeight)
          Spacer()
        }
      }
      .onAppear(perform: {
        viewModel.viewAppeared()
      })
    }
  }
}

#Preview {
  TicScreenView(rows: 3)
}
