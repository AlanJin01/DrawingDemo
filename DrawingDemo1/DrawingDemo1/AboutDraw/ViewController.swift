//
//  ViewController.swift
//  DrawingDemo1
//
//  Created by J K on 2019/2/15.
//  Copyright © 2019 KimsStudio. All rights reserved.
//


//主视图
import UIKit

class ViewController: UIViewController {

    //绘图画布
    @IBOutlet weak var theDrawingView: TheDrawingView!
    //显示当前所选的颜色,点击可进入另一个选择颜色的视图
    @IBOutlet weak var colorViewButton: UIButton!
    //显示笔的大小
    @IBOutlet weak var penSizeLabel: UILabel!
    //笔的尺寸选择按钮
    @IBOutlet weak var theStepper: UIStepper!
    
    //MARK: -
    //设置画笔大小
    @IBAction func theStepper(_ sender: UIStepper) {
        theManager.penSize = Int(sender.value)
        penSizeLabel.text = "\(Int(sender.value))"
    }
    
    //MARK: -
    //清除按钮
    @IBAction func clearButton(_ sender: UIButton) {
        theManager.lines = [TheDrawLine]()
        theManager.secondLinesStack = [TheDrawLine]()
        theManager.penSizes = [Int]()
        theDrawingView.setNeedsDisplay()
    }
    //撤销按钮
    @IBAction func undoButton(_ sender: UIButton) {
        if !theManager.lines.isEmpty {
            theManager.secondLinesStack.append(theManager.lines.last!)
            theManager.lines.removeLast()
            theDrawingView.setNeedsDisplay()
        }
    }
    //重做按钮
    @IBAction func redoButton(_ sender: UIButton) {
        if !theManager.secondLinesStack.isEmpty {
            theManager.lines.append(theManager.secondLinesStack.last!)
            theManager.secondLinesStack.removeLast()
            theDrawingView.setNeedsDisplay()
        }
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theStepper.sizeToFit() //大小为自适应
        theStepper.value = Double(theManager.penSize)  //默认参数
        theStepper.minimumValue = 1  //最小值
        theStepper.maximumValue = 20  //最大值
        theStepper.stepValue = 1 //步进数
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        colorViewButton.backgroundColor = theManager.lineColorr
        penSizeLabel.text = "\(theManager.penSize)"
    }

}

