//
//  TurnHandler.swift
//  TicTacO 2
//
//  Created by ChrisHome on 31/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import Foundation

// =============================================================
// MARK: Global Enums
// =============================================================

enum PlayerType
{
    case Local, AI
}

enum Ornament
{
    case X
    case O
}

typealias Turn = (type: PlayerType, ornament: Ornament)


// =============================================================
// MARK: Turn Handler Class
// =============================================================

class TurnHandler
{
    // =============================================================
    // MARK: Variables
    // =============================================================
    
    private var turns = [Turn]()
    private var index = 0
    
    // =============================================================
    // MARK: Public Methods
    // =============================================================
    
    func nextTurn() -> Turn?
    {
        if ++index > turns.count
        {
            index = 0
        }
        
        return currentTurn()
    }
    
    func currentTurn() -> Turn?
    {
        return turns[index]
    }
    
    func add(turn: Turn)
    {
        turns.append(turn)
    }
    
}
