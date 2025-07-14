//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by Liyana on 03/07/25.
//

import UIKit
protocol NewTaskDelegate: AnyObject {
    func closeView()
    func presentErrorAlert(title: String, message: String)
    
}

class NewTaskViewController: UIViewController {
    
    
    lazy var modalView: NewTaskModalView = {
        let modelWidth = view.frame.width - CGFloat(30)
        let modelHeight: CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modelHeight / 2), width: modelWidth, height: modelHeight)
        let modalview = NewTaskModalView(frame: frame, task: task)
        modalview.delegate = self
        return modalview
    }()
    var task: Task?
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
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
