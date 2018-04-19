//
//  main.swift
//  vingeneric
//
//  Created by Eric Bunese on 18/04/2018.
//  Copyright © 2018 Eric Bunese. All rights reserved.
//

import Foundation

print("Welcome to VingenEric, please provide the text:")
let text = readLine()
print("Now please provide the pass-key:")
let key = readLine()
print("Now please provide the product value:")
let prod = Int(readLine()!)!

let ving = Vingenere(text: text!, key: key!)
print(ving.encode(prod: prod))
print(ving.decode(prod: prod))
