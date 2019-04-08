//
//  DogAPI.swift
//  Randog
//
//  Created by MANISH MOTGHARE on 08/04/19.
//  Copyright © 2019 CodersRoost. All rights reserved.
//

import Foundation

class DogAPI{
    enum Endpoint : String{
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        var url : URL{
            return URL(string: self.rawValue)!
            
        }
        
    }
}
