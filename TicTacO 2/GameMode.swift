//
//  GameMode.swift
//  TicTacO 2
//
//  Created by ChrisHome on 23/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import Foundation

func == (lhs: GameLogic.State, rhs: GameLogic.State) -> Bool
{
    switch (lhs, rhs)
    {
    case (.Start,               .Start):                return true
    case (.AwaitingUserInput,   .AwaitingUserInput):    return true
    case (.AIMove,              .AIMove):               return true
    case (.ApplyRotation,       .ApplyRotation):        return true
    case (.CheckForWin,         .CheckForWin):          return true
    case (.GameOver(let a),     .GameOver(let b)):      return (a == b)
    case (.NextTurn,            .NextTurn):             return true
        
    default: return false
    }
}


class GameLogic
{
    // =============================================================
    // MARK: Enums
    // =============================================================
    
    enum GameType
    {
        case SinglePlayer, MultiPlayer
    }
    
    enum State: Equatable
    {
        case Start
        case AwaitingUserInput
        case AIMove
        case ApplyRotation
        case CheckForWin
        case GameOver(Ornament)
        case NextTurn
        
    }
    
    // =============================================================
    // MARK: Variables
    // =============================================================
    
    private var gameState   = State.Start { didSet{ update() } }
    private var gameType    = GameType.SinglePlayer
    private var turnHandler = TurnHandler()
    private var board       = [Ornament?](count: 9, repeatedValue: nil)
    private let boardSize   = 3
    
    // =============================================================
    // MARK: Game Loop
    // =============================================================
    
    required init(gameType: GameType)
    {
        setup(gameType)
        resetBoard()
        
        update()
    }
    
    func update()
    {
        switch gameState
        {
        case .Start:
            evaluateTurn()
            
        case .AwaitingUserInput:
            awaitingUserInput()
            
        case .AIMove:
            requestAIMove()
        
        case .ApplyRotation:
            rotateTheBoard()
            
        case .CheckForWin:
            checkForWin()
            
        case .GameOver(let winner):
            announceWinner(winner)
            
        case .NextTurn:
            nextTurn()
            
            
        }
    }
    
    func userInput(location: Location)
    {
        if self.gameState == State.AwaitingUserInput
        {
            updateBoard(location)
        }
    }
    
    // =============================================================
    // MARK: Setup Methods
    // =============================================================
    
    private func setup(gameType: GameType)
    {
        self.gameType = gameType

        switch (self.gameType)
        {
        case .SinglePlayer:
            turnHandler.add((PlayerType.Local, Ornament.X))
            turnHandler.add((PlayerType.AI,    Ornament.O))
            
        case .MultiPlayer:
            turnHandler.add((PlayerType.Local, Ornament.X))
            turnHandler.add((PlayerType.Local, Ornament.O))
        }
    }
    
    // =============================================================
    // MARK: Private Methods
    // =============================================================
    
    private func resetBoard()
    {
        board.removeAll(keepCapacity: false)
        board = [Ornament?](count: 9, repeatedValue: nil)
    }
    
    private func evaluateTurn()
    {
        let turnOpt = turnHandler.currentTurn()
        
        if let turn = turnOpt
        {
            switch turn.type
            {
            case .Local: gameState = State.AwaitingUserInput
            case .AI:    gameState = State.AIMove
            }
        }
    }
    
    private func awaitingUserInput()
    {
        // TODO
        // Delegate pattern to announce expecting move
    }
    
    private func updateBoard(location: Location)
    {
        let index   = location.rawValue
        let turnOpt = turnHandler.currentTurn()
        
        if let turn = turnOpt
        {
            board[index] = turn.ornament
        }
    }

    private func requestAIMove()
    {
        // TODO
        // location = AI.DoStuff(Ornament, Board)
        // updateBoard(location)
        
        // state = .rotate the board
    }
    
    private func rotateTheBoard()
    {
        // TODO
        // Rotate the Board
        // Tell everyone you rotated the board
        // Give the board to everyone for error checking
        
        // state = .CheckForWin
    }
    
    private func checkForWin()
    {
        // TODO 
        // Static Win Checker Object
        // won = WinChecker.Board
        
        // if won state = gameOver(winner)
        // else state = next turn
    }
    
    private func announceWinner(winner: Ornament)
    {
        // TODO
        // Delegate Pattern to announce winner
    }
    
    private func nextTurn()
    {
        turnHandler.nextTurn()
        evaluateTurn()
    }
}

