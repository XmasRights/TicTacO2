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
    
    
    // =============================================================
    // MARK: Variables
    // =============================================================
    
            var currentTurn = Turn.X
    private var initialTurn = Turn.X
            var gameType    = GameType.SinglePlayer
    
    
    // =============================================================
    // MARK: Public Methods
    // =============================================================
    mutating func reset()
    {
        swapInitialTurnForNewGame()
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
    
}
