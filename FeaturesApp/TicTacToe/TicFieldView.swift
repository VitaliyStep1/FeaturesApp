//
//  TicFieldView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 29.08.2024.
//

import SwiftUI

struct TicFieldView: View {
  let rows: Int
  
  var body: some View {
    GeometryReader { geometry in
      let viewWidth = geometry.size.width
      let viewHeight = geometry.size.height
      let minSizeValue = min(viewWidth, viewHeight)
      
      let gridWidth = minSizeValue
      let gridHeight = minSizeValue
      
      let frameLineWidth = 0.0//minSizeValue / 20.0
      let offset = frameLineWidth
      
      let gridLineWidth = minSizeValue / 20.0
      let gridLineHeight = gridLineWidth
      let columns = rows
      
      let positionX = gridWidth - offset
      let positionY = gridHeight - offset
      ZStack {
        Path { path in
          path.move(to: CGPoint(x: offset, y: offset))
          path.addLine(to: CGPoint(x: offset, y: positionY))
          path.addLine(to: CGPoint(x: positionX, y: positionY))
          path.addLine(to: CGPoint(x: positionX, y: offset))
          path.closeSubpath()
        }
        .stroke(.clear, lineWidth: frameLineWidth * 2.0)
        .fill(.clear)
        
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
}

#Preview {
  TicFieldView(rows: 3)
}
