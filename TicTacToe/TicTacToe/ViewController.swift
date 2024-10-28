//
//  ViewController.swift
//  TicTacToe
//
//  Created by BCL Device 10 on 21/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var scoreOLabel: UILabel!
    @IBOutlet weak var scoreXLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!

    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c1: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    
    var noughtScore = 0
    var crossScore = 0
    
    var board = [UIButton]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initBoard()
    }
    func initBoard()
    {
        a1.setTitle("", for: .normal)
        a2.setTitle("", for: .normal)
        a3.setTitle("", for: .normal)
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        c1.setTitle("", for: .normal)
        c2.setTitle("", for: .normal)
        c3.setTitle("", for: .normal)
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
        //a1.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        for button in board {
                button.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .heavy) // Font size
                button.setTitleColor(.black, for: .disabled) // Ensure text stays black even when button is disabled
           // button.setTitleColor(.red, for: .normal)
        }
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if(checkVictory(CROSS))
        {
            crossScore+=1
            resultAllert(title: "X Wins!")
            scoreXLabel.text = "X - "+String(crossScore)
        }
        else if(checkVictory(NOUGHT))
        {
            noughtScore+=1
            resultAllert(title: "O Wins!")
            scoreOLabel.text = "O - "+String(noughtScore)
            
        }
        else if(fullBoard())
        {
            
            resultAllert(title: "Draw")
        }
    }
    
    func resultAllert(title: String)
    {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac,animated: true)
    }
    
    func checkVictory(_ s: String) -> Bool
    {
        //horizontal
        if(isThisSymbol(a1, s) && isThisSymbol(a2, s) && isThisSymbol(a3, s) )
        {
            return true
        }
        if(isThisSymbol(b1, s) && isThisSymbol(b2, s) && isThisSymbol(b3, s) )
        {
            return true
        }
        if(isThisSymbol(c1, s) && isThisSymbol(c2, s) && isThisSymbol(c3, s) )
        {
            return true
        }
        
        //vertical
        if(isThisSymbol(a1, s) && isThisSymbol(b1, s) && isThisSymbol(c1, s) )
        {
            return true
        }
        if(isThisSymbol(a2, s) && isThisSymbol(b2, s) && isThisSymbol(c2, s) )
        {
            return true
        }
        if(isThisSymbol(a3, s) && isThisSymbol(b3, s) && isThisSymbol(c3, s) )
        {
            return true
        }
        
        //diagonal
        if(isThisSymbol(a1, s) && isThisSymbol(b2, s) && isThisSymbol(c3, s) )
        {
            return true
        }
        if(isThisSymbol(a3, s) && isThisSymbol(b2, s) && isThisSymbol(c1, s) )
        {
            return true
        }
        
        return false
    }
    
    func isThisSymbol(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func resetBoard()
    {
        for i in board
        {
            i.setTitle("", for: .normal)
            i.isEnabled = true
        }
        if(firstTurn == Turn.Nought)
        {
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        }
        else if(firstTurn == Turn.Cross)
        {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool
    {
        for i in board
        {
            if i.title(for: .normal) == ""
            {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton)
    {
        //sender.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        if(sender.title(for: .normal) == "") //nothing in our button's title //meaning its a valid move
        {
            if(currentTurn == Turn.Nought)
            {
                sender.setTitle(NOUGHT, for: .normal) //text style normal
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if(currentTurn == Turn.Cross)
            {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
                
            }
            sender.isEnabled = false //remove the animation of which button already clicked
        }
        
    }
    
}

