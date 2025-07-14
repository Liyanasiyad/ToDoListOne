//
//  CategoryModel.swift
//  ToDoList
//
//  Created by Liyana on 04/07/25.
//

import Foundation
import UIKit
enum Category: String , CaseIterable {
    case work = "Work", study = "Study", excercise = "Excercise"
    var color:  UIColor {
        switch self {
        case .work:
            return UIColor.work
        case .study:
            return UIColor.study
        case .excercise:
            return UIColor.excercise
        }
    }
    var secondaryColor:  UIColor {
        switch self {
        case .work:
            return UIColor.secondaryWork
        case .study:
            return UIColor.secondaryStudy
        case .excercise:
            return UIColor.secondaryExercise
        }
    }

}
