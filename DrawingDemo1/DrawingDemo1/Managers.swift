//
//  Managers.swift
//  DrawingDemo1
//
//  Created by J K on 2019/2/15.
//  Copyright © 2019 KimsStudio. All rights reserved.
//


//该类作用：用来视图转场前把数据存储到这里
import UIKit

class Managers {
    static var manager = Managers()
    
    var lines = [TheDrawLine]()   //属于一个栈，用来存储画的线条
    var secondLinesStack = [TheDrawLine]() //一个栈，跟上面的lines一样, 用来进行撤销/重做时用到
    var lineColorr = UIColor.black   //线条颜色， 默认是黑色
    var penSize: Int = 1
    var penSizes = [Int]()  //存储笔的大小数值
    
}

let theManager = Managers.manager
