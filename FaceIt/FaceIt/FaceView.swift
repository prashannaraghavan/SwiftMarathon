//
//  FaceView.swift
//  FaceIt
//
//  Created by student on 3/7/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    var scale : CGFloat = 0.9
    private  var skullRadius : CGFloat {
        return min(bounds.size.width,bounds.size.height)/2 * scale
    }
    private var skullCenter : CGPoint{
        return CGPoint(x:bounds.midX,y:bounds.midY)
    }
    
    private enum Eye
    {
        case Left
        case Right
    }
    
    private func pathForCircleCenteredAtPoint(midPoint:CGPoint,withRadius radius:CGFloat) -> UIBezierPath
    {
        let path = UIBezierPath(
            arcCenter: midPoint,
            radius: radius,
            startAngle: 0.0,
            endAngle: CGFloat(2*M_PI),
            clockwise: false)
        path.lineWidth = 5.0
        return path
    }
    
    private func pathForMouth() -> UIBezierPath
    {
        let mouthWidth = skullRadius / Ratios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.skullRadiusToMouthOffset
        
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth/2, y: skullCenter.y + mouthOffset, width: mouthWidth, height: mouthHeight)
        
        return UIBezierPath(rect: mouthRect)
        
//        let mouthCurvature : CGFloat = 0.0
//        
//        let smileOffset = CGFloat(max(min(-1,min(mouthCurvature,1))) * mouthRect.height)
        
    }
    
    private struct Ratios
    {
        static let skullRadiusToEyeOffset : CGFloat = 3.0
        static let skullRadiusToEyeRadius : CGFloat = 10.0
        static let skullRadiusToMouthWidth : CGFloat = 1.0
        static let skullRadiusToMouthHeight : CGFloat = 3.0
        static let skullRadiusToMouthOffset : CGFloat = 3.0
    }
    
    private func getEyeCenter(eye: Eye) -> CGPoint
    {
        let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffset
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left:
            eyeCenter.x -= eyeOffset
        case .Right:
            eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    
    private func pathForEye(eye:Eye) -> UIBezierPath
    {
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye: eye)
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(eye: Eye.Left).stroke()
        pathForEye(eye: Eye.Right).stroke()
        pathForMouth().stroke()
    }

}
