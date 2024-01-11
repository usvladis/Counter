//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Усачев on 11.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterUILabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!

    public var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false //Запрещаем менять значение TextView
        historyTextView.isScrollEnabled = true //Позволяем скроллить TextView


        counterUILabel.text = "Значение счетчика: \(count)" //Устанавливаем исходное значение счетчиков
        historyTextView.text = "История изменений: "
    }

    
    @IBAction func plusButtonTap(_ sender: Any) { //Нажатие кнопки плюс
        counterUILabel.text = "Значение счетчика: \(count)"
        updateCounter(value: 1, action: "увеличено на")
    }
    
    @IBAction func minusButtonTap(_ sender: Any) { //Нажатие кнопки минус
        if count > 0 {
            counterUILabel.text = "Значение счетчика: \(count)"
            updateCounter(value: -1, action: "уменьшено на")
        }else {
            decreaseBelowZero()
        }

    }
    
    @IBAction func zeroButtonTap(_ sender: Any) { //Сброс
        counterUILabel.text = "Значение счетчика: \(count)"
        updateCounter(value: -count, action: "сброшено")

    }
    
    func updateCounter(value: Int, action: String) {
            count += value
            counterUILabel.text = "Значение счетчика: \(count)"
            
            let currentDate = getCurrentDate()
            let historyText = "\n\(currentDate): значение \(action) \(abs(value))"
        historyTextView.text.append(historyText)
        }
        
        func decreaseBelowZero() { //Функция если будет попытка уменьшить значение меньшу нуля
            let currentDate = getCurrentDate()
            let historyText = "\n\(currentDate): попытка уменьшить значение счетчика ниже 0"
            historyTextView.text.append(historyText)
        }
        
        func getCurrentDate() -> String { //Функция для удобного формата даты и времени
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            return dateFormatter.string(from: Date())
        }
    
}

