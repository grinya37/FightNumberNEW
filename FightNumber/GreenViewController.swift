//
//  GreenViewController.swift
//  FightNumber
//
//  Created by Николай Гринько on 27.01.2023.
//

import UIKit

class GreenViewController: UIViewController {
    
    var textForLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func goToRoot(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)
        
        if let viewControllers = self.navigationController?.viewControllers {
            for vc in viewControllers {
                if vc is YellouViewController {
                    self.navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
    }
}
    
    


