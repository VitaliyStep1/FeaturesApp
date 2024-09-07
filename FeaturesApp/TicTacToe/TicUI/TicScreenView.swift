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
          TicFieldView(rows: 3)
            .frame(width: fieldWidth, height: fieldHeight)
          Spacer()
        }
      }
    }
  }
}

#Preview {
  TicScreenView(rows: 3)
}
