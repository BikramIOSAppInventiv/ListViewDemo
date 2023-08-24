//
//  UIView+Extension.swift
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

import Foundation

extension UIView {
    func setDiamondShape(borderWidth: CGFloat, borderColor: UIColor) {
        let diamondPath = UIBezierPath()
        diamondPath.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
        diamondPath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        diamondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        diamondPath.addLine(to: CGPoint(x: bounds.minX, y: bounds.midY))
        diamondPath.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = diamondPath.cgPath
        layer.mask = maskLayer
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
}
