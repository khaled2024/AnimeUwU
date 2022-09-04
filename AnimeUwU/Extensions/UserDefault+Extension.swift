//
//  UserDefault+Extension.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import Foundation
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
        case hasLogin
    }
    var hasOnboarded:Bool {
        set{
            set(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        get{
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
    var hasLogin: Bool {
        set{
            set(newValue, forKey: UserDefaultsKeys.hasLogin.rawValue)
        }
        get{
            bool(forKey: UserDefaultsKeys.hasLogin.rawValue)
        }
    }
    
}
