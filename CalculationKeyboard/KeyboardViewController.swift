//
//  KeyboardViewController.swift
//  CalculationKeyboard
//
//  Created by Shirley He on 4/7/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    var keyboardView: UIView!
    var calculateAgain = true
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var calculatorLabel: UILabel!



    override func updateViewConstraints() {
        super.updateViewConstraints()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadKeyboardFunction()
        clear()
    }
    
    @IBAction func calculate() {
        if firstNumber != 0 && operation != "" && calculatorLabel.text != "" {
            
            if let anInt = Int(calculatorLabel.text!) {
                secondNumber = anInt
            }
            if secondNumber != 0 && calculateAgain == true {
                
                calculateAgain = false
                submitButton.enabled = true
                
                print(firstNumber)
                print(secondNumber)
                print(operation)
                
                if operation == "+" {
                    addition(firstNumber, intTwo: secondNumber)
                    updateLabel()
                }
                else if operation == "-" {
                    subtract(firstNumber, intTwo: secondNumber)
                    updateLabel()
                }
                else if operation == "x" {
                    multiply(firstNumber, intTwo: secondNumber)
                    updateLabel()
                }
                else if operation == "/" {
                    divide(firstNumber, intTwo: secondNumber)
                    updateLabel()
                }
            }
        }
    }
    //convert to string to display
    func updateLabel() {
        calculatorLabel.text = String(answer)
    }
    @IBAction func operationPressed(sender: UIButton!) {
        let operationPressed = sender.titleLabel?.text
        if firstNumber == 0 && secondNumber == 0 && calculatorLabel != "" && operation == "" {
            if calculatorLabel.text != "" {
                
            
            if let operationTouch = operationPressed {
                operation = operationTouch
            }
            //convert string to int
            if let anInt = Int(calculatorLabel.text!) {
                firstNumber = anInt
                calculatorLabel.text = ""
                
            }
            
        }
        //prints "2: +"
        print("\(firstNumber): \(operation)")
    }
        else {
            print("do nothing")
        }
    }
    
    @IBAction func submit() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(calculatorLabel.text!)
    }
    
    @IBAction func hideKeyboard() {
        dismissKeyboard()
    }

    @IBAction func deleteText() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    @IBAction func goToNextKeyboard() {
        advanceToNextInputMode()
    }
    
    @IBAction func clear() {
        calculatorLabel.text = ""
        firstNumber = 0
        secondNumber = 0
        operation = ""
        calculateAgain = true
        submitButton.enabled = false
        
    }
    
    @IBAction func numberPressed(sender: UIButton!) {
        let numberPressed = sender.titleLabel?.text
        
        if firstNumber != 0 && secondNumber != 0 {
            //do nothing
        }
        else {
            calculatorLabel.text = calculatorLabel.text! + numberPressed!
        }
        
    }
    
    //adding keyboard programmatically
    func loadKeyboardFunction() {
        let keyboardNib = UINib(nibName: "View", bundle: nil)
        //changing from Nib to UI
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.backgroundColor = keyboardView.backgroundColor
        view.addSubview(keyboardView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    

    }

}
