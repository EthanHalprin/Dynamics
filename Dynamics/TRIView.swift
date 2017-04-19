//
//  TRIView.swift
//  Dynamics
//
//  Created by Ethan Halprin on 18/04/2017.
//
//

import UIKit

class TRIView : UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()!
        
        context.beginPath()
        
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.maxX/2.0), y: rect.minY))

        context.closePath()
        
        context.setFillColor(red: 0.7, green: 0.1, blue: 0.5, alpha: 1.0);
        context.fillPath()
    }
}
