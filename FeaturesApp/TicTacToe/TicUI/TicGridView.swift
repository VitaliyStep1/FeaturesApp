//
//  TicGridView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 02.09.2024.
//

import SwiftUI

struct TicGridView: View {
  let rows: Int
  let sizeValue: Double
  let gridLineWidth: Double
  
  var body: some View {
    let gridWidth = sizeValue
    let gridHeight = sizeValue
    
    let offset = 0.0
    let gridLineHeight = gridLineWidth
    let columns = rows
    
    ZStack {
      Path { path in
        // Horizontal lines
        if rows > 0 {
          for i in 1..<rows {
            let iD = Double(i)
            let rowsD = Double(rows)
            let x1 = offset
            let x2 = gridWidth - offset
            let y = offset + gridLineHeight * (iD - 0.5) + ((gridHeight - 2.0 * offset - (rowsD - 1.0) * gridLineHeight) / rowsD) * iD
            path.move(to: CGPoint(x: x1, y: y))
            path.addLine(to: CGPoint(x: x2, y: y))
          }
        }
      }
      .stroke(.blue, lineWidth: gridLineHeight)
      
      Path { path in
        // Vertical lines
        if columns > 0 {
          for i in 1..<columns {
            let iD = Double(i)
            let columnsD = Double(columns)
            let y1 = offset
            let y2 = gridHeight - offset
            let x = offset + gridLineWidth * (iD - 0.5) + ((gridWidth - 2.0 * offset - (columnsD - 1.0) * gridLineWidth) / columnsD) * iD
            path.move(to: CGPoint(x: x, y: y1))
            path.addLine(to: CGPoint(x: x, y: y2))
          }
        }
      }
      .stroke(.blue, lineWidth: gridLineWidth)
    }
  }
}

#Preview {
  TicGridView(rows: 3, sizeValue: 300, gridLineWidth: 16.0)
}
