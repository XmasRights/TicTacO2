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
            var identifier  = 0
    private var touching    = false
    {
        didSet
        {
            setNeedsDisplay()
        }
    }
    
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
        var fillRect = rect;
        var colour   = UIColor.whiteColor()

        if touching
        {
            fillRect.inset(dx: 10, dy: 10)
            colour = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        }
        
        var context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, colour.CGColor)
        CGContextFillRect(context, fillRect)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        touching = true
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        touching = false
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!)
    {
        touching = false
    }
}
