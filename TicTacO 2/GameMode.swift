//
//  GameMode.swift
//  TicTacO 2
//
//  Created by ChrisHome on 23/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import Foundation

struct GameModel
{
    // =============================================================
    // MARK: Enums
    // =============================================================
    
    enum Turn
    {
        case X, O
    }
    
    enum GameType
    {
        case SinglePlayer, MultiPlayer, NetworkPlay
    }
    
    enum BoardEntry
    {
        case X, O, Empty
    }
    
    // =============================================================
    // MARK: Variables
    // =============================================================
    
            var currentTurn = Turn.X
    private var initialTurn = Turn.X
            var gameType    = GameType.SinglePlayer
            var board       = [BoardEntry](count: 9, repeatedValue: BoardEntry.Empty)
            let boardSize   = 3
    
    
    // =============================================================
    // MARK: Public Methods
    // =============================================================
    mutating func reset()
    {
        swapInitialTurnForNewGame()
        resetBoard()
    }
    
    
    // =============================================================
    // MARK: Private Methods
    // =============================================================
    
    mutating func swapInitialTurnForNewGame()
    {
        if initialTurn == Turn.X
        {
            initialTurn = Turn.O
        }
        else
        {
            initialTurn = Turn.X
        }
        currentTurn = initialTurn
    }
    
    mutating func resetBoard()
    {
        board.removeAll(keepCapacity: false)
        board = [BoardEntry](count: 9, repeatedValue: BoardEntry.Empty)
    }
    
}
