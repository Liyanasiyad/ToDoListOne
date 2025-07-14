//
//  settingsViewController.swift
//  ToDoList
//
//  Created by Liyana on 10/07/25.
//

import UIKit

class settingsViewController: UIViewController {

    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appThemeLabel: UILabel!
    
    @IBOutlet weak var modalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalView.layer.cornerRadius = 5
        
    }
    

    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedControlValueChange(_ sender: UISegmentedControl) {
        //uiapplication
        //windowscenes
        //windows
        //keywindow
        //overrideUserInterfaceStyle
        let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? [] }.first { $0 .isKeyWindow}
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            window?.overrideUserInterfaceStyle = .dark
        }
        else {
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
}
