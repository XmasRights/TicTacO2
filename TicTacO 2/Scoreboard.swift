//
//  Scoreboard.swift
//  TicTacO 2
//
//  Created by ChrisHome on 23/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

class Scoreboard: UIView
{
    private var visualEffectView: UIVisualEffectView?
    
    private var player1Label = UILabel()
    private var player2Label = UILabel()
    private var score1Label  = UILabel()
    private var score2Label  = UILabel()
    
    override func awakeFromNib()
    {
        self.backgroundColor = UIColor.clearColor()
     
        configureBackground()
        configurePlayerLabels()
    }
    
    
    // =============================================================
    // MARK: View Constructors
    // =============================================================
    
    func configureBackground()
    {
        let blur = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        
        self.visualEffectView?.removeFromSuperview()
        self.visualEffectView = UIVisualEffectView(effect: blur)
        self.addSubviewWithFullFrame(visualEffectView!)
    }
    
    func configurePlayerLabels()
    {
        
        self.player1Label.text = "Player 1"
        self.player2Label.text = "Player 2"
        self.score1Label.text  = "0"
        self.score2Label.text  = "1"

        self.score1Label.textAlignment = NSTextAlignment.Center
        self.score2Label.textAlignment = NSTextAlignment.Center
        
        self.addSubview(player1Label)
        self.addSubview(player2Label)
        self.addSubview(score1Label)
        self.addSubview(score2Label)
        
        self.player1Label.setTranslatesAutoresizingMaskIntoConstraints(false);
        self.player2Label.setTranslatesAutoresizingMaskIntoConstraints(false);
        self.score1Label.setTranslatesAutoresizingMaskIntoConstraints(false);
        self.score2Label.setTranslatesAutoresizingMaskIntoConstraints(false);
        
        let views = ["p1" : self.player1Label, "p2" : self.player2Label]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[p1]-[p2]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[p1(20)]-|",    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[p2(20)]-|",    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        
        let scores = ["s1" : score1Label, "s2" : score2Label]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[s1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: scores))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[s2]|", options: NSLayoutFormatOptions(0), metrics: nil, views: scores))
        
        self.addConstraint(NSLayoutConstraint(item: score1Label, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: score2Label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))

        self.addConstraint(NSLayoutConstraint(item: score1Label, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: score1Label, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0));
        self.addConstraint(NSLayoutConstraint(item: score2Label, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: score2Label, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0));
    }
}
