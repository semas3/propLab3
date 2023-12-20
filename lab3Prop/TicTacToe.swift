//
//  TicTacToe.swift
//  lab3Prop
//
//  Created by student on 20.12.2023.
//

import Foundation

enum Cell {
    case X
    case O
    case Empty
    case Draw
}

class TicTacToe {
    private var size: Int
    private var field: [[Cell]]
    init(size: Int = 3) {
        self.size = size
        field = [[Cell]](repeating: [Cell](repeating: Cell.Empty, count: size), count: size)
    }

    func whoWin() -> Cell {
        func checkRowsAndDiagonals(v: Cell) -> Bool {
            for row in field {
                var isRowEqual: Bool = true
                for element in row {
                    if (element != v) {
                        isRowEqual = false
                        break
                    }
                }
                if (isRowEqual) {
                    return true
                }
            }

            var diagonalEqual: Bool = true
            for (index, row) in field.enumerated() {
                if (row[index] != v) {
                    diagonalEqual = false
                    break
                }
            }
            if (diagonalEqual) {
                return true
            }

            var revDiagonalEqual: Bool = true
            for (index, row) in field.enumerated() {
                if (row[size - 1 - index] != v) {
                    revDiagonalEqual = false
                    break
                }
            }
            if (revDiagonalEqual) {
                return true
            }

            return false
        }

        if (checkRowsAndDiagonals(v: Cell.X)) { return Cell.X }
        if (checkRowsAndDiagonals(v: Cell.O)) { return Cell.O }

        for i in field.indices {
            var f1 = true
            var f0 = true
            for j in field.indices {
                if (field[j][i] != Cell.X) { f1 = false }
                if (field[j][i] != Cell.O) { f0 = false }
            }
            if (f1) { return Cell.X }
            if (f0) { return Cell.O }
        }

        for row in field {
            for element in row {
                if (element == Cell.Empty) { return Cell.Empty }
            }
        }
        return Cell.Draw
    }

    func render() -> String {
        var res: String = ""
        for (index, row) in field.enumerated() {
            for (index2, element) in row.enumerated() {
                let char: Character
                switch element {
                case Cell.X:
                    char = "X"
                case Cell.O:
                    char = "O"
                default:
                    char = " "
                }
                if (index2 != 0) {
                    res += "| "
                }
                res += "\(char) "
            }

            res += "\n"
            if (index != size - 1) { print(String(repeating: "-", count: 4*size-3)) }
        }
        return res
    }

    func changeField(row: Int, col: Int, v: Cell) -> Bool {
        if (!(1...size).contains(row) || !(1...size).contains(col) || field[row-1][col-1] != Cell.Empty) {
            return false
        }
        field[row-1][col-1] = v
        return true
    }
}
