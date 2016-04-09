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
    
    @IBOutlet weak var calculatorLabel: UILabel!



    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadKeyboardFunction()
        clear()
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
