//
//  extension+UIColot.swift
//  ToDoList
//
//  Created by Liyana on 09/07/25.
//

import Foundation
import UIKit

extension UIColor {
    static var Work: UIColor {
        return UIColor(named: "work")!
    }
    static var secondaryWork: UIColor {
        return UIColor(named: "work")!.withAlphaComponent(0.2)
    }
    static var Excercise: UIColor {
        return UIColor(named: "excercise")!
    }
    static var secondaryExercise: UIColor {
        return UIColor(named: "excercise")!.withAlphaComponent(0.2)
    }
    static var Study: UIColor {
        return UIColor(named: "study")!
    }
    static var secondaryStudy: UIColor {
        return UIColor(named: "study")!.withAlphaComponent(0.2)
    }
    static var secondaryLink: UIColor {
        
        return UIColor(named: "secondaryLink")!
    }
}

