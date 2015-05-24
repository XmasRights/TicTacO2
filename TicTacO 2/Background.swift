//
//  Background.swift
//  TicTacO 2
//
//  Created by ChrisHome on 23/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class Background: UIView
{
    private var squaresAcross: CGFloat = 10
    private var squaresDown: CGFloat {
        return ceil(self.bounds.height / squareSize)
    }
    
    private var numberOfSquares: CGFloat {
        return squaresDown * squaresAcross
    }
    
    private var squareSize: CGFloat {
        return self.bounds.width / squaresAcross

    }
    
    private var hue: CGFloat = 1.0
    private var bri = [CGFloat] ()
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        randomiseSaturation()
    }
    
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        for y in 0...Int(self.squaresDown-1)
        {
            for x in 0...Int(self.squaresAcross-1)
            {
                let index = derivedIndex(x, y: y)
                let rect  = CGRectMake(CGFloat(x) * squareSize, CGFloat(y) * squareSize, squareSize, squareSize)
                let colour = UIColor(hue: self.hue, saturation: 1.0, brightness: self.bri[index], alpha: 1.0).CGColor
                
                CGContextSetFillColorWithColor(context, colour)
                CGContextFillRect(context, rect)
            }
        }
    }
    
    func randomiseSaturation()
    {
        self.bri.removeAll(keepCapacity: false)
        
        for i in 0...Int(self.numberOfSquares + 1)
        {
            let randomNumber: CGFloat = CGFloat((arc4random() % 100)) / 100.0
            bri.append(randomNumber)
        }
    }
    
    func derivedIndex(x: Int, y: Int) -> Int
    {
        return Int(squaresAcross) * y + x
    }
}
