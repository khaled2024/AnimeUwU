//
//  UiViewController+Extension.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import Foundation
import UIKit
extension UIViewController{
    static var identifier: String {
        return String(describing: self)
    }
    static func instantiate()-> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)as! Self
        return controller
    }
    
}
