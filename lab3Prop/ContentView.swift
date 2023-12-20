//
//  ContentView.swift
//  lab3Prop
//
//  Created by student on 20.12.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var message = ""
    @State private var x = ""
    @State private var y = ""
    @State private var game: TicTacToe = TicTacToe(size: 3)
    @State private var xStep: Bool = true
    
    func printGame() {
        var cellValue: Cell
        if (xStep) {
            //message += "Ход X\n"
            cellValue = Cell.X
        } else {
            //message += "Ход O\n"
            cellValue = Cell.O
        }
        guard let row = Int(x)
        else {return}
        guard let col = Int(y)
        else {return}
        if(!game.changeField(row: row, col: col, v: cellValue)) {return}
            
        xStep = !xStep
        message = ""
        switch (game.whoWin()) {
        case Cell.X:
            message += "X победил"
        case Cell.O:
            message += "O победил"
        case Cell.Draw:
            message += "Ничья"
        default:
            message += game.render()
        }
        
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Text(message)
                .font(.system(size: 12)) }
                    .frame(minHeight: 0, idealHeight: 100, maxHeight: .infinity)
                
                Button(action: {
                    printGame()
                }) {
                    Text("Ход")
                        .font(.system(size: 16))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 250, height: 45)
                .fixedSize()
            
                Button(action: {
                    
                    game = TicTacToe(size: 3)
                    message = game.render()
                    xStep = true
                    
                    
                }) {
                    Text("Новая игра")
                        .font(.system(size: 16))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 250, height: 45)
                .fixedSize()
            
                    Form {
                        Section(header: Text("Позиция")) {
                            TextField("X", text: $x)
                            TextField("Y", text: $y)
                        }
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
