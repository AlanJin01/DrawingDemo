//
//  ColorViewController.swift
//  DrawingDemo1
//
//  Created by J K on 2019/2/16.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    //显示所选颜色的视图
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!

    //颜色参数滑动条
    @IBAction func theSlider(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            red = CGFloat(sender.value)
        case 2:
            green = CGFloat(sender.value)
        case 3:
            blue = CGFloat(sender.value)
        case 4:
            alpha = CGFloat(sender.value)
        default:
            break
        }
        colorView.backgroundColor = changeColorValue
    }
    
    //红色参数
    var red: CGFloat = 0.0 {
        willSet {
            redSlider.setValue(Float(newValue), animated: true)
        }
    }
    
    //绿色参数
    var green: CGFloat = 0.0 {
        willSet {
            greenSlider.setValue(Float(newValue), animated: true)
        }
    }
    
    //蓝色参数
    var blue: CGFloat = 0.0 {
        willSet {
            blueSlider.setValue(Float(newValue), animated: true)
        }
    }
    
    //alpha参数
    var alpha: CGFloat = 0.0 {
        willSet {
            alphaSlider.setValue(Float(newValue), animated: true)
        }
    }
    
    //设置颜色
    var changeColorValue: UIColor {
        get {
            //读取当前颜色信息
            return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        set {
            //修改RGBA参数
            newValue.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            //把新的颜色信息当成colorView的背景颜色
            colorView.backgroundColor = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.layer.cornerRadius = colorView.frame.size.width / 2
    }
    
    //视图即将显现时
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        changeColorValue = theManager.lineColorr  //传入上一个视图中线条的颜色
    }
    
    //视图即将消失时
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        theManager.lineColorr = changeColorValue  //把当前所设置的颜色信息传给上一个视图
    }
}
