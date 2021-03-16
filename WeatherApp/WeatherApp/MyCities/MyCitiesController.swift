//
//  MyCitiesController.swift
//  WeatherApp
//
//  Created by Igor Polousov on 14.03.2021.
//

import UIKit

class MyCitiesController: UITableViewController {
    
    var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell
        // Получаем город для конктретной строки
        let city = cities[indexPath.row]
        
        // Устанавливаем город в надпись ячейки
        cell.cityName.text = city
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка удалить
        if editingStyle == .delete {
            // Удаляем город из массива
            cities.remove(at: indexPath.row)
            // Удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK 9
    @IBAction func addCity(segue: UIStoryboardSegue){
        //MARK 10
        // Проверяем индетификатор, чтобы убедться, что это нужный нам переход
        if segue.identifier == "addCity" {
            //MARK 11
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let allCitiesController = segue.source as? AllCitiesController else {return}
            // Получаем индекс выделенной ячейки
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                // Получаем город по индексу
                let city = allCitiesController.citiess[indexPath.row]
                
                if !cities.contains(city){
                    // Добавляем город в список выбранных городов
                    cities.append(city)
                    // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
        
        
    }
}
