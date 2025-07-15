//
//  RoundedButton.swift
//  ToDoList
//
//  Created by Liyana on 11/07/25.
//

import UIKit

class RoundedButton: UIButton {
    override  func awakeFromNib() {
        super .awakeFromNib()
        backgroundColor = UIColor.link
        
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }

   

}
