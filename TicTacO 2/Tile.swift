//
//  Tile.swift
//  TicTacO 2
//
//  Created by ChrisHome on 27/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class Tile: UIView
{
    // =============================================================
    // MARK: Public Properties
    // =============================================================
    
    enum TileState
    {
        case Normal, X, O, DownX, DownO, Down
    }
    
    var identifier  = 0
    var state       = TileState.Normal
    {
        willSet
        {
            setNeedsDisplay()
        }
    }
    
    var occupied: Bool
    {
        switch self.state
        {
        case .X, .O:
            return true
        
        default:
            return false
        }
    }
    
    // =============================================================
    // MARK: UIView Overrides
    // =============================================================
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect)
    {
        var context = UIGraphicsGetCurrentContext();
        
        drawBackground (context, rect: rect)
        drawTileIcon   (context, rect: rect)
        applyTileTransform ()
    }
    
    // =============================================================
    // MARK: Private Draw Methods
    // =============================================================
    
    private func drawBackground(context: CGContextRef, rect: CGRect)
    {
        CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0)
        CGContextFillRect(context, rect)
    }
    
    private func drawTileIcon(context: CGContextRef, rect: CGRect)
    {
        switch (self.state)
        {
        case .X, .DownX:
            drawX(inRect: rect, context: context, colour: UIColor.blackColor())
            
        case .O, .DownO:
            drawO(intRect: rect, context: context, colour: UIColor.blackColor())
            
        case .Normal, .Down:
            break
        }
    }
    
    private func applyTileTransform()
    {
        switch (self.state)
        {
        case .Down, .DownO, .DownX:
            self.transform = CGAffineTransformMakeScale(0.8, 0.8)
            self.alpha     = 0.8
            
        default:
            self.transform = CGAffineTransformIdentity
            self.alpha     = 1.0
        }
    }
    
    private func drawX (inRect rect: CGRect, context: CGContextRef, colour: UIColor)
    {
        let TopLeft     = CGPointMake (rect.origin.x                  , rect.origin.y                   )
        let TopRight    = CGPointMake (rect.origin.x + rect.size.width, rect.origin.y                   )
        let BottomLeft  = CGPointMake (rect.origin.x                  , rect.origin.y + rect.size.height)
        let BottomRight = CGPointMake (rect.origin.x + rect.size.width, rect.origin.y + rect.size.height)
        
        CGContextSetFillColorWithColor (context, colour.CGColor)
        
        CGContextMoveToPoint    (context, TopLeft.x,     TopLeft.y    )
        CGContextAddLineToPoint (context, BottomRight.x, BottomRight.y)
        CGContextMoveToPoint    (context, TopRight.x,    TopRight.y   )
        CGContextAddLineToPoint (context, BottomLeft.x,  BottomLeft.y )
        
        CGContextStrokePath (context)
    }
    
    private func drawO (intRect rect: CGRect, context: CGContextRef, colour: UIColor)
    {
        // TODO
    }
}
