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
    
    // =============================================================
    // MARK: Public Variables
    // =============================================================

    var hue: CGFloat
    {
        didSet
        {
            randomiseSaturation()
            setNeedsDisplay()
        }
    }
    
    
    // =============================================================
    // MARK: Private Variables
    // =============================================================
    
    private var bri = [CGFloat] ()
    private var squaresAcross: CGFloat = 10
    private var squaresDown: CGFloat
    {
        return ceil(self.bounds.height / squareSize)
    }
    
    private var numberOfSquares: CGFloat
    {
        return squaresDown * squaresAcross
    }
    
    private var squareSize: CGFloat
    {
        return self.bounds.width / squaresAcross
    }
    
    
    // =============================================================
    // MARK: Class Methods
    // =============================================================
    
    required init(coder aDecoder: NSCoder)
    {
        hue = 0.5
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        randomiseSaturation()
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        let (xMin, xMax, yMin, yMax) = range(rect)
        
        for y in yMin..<yMax
        {
            for x in xMin..<xMax
            {
                let index = derivedIndex(x, y: y)
                let rect  = CGRectMake(CGFloat(x) * squareSize, CGFloat(y) * squareSize, squareSize, squareSize)
                let colour = UIColor(hue: self.hue, saturation: 1.0, brightness: self.bri[index], alpha: 1.0).CGColor
                
                CGContextSetFillColorWithColor(context, colour)
                CGContextFillRect(context, rect)
            }
        }
    }
    
    private func randomiseSaturation()
    {
        self.bri.removeAll(keepCapacity: false)
        
        for i in 0...Int(self.numberOfSquares + 1)
        {
            let randomNumber: CGFloat = CGFloat((arc4random() % 100)) / 100.0
            bri.append(randomNumber)
        }
    }
    
    
    // =============================================================
    // MARK: Class Helpers
    // =============================================================
    
    private func derivedIndex(x: Int, y: Int) -> Int
    {
        return Int(squaresAcross) * y + x
    }
    
    private func range(rect: CGRect) -> (xMin: Int, xMax: Int, yMin: Int, yMax: Int)
    {
        let xMin = Int(floor(rect.origin.x / squareSize))
        let yMin = Int(floor(rect.origin.y / squareSize))
        
        let xMax = Int(ceil(rect.origin.x + rect.size.width)  / squareSize)
        let yMax = Int(ceil(rect.origin.y + rect.size.height) / squareSize) + 1
        
        return (xMin, xMax, yMin, yMax)
    }
}
