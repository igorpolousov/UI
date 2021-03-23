//
//  LoginFormController.swift
//  VK_Client
//
//  Created by Igor Polousov on 03.03.2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // получаем тескт логина
        let login = loginInput.text
        // получаем пароль
        let password = passwordInput.text
        // проверка логин - пароль
        if login == "admin" && password == "123456" {
            print("Успешная авторизация")
        } else {
            print("Неверные логин и пароль")
        }
    }
    
    //  функция когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification){
        
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // добавим отступ внизу UIScrollview,  равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification){
        // устанавливем отсуп снизу UIScrollView, равным нулю
        let contenInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contenInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // подписываемся на два уведомления
        // уведомление при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //уведомление при исчезновении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // метод отписки при исчезновении контроллера с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard(){
        self.scrollView?.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваеваем его UIScrollview
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные введённые пользователем
        let checkResult = checkUserData()
        // Если данные неверны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
              let password = passwordInput.text else {return false}
        
        if login == "admin" && password == "123456"{
            return true
        } else {
            return false
        }
    }
    
    func showLoginError(){
        // создаём контроллер
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        // создаём кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // добавляем кнопку на UIAlertController
        alert.addAction(action)
        // показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
}
