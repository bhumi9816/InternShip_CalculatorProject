//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by Bhumi Patel on 6/15/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {

   //helps to replicate round button using corner radius
    @IBInspectable
    var roundButton: Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height / 2
        }
    } 

}
