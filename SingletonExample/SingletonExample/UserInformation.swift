//
//  UserInformation.swift
//  SingletonExample
//
//  Created by 김광준 on 2019/10/14.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import Foundation

class UserInformation {
    
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
    
}
