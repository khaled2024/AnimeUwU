//
//  UiView+Extension.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit
extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.cornerRadius
        }
    }
}
