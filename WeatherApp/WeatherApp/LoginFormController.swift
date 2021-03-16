//
//  LoginFormController.swift
//  WeatherApp
//
//  Created by Igor Polousov on 14.03.2021.
//

import UIKit

class LoginFormController: UIViewController {

    /*
     1. Делаем привязку кнопки и текстовых полей к коду
       так же в код надо добавть scrollview
     2. В функцию кнопки loginButtonPressed добавляем получение логина и пароля из текстовых полей
       задаем проверку верности введённого логина и пароля и так же задаём логин и пароль
     3. Добавляем функцию что надо сделать, когда будет показана клавиатура: получить размер клавиатруры и сделать отступ в UIScrollView
     4. Добавляем функцию когда клавиатура исчезнет с экрана: клавиатура исчезает и делаем отступ
       в UIScrollView равным нулю
     5. Подписываемся на 2 уведомления: уведомление при появлении и при исчезновении клавиатуры
     6. Добавляем метод отписки при исчезновении контроллера с экрана
     7. Делаем изменения в методе viewDidLoad: устанавливаем жест нажатия и присваеваем его UIScrollView
     8. Делаем изменения в методе shouldPerformSegue: добавляем метод проверки логина и пароля и если введёны неверные данные выдаем сообщение
     */
    
    // MARK 1
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    // MARK 2
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    //MARK 3
    @objc func keyboardWasShown(notification: Notification){
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавим отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //MARK 4
        // когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification){
        // устанавливем отсуп снизу UIScrollView, равным нулю
        let contenInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contenInsets
    }
    
    //MARK 5
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // подписываемся на два уведомления
        // уведомление при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //уведомление при исчезновении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK 6
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
        
    //MARK 7
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваеваем его UIScrollview
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        }
    
    //MARK 8
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        // Если данные неверны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        // Вернём результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        let login = loginInput.text
        let password = passwordInput.text
        if login == "admin" && password == "12345"{
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        // создаём Alert контроллер
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        // Создаём кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // добавляем кнопку на UIAlertController
        alert.addAction(action)
        // показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
}
