//
//  Model.swift
//  CalculatorKeyboard
//
//  Created by Shirley He on 4/7/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit

var answer = Int()

func subtract(intOne: Int, intTwo: Int) {
    answer = intOne - intTwo
}

func addition(intOne: Int, intTwo: Int) {
    answer = intOne + intTwo
}

func multiply(intOne: Int, intTwo: Int) {
    answer = intOne * intTwo
}

func divide(intOne: Int, intTwo: Int) {
    answer = intOne / intTwo
}