//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by Liyana on 03/07/25.
//

import UIKit
//TODO: - Move to seperate protocols class
/**NewTaskDelegate links the NewTaskViewController and the NewTaskModelView.This helps the NewTaskViewController know when to dismiss when the x button is tapped on the NewTaskModelView and to present an error alert when user enters invalid input
 */
protocol NewTaskDelegate: AnyObject {
    //Dismiss the NewTaskViewController.Called when x button is Tapped on newTaskodelView
    func closeView()
    /**
     This presents an error alert when the user enters invalid input.
     - Parameters:
       - title : This is the title of the error alert.
       - message : A short description of what went wrong
      
     */
    func presentErrorAlert(title: String, message: String)
    
}

//This class is responsible for creating a new  Rask

class NewTaskViewController: UIViewController {
    
    
    lazy var modalView: NewTaskModalView = {
        let modelWidth = view.frame.width - CGFloat(30)
        let modelHeight: CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modelHeight / 2), width: modelWidth, height: modelHeight)
        let modalview = NewTaskModalView(frame: frame, task: task)
        modalview.delegate = self
        return modalview
    }()
   private var task: Task?
    /**
     This creates the newTaskViewController
     - Parameters:
       - task: if a task is being edited task should be passed.if a new task is being created, task should be nil
     - Returns: NewTaskViewController with a NewTaskModelView for the user to edit or create a task.
     
     */
    init(task: Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //we change the transform of the model view to zero to perform a scale up animation when the view appears
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //This animates the model view using a scale up animation  whereas it was initially set to a scale of zero in the viewdidLoad
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: [.curveEaseOut]) {
            self.modalView.transform = CGAffineTransform.identity
            
        }
    }
    
}
//MARK: - Conformance to new Task Delegate
extension NewTaskViewController: NewTaskDelegate {
    func closeView() {
        dismiss(animated: true)
    }
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}
