//
//  BlueViewController.swift
//  FightNumber
//
//  Created by Николай Гринько on 26.01.2023.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    var textForLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = textForLabel
    
    }
    
    @IBAction func goToGreenController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
      if let vc = storyboard.instantiateViewController(withIdentifier: "greenVC") as? GreenViewController {
            vc.textForLabel = "Text String"
            vc.title = "Зеленый"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
        
    }
    

