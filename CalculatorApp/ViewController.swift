//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Bhumi Patel on 6/15/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit


//creating enum for calculator operations
enum Operation : String{
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case percent = "%"
    case NULL = "null"
    
}



class ViewController: UIViewController {
    
    
    //implementing the buttons and making them functionable
    
    @IBOutlet weak var label1: UILabel!
    
    //creating variable to keep track of the number pressed: current number
    var curr_runningNumber = ""
    
    //left number
    var l_number = ""
    
    //right number
    var r_number = ""
    
    //final result
    var final_result = ""
    
    //operation
    var currOperation:Operation = .NULL
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change the text of our label
        label1.text = "0"
    }
    
    
    @IBAction func numberPressed(_ sender: RoundButton){
        
        if curr_runningNumber.count <= 9 {
            curr_runningNumber += "\(sender.tag)"    //we assigned tags to each number and the number will be fetched
            
            //display the tag
            label1.text = curr_runningNumber
            
        }
        
    }
    
    @IBAction func allClear(_ sender: RoundButton){
        curr_runningNumber = ""
        l_number = ""
        r_number = ""
        final_result = ""
        currOperation = .NULL
        label1.text = "0"
        
    }
    
    @IBAction func dotPressed(_ sender: RoundButton){
        
        //having a check to make sure the dot has enough space and the number does not exceed certain limit
        if curr_runningNumber.count <= 8 {
            
            curr_runningNumber += "."
            label1.text = curr_runningNumber
        }        
        
    }
    
    @IBAction func equalButton(_ sender: RoundButton){
        
        op_button(op_button: currOperation)
        
    }
    
    @IBAction func addButton(_ sender: RoundButton){
        op_button(op_button: .add)
        
    }
    
    @IBAction func subButton(_ sender: RoundButton){
        op_button(op_button: .subtract)
        
    }
    
    @IBAction func multButton(_ sender: RoundButton){
        op_button(op_button: .multiply)
        
    }
    
    @IBAction func divideButton(_ sender: RoundButton){
        op_button(op_button: .divide)
        
    }
    
    @IBAction func percentButton(_ sender: RoundButton){
        op_button(op_button: .percent)
        
    }
    
    
    func op_button(op_button: Operation){
        
        
        //currently empty, no operation happening at the moment
        if currOperation != .NULL{
            
            //check for empty string and fetch the right value
            if curr_runningNumber != ""{
                r_number = curr_runningNumber
                curr_runningNumber = ""
                
                //check for the operation +, -, *, /, %
                if currOperation == .add {
                    //performing the operation to the right and left value: first type casting to double
                    //and unwrapping by the casting down the number
                    final_result = "\(Double(l_number)! + Double(r_number)!)"
                    
                }
                else if currOperation == .subtract {
                    final_result = "\(Double(l_number)! - Double(r_number)!)"
                    
                }
                else if currOperation == .multiply {
                    final_result = "\(Double(l_number)! * Double(r_number)!)"
                    
                }
                else if currOperation == .divide {
                    final_result = "\(Double(l_number)! / Double(r_number)!)"
                    
                }
                else if currOperation == .percent {
                    r_number = "100"
                    
                    final_result = "\(Double(l_number)! / Double(r_number)!)"
                    print("Final result is")
                    
                }
                
                l_number = final_result
                label1.text = final_result
            }
            
            currOperation = op_button
            
        }
            
        //if there is an operation happening, fetch the left value
        else{
            l_number = curr_runningNumber
            curr_runningNumber = ""
            currOperation = op_button   //pass the operation we pressed
            
        }
    }
    


}

