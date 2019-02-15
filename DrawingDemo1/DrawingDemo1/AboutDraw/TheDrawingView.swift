//
//  TheDrawingView.swift
//  DrawingDemo1
//
//  Created by J K on 2019/2/15.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit

class TheDrawingView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        for (i, drawLine) in theManager.lines.enumerated() {
            drawLine.lineColor.setStroke()  //画出的线条的颜色，该方法只在重写draw时生效
            drawLine.bezier.lineCapStyle = .round     //解决线条的锯齿问题
            drawLine.bezier.lineJoinStyle = .round
            drawLine.bezier.lineWidth = CGFloat(theManager.penSizes[i])
            drawLine.bezier.stroke()   //显示线条
        }
    }
    
    //当手指第一次触碰时
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)  //取第一个点击的坐标
        theManager.lines.append(TheDrawLine(bezier: UIBezierPath(), lineColor: theManager.lineColorr))  //往栈里塞进
        theManager.penSizes.append(theManager.penSize)  //往penSizes里添加笔的尺寸, 也是属于栈的方式
        theManager.lines.last?.bezier.move(to: location!)  //开始画
    }
    
    //当手指移动时
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            theManager.lines.last?.bezier.addLine(to: location)
            self.setNeedsDisplay()
        }
    }
    
    //当手指抬起时
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            theManager.lines.last?.bezier.addLine(to: location)
            self.setNeedsDisplay()
        }
    }
    
    //当手势被系统时间而取消时
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            theManager.lines.last?.bezier.addLine(to: location)
            self.setNeedsDisplay()
        }
    }

}
