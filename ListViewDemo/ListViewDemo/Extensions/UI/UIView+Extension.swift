//
//  UIView+Extension.swift
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

import Foundation

extension UIView {
    
    func setDiamondShape() {
        let diamondPath = UIBezierPath()
        diamondPath.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
        diamondPath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        diamondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        diamondPath.addLine(to: CGPoint(x: bounds.minX, y: bounds.midY))
        diamondPath.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = diamondPath.cgPath
        layer.mask = maskLayer
    }
    
    @objc func roundCorners(radius: CGFloat, borderWidth: CGFloat) {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0).cgColor
        layer.masksToBounds = true
    }
    
}
