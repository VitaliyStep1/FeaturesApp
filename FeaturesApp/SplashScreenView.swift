//
//  SplashScreenView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 23.08.2024.
//

import SwiftUI

struct SplashScreenView: View {
  @State var isSplashScreenVisible = true
  var body: some View {
    if isSplashScreenVisible {
      ZStack {
        Color.green.ignoresSafeArea(.all)
        Text("Splash screen")
      }
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          withAnimation(Animation.easeInOut(duration: 0.3)) {
            isSplashScreenVisible = false
          }
        }
      })
    }
    else {
      MainScreenView()
    }
  }
}

#Preview {
  SplashScreenView()
}
