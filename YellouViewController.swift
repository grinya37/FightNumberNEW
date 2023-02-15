//
//  YellouViewController.swift
//  FightNumber
//
//  Created by Николай Гринько on 26.01.2023.
//

import UIKit

class YellouViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("YellowViewController viewDidload")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("YellowViewController viewWillAppear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("YellowViewController viewDidAppear")
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("YellowViewController viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("YellowViewController viewDidDisappear")
    }
    
    deinit {
        print("YellowViewController deinit")
    }
    
    
    @IBAction func goToBlueController(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: "Privet Chuvak")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToBlue":
            if let blueVC = segue.destination as? BlueViewController {
                if let string = sender as? String {
                    blueVC.textForLabel = string
                }
            }
            default:
                break
            }
        }
    }



