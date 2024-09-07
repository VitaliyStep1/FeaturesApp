//
//  TicFieldView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 29.08.2024.
//

import SwiftUI

struct TicFieldView: View {
  let rows: Int
  private var columns: Int {
    rows
  }
  var cellsTypes: [[TicCellEnum]] {
    var cells: [[TicCellEnum]] = [[]]
    for _ in 0..<rows {
      var row: [TicCellEnum] = []
      for _ in 0..<columns {
        row.append(.oTicCell)
      }
      cells.append(row)
    }
    return cells
  }
  
  var body: some View {
    GeometryReader { geometry in
      let viewWidth = geometry.size.width
      let viewHeight = geometry.size.height
      let minSizeValue = min(viewWidth, viewHeight)
      let gridLineWidth = minSizeValue / 20.0
      let gridSizeValue = minSizeValue
      
      ZStack {
        TicGridView(rows: 3, sizeValue: gridSizeValue, gridLineWidth: gridLineWidth)
        
        ForEach(0..<rows, id: \.self) { row in
          ForEach(0..<columns, id: \.self) { column in
            createCell(row: row, column: column, rows: rows, columns: columns, viewWidth: gridSizeValue, viewHeight: gridSizeValue, gridLineWidth: gridLineWidth)
          }
        }
      }
      .frame(width: minSizeValue, height: minSizeValue)
    }
  }
  
  func createCell(row: Int, column: Int, rows: Int, columns: Int, viewWidth: Double, viewHeight: Double, gridLineWidth: Double) -> some View {
    let rowsD = Double(rows)
    let columnsD = Double(columns)
    let rowD = Double(row)
    let columnD = Double(column)
    let cellHeight = (viewHeight - gridLineWidth * (rowsD - 1.0)) / rowsD
    let cellWidth = (viewWidth - gridLineWidth * (columnsD - 1.0)) / columnsD
    let signWidth = cellWidth * 0.7
    let signHeight = cellHeight * 0.7
    
    let positionX = (cellWidth + gridLineWidth) * columnD + cellWidth * 0.5
    let positionY = (cellHeight + gridLineWidth) * rowD + cellHeight * 0.5
    return ZStack {
      Color.green.ignoresSafeArea()
      TicCellView(row: row, column: column, ticCellEnum: .xTicCell, signWidth: signWidth, signHeight: signHeight)
    }
    .frame(width: cellWidth, height: cellHeight)
    .position(x: positionX, y: positionY)
  }
}

#Preview {
  TicFieldView(rows: 3)
}