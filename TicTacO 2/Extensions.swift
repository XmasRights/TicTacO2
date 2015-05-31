//
//  Extensions.swift
//  TicTacO 2
//
//  Created by ChrisHome on 23/05/2015.
//  Copyright (c) 2015 ChristmasHouse. All rights reserved.
//

import UIKit

enum Location: Int
{
    case TopLeft = 0
    case TopCentre, TopRight, MiddleLeft, MiddleCentre, MiddleRight, BottomLeft, BottomCentre, BottomRight
}


extension UIView
{
    func addSubviewWithFullFrame(subview: UIView)
    {
        let views = ["s" : subview]
        self.addSubviewWithLayout(subview, viewsList: views, horizontalLayout: "H:|[s]|", verticalLayout: "V:|[s]|");
    }
    
    func addSubviewWithLayout(subview: UIView, viewsList: [String : UIView], horizontalLayout: String, verticalLayout: String)
    {
        self.addSubview(subview)
        
        subview.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(horizontalLayout, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsList))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(verticalLayout,   options: NSLayoutFormatOptions(0), metrics: nil, views: viewsList))
    }
}

