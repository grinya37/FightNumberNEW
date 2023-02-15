//
//  GameViewController.swift
//  FightNumber
//
//  Created by Николай Гринько on 25.01.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: PROPERTIES
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newGamesButton: UIButton!
    
    
  
    lazy var game = Game(countItems: buttons.count) { [weak self] (status, time) in
        
        guard let self = self else { return }
        self.timerLabel.text = time.secondToString()
        self.updateInfoGame(with: status)
    }
    
    
    //MARK: - LIFE CYCLE
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        game.stopGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x = 10
        let y = 5
        
        sumNumbers(x: x, y: y)
        
        setupScreen()
    }
    
    // FIXME: СДЕЛАТЬ ПОЗЖЕ
    
    /**
     Функция суммы 2ч чисел
     - parameter x: Первое число
     - parameter y: Второе число
     - returns: Сумму чисел X и Y
     
     #Описание
     Текст Текст Текст Текст Текст Текст [google](https://google.com)

     */
    
   @discardableResult func sumNumbers(x: Int, y: Int) -> Int {
       #warning("FIX THIS FUNC")
       
        return x + y
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else { return }
        game.check(index: buttonIndex)
        updateUI()
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGames()
        sender.isHidden = true
        setupScreen()
        
        
    }
    
    
    private func setupScreen() {
        
        for index in game.items.indices {
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].alpha = 1
            buttons[index].isEnabled = true
        }
        
        nextDigit.text = game.nextItem?.title
    }
    private func updateUI() {
        for index in game.items.indices {
            //buttons[index].isHidden = game.items[index].isFound
            
            buttons[index].alpha = game.items[index].isFound ? 0 : 1
            buttons[index].isEnabled = !game.items[index].isFound
            
            
            if game.items[index].isError {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.buttons[index].backgroundColor = .red
                } completion: { [weak self] (_) in
                    self?.buttons[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                    
                }
            }
        }
        nextDigit.text = game.nextItem?.title
        
        updateInfoGame(with: game.status)
        
    }
    private func updateInfoGame(with status: StatusGame) {
        switch status {
            
        case .start:
            statusLabel.text = "Игра началась"
            statusLabel.textColor = .black
            newGamesButton.isHidden = true
        case .win:
            statusLabel.text = "Вы выиграли"
            statusLabel.textColor = .green
            newGamesButton.isHidden = false
            if game.isNewRecord {
                showAlert()
            } else {
                showAlertActionSheet()
            }
        case .lose:
            statusLabel.text = "Вы проиграли"
            statusLabel.textColor = .red
            newGamesButton.isHidden = false
            showAlertActionSheet()
        }
    }
    private func showAlert() {
        let alert = UIAlertController(title: "Поздравляем", message: "Вы установили новый рекорд", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertActionSheet() {
        let alert = UIAlertController(title: "Что вы хотите сделать далее", message: nil, preferredStyle: .actionSheet)
        
        let newGameAction = UIAlertAction(title: "Начать новую игру", style: .default) { [weak self] (_) in
            self?.game.newGames()
            self?.setupScreen()
        }
        let showRecord = UIAlertAction(title: "Посмотреть рекорд", style: .default) { [weak self] (_) in
            
            self?.performSegue(withIdentifier: "recordVC", sender: nil)
        }
        
        let menuAction = UIAlertAction(title: "Перейти в меню", style: .destructive) { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(newGameAction)
        alert.addAction(showRecord)
        alert.addAction(menuAction)
        alert.addAction(cancelAction)
        
        
        if let popover = alert.popoverPresentationController {
            popover.sourceView = statusLabel
            
            //MARK: Расположение АЛЕРТ окна по центру экрана
            //popover.sourceView = self.view
            //            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            //            popover.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            
        }
        
        present(alert, animated: true, completion: nil)
    }
}
