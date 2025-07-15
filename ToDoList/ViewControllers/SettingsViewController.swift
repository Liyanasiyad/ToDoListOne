//
//  settingsViewController.swift
//  ToDoList
//
//  Created by Liyana on 10/07/25.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var appThemeLabel: UILabel!
    
    @IBOutlet weak var modalView: UIView!
    
    @IBOutlet weak var appThemeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? [] }.first { $0 .isKeyWindow}
        if let window = window {
            switch window.overrideUserInterfaceStyle {
            case .light:
                appThemeSegmentedControl.selectedSegmentIndex = 0
            case .dark:
                appThemeSegmentedControl.selectedSegmentIndex = 1
            case .unspecified:
                appThemeSegmentedControl.selectedSegmentIndex = 2
                
            @unknown default:
                appThemeSegmentedControl.selectedSegmentIndex = 2
            }
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modalView.scaleUpAnimation()
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
