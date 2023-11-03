//
//  RandomArray.swift
//  NumboRush
//
//  Created by Sviatoslav Samoilov on 16.07.2023.
//

import Foundation

class RandomArray {
    var arrayInt = [Int]()
    
    func configureArray() {
        var randomSet = Set<Int>()
        while randomSet.count != 15 {
            randomSet.insert(Int.random(in: 1...99))
        }
        arrayInt = Array(randomSet)
    }
}
