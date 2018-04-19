//
//  vingenere.swift
//  vingeneric
//
//  Created by Eric Bunese on 18/04/2018.
//  Copyright © 2018 Eric Bunese. All rights reserved.
//

import Foundation

class Vingenere {
  var text: String = ""
  var key: String = ""
  var cypher: String = ""
  
  private let const = [3, 1, 4, 1, 5, 9, 2, 6, 5]
  private var alphabet: [String: [String]] = [:]
  
  init(text: String, key: String){
    self.text = text.uppercased()
    self.key = key.uppercased()
    self.initAlphabet()
  }
  
  func encode(prod: Int) -> String{
    var str: String = ""
    var pos: Int = 0
    let igl = self.alphabet[""]
    
    for c in self.text {
      let k = self.key[self.key.index(self.key.startIndex, offsetBy: (pos % self.key.count))]
      let alf = self.alphabet["\(k)"]
      let off = self.const[(prod+pos) % self.key.count]
      let chr = alf?.index(of: "\(c)")!
      str += igl![(chr!+off) % (igl?.count)!]
      pos = pos+1
    }
    
    self.cypher = str
    return str
  }
  
  func decode(prod: Int) -> String {
    var str: String = ""
    var pos: Int = 0
    let igl = self.alphabet[""]
    
    for c in self.cypher{
      let k = self.key[self.key.index(self.key.startIndex, offsetBy: (pos % self.key.count))]
      let alf = self.alphabet["\(k)"]
      let off = self.const[(prod+pos) % self.key.count]
      let chr = igl?.index(of: "\(c)")
      str += alf![self.modulo(val: (chr!-off), low: 0, upp: (alf?.count)!)]
      pos = pos+1
    }
    
    return str
  }
  
  private func modulo(val: Int, low: Int, upp: Int) -> Int{
    var v: Double = 0.0
    let o = Double(low)
    let d = Double(val)-Double(o)
    let w = Double(upp)-Double(o)
  
    v = d-floor(d/w)*w+o
  
    return Int(v)
  }
  
  private func initAlphabet(){
    var alf = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Ã", "Â", "Á", "À", "Ê", "É", "È", "Î", "Í", "Ì", "Õ", "Ô", "Ó", "Ò", "Û", "Ú", "Ù", ".", ",", ":", ";", "!", "?", "@", "#", "$", "%", "&", "*", "(", ")", "-", "+", "=", "_", "/", "\\", "\"", "´", "`", "ˆ", "~", "[", "{", "]", "}", "<", ">"]
    let emojiRanges = [
      0x1F601...0x1F64F,
      0x2702...0x27B0,
      0x1F680...0x1F6C0,
      0x1F170...0x1F251
    ]

    for range in emojiRanges {
        for i in range {
          var c = String(UnicodeScalar(i)!)
            alf.append(c)
        }
    }
    let igl = alf
    self.alphabet[""] = igl
    
    for c in igl{
      let pop = alf.remove(at: 0)
      alf.append(pop)
      self.alphabet["\(c)"] = alf
    }
  }
}
