//
//  ViewModel.swift
//  ViewModelApp
//
//  Created by Florian Thiévent on 14.06.21.
//

import Foundation
import SwiftUI



class ViewModel: ObservableObject{
    @Published var title = "UI needs State"
    @Published var counter = 0
    
    func increment(){
        counter = counter + 1
    }
    
    func decrement(){
        if(counter > 0){
            counter = counter - 1
        }
    }
    
    func reset(){
        counter = 0
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


