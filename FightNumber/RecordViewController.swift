//
//  RecordViewController.swift
//  FightNumber
//
//  Created by Николай Гринько on 02.02.2023.
//

import UIKit

class RecordViewController: UIViewController {
    
    
    @IBOutlet weak var recordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let record = UserDefaults.standard.integer(forKey: KeysUserDefaults.recordGame)
        if record != 0 {
            recordLabel.text = "Ваш рекорд -\(record)"
        } else {
            recordLabel.text = "Рекорд не установлен"
        }
    }
    
    @IBAction func closeVC(_ sender: Any) {
        if let nc = navigationController {
            nc.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}
