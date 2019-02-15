//
//  TheDrawLine.swift
//  DrawingDemo1
//
//  Created by J K on 2019/2/15.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit

class TheDrawLine {
    var bezier: UIBezierPath
    var lineColor: UIColor
    
    init(bezier: UIBezierPath, lineColor: UIColor) {
        self.bezier = bezier
        self.lineColor = lineColor
    }
}
