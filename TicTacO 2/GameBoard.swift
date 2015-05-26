//
//  GameBoard.swift
//  TicTacO 2
//
//  Created by ChrisHome on 27/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class GameBoard: UIView
{
    var tiles = [Tile]()
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
        self.initTiles()
    }
    
    // =============================================================
    // MARK: Class Helpers
    // =============================================================
    
    func initTiles()
    {
        for i in 0..<9
        {
            let tile = Tile()
            tile.identifier = i
            tile.frame = getFrame(i)
            tiles.append(tile)
            self.addSubview(tile)
        }
    }
    
    func getFrame(index: Int) -> CGRect
    {
        let margin: CGFloat = 2;
        let width:  CGFloat = (self.bounds.width  - 2 * margin) / 3
        let height: CGFloat = (self.bounds.height - 2 * margin) / 3
        
        let x = CGFloat((index % 3) * Int(width  + margin))
        let y = CGFloat((index / 3) * Int(height + margin))
        
        return CGRectMake(x, y, width, height)
    }

}

