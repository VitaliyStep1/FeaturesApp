//
//  TicFieldView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 29.08.2024.
//

import SwiftUI

struct TicFieldView: View {
  let rows: Int
  weak var delegate: TicCellViewDelegate?
  let values: [[TicSignType?]]
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
      let rows = self.rows
      
      ZStack {
        TicGridView(rows: rows, sizeValue: gridSizeValue, gridLineWidth: gridLineWidth)
        
        ForEach(0..<rows, id: \.self) { row in
          ForEach(0..<columns, id: \.self) { column in
            let signType = values[safe: row]?[safe: column] ?? nil
            createCell(row: row, column: column, rows: rows, columns: columns, viewWidth: gridSizeValue, viewHeight: gridSizeValue, gridLineWidth: gridLineWidth, signType: signType)
          }
        }
      }
      .frame(width: minSizeValue, height: minSizeValue)
    }
  }
  
  func createCell(row: Int, column: Int, rows: Int, columns: Int, viewWidth: Double, viewHeight: Double, gridLineWidth: Double, signType: TicSignType?) -> some View {
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
    
    let ticCellEnum = TicCellEnum(signType: signType)
    return ZStack {
      Color.green.ignoresSafeArea()
      TicCellView(row: row, column: column, ticCellEnum: ticCellEnum, signWidth: signWidth, signHeight: signHeight, delegate: self.delegate)
    }
    .frame(width: cellWidth, height: cellHeight)
    .position(x: positionX, y: positionY)
  }
}

#Preview {
  TicFieldView(rows: 3, values: [[]])
}
