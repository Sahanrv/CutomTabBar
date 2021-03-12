//
//  MyTabBar.swift
//  CutomTabBar
//
//  Created by Sahan Ravindu on 5/13/20.
//  Copyright © 2020 Sahan Ravindu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class MyTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0.4
        
        //The below 4 lines are for shadow above the bar. you can skip them if you do not want a shadow
        shapeLayer.shadowOffset = CGSize(width:0, height:1)
        shapeLayer.shadowRadius = 1
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height), y: 0)) // the beginning of the trough

        path.addCurve(to: CGPoint(x: centerWidth, y: height - 5),
        controlPoint1: CGPoint(x: (centerWidth - 33), y: 0), controlPoint2: CGPoint(x: centerWidth - 33, y: height))

        path.addCurve(to: CGPoint(x: (centerWidth + height), y: 0),
        controlPoint1: CGPoint(x: centerWidth + 33, y: height), controlPoint2: CGPoint(x: (centerWidth + 33), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
}
