//
//  PillButton.swift
//  ToDoList
//
//  Created by Liyana on 11/07/25.
//

import UIKit

class PillButton: UIButton {
    override  func awakeFromNib() {
        super .awakeFromNib()
        backgroundColor = UIColor.link
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius =   frame.height / 2
    }
        
       
   


}
