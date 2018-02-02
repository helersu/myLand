//
//  PathButton.swift
//  myLand
//
//  Created by cybersoft on 01/02/2018.
//  Copyright © 2018 reklammakinasi. All rights reserved.
//

import UIKit
import MapKit

class PathButton: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //Open a connection and get the data for array
    //Initiliaze UIButton for array count.Check the max number (must be max. 8)
    var buttonArray : [String] = ["1","2","3","4","5","6","7","8"]
    
    //TO-DO: change the real postion
    let buttonPositionX : [Int] = [104,31,186,0,212,31,186,104]
    let buttonPositionY : [Int] = [0,37,37,88,88,135,135,175]

    override init(frame: CGRect) {
    
    super.init(frame: frame)
        
        
        for (index,name) in buttonArray.enumerated() {
            
            
            let generatedButton = UIButton(frame: CGRect(x: buttonPositionX[index], y: buttonPositionY[index], width: 90, height: 22))
            generatedButton.setTitle(name, for: UIControlState.normal)
            generatedButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            generatedButton.tag = 1 //Maybe button name for the future
            generatedButton.addTarget(self, action: #selector(self.pressesEnded(_:with:)), for: .touchUpInside)
            //generatedButton.alpha = 0
            self.addSubview(generatedButton)
            
            
        }
     
    
    //The target function
    // @objc func pressButton(_ sender: UIButton){ //<- needs `@objc`
    //     print("\(sender)")
    // }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    

}
