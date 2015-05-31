//
//  TicTacToeAI.swift
//  TicTacO 2
//
//  Created by ChrisHome on 31/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import Foundation

class TicTacToeAI
{
    class func hasWinner(board: GameLogic.Board) -> Ornament?
    {
        assert(board.count == 9, "Board is the wrong size");
        
        
        
        return nil
    }
    
    private func checkForWinner(ornament: Ornament, board: GameLogic.Board) -> Int
    {
        var wins = 0
        
        let row0 = board[0...2]
        let row1 = board[3...5]
        let row2 = board[6...8]
        
//        let col0 = [board[0], board[3], board[6]]
//        let col1 = [board[1], board[4], board[7]]
//        let col2 = [board[2], board[5], board[8]]
//        
//        let dia0 = [board[0], board[4], board[8]]
//        let dia1 = [board[2], board[4], board[6]]
        
        let sublists = [row0, row1, row2]//, col0, col1, col2, dia0, dia1]
        
        for list in sublists
        {
            for orn in list
            {
                if orn != ornament
                {
                    break
                }
                wins++
            }
        }
        
        return wins
    }
}

