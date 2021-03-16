//
//  AllCitiesController.swift
//  WeatherApp
//
//  Created by Igor Polousov on 14.03.2021.
//

import UIKit
/*
 1. Создали отдельную папку "AllCities", в которой создали два файла Cocoa Touch.
   Наследники UITableViewController(AllCitiesController)  и UITableViewCell(AllCitiesCell)
 2. Оба класса назначаем соответсвующим контроллерам в StoryBoard
 3. Добавили надпись(Lable) на прототип ячейки и создали для надписи IBOutlet cityName -> AllCitiesCell
 4. Добавил массив строк с названиями городов
 5. Изменил метод tableView , чтобы укзать количество строк. Изменил метод numberOfSections -> return from 0 to 1
 6. Добавили прототипу ячейки идентификатор в StoryBoard
 7. Изменил метод tableView cellForRowAt - reuseIdentifier -> CityCell. Изменил на свой идентификатор прототипа ячейки
 8. Повторили аналогично для My Cities. Массив городов в MyCitiesController оставляем пустым
 9. Добавляем в MyCitiesController метод @IBAction для создания UnwindSegue -> добавляем Unwind Segue  в StoryBoard в AllCitiesController
 10. Делаем чтобы можно было различать UnwindSegue, тк их может быть несколько. Изменим идентификатор UnwindSegue на addCity
 11. Делаем так, чтобы нельзя было добавить дублирующие названия городов
 12. Делаем функцию удаления города
 13. Создадим папку Weather  в которой создадим два файла: WeatherViewController - UICollectionVeiwController. WeatherCell - UICollectionViewCell. Назначим их соотв. элементам в StoryBoard
 14. Установим размеры ячеек, добавим Lable  и Image
 15. Добавим иконки png в папку Assets.xcassets перетаскиваем из папки в Xcode
 16. Устанавливаем идентификатор для прототипа ячейки
 17. Редактируем collectionViewController
 */

class AllCitiesController: UITableViewController {
// MARK 4
    var citiess = [
        "Moscow",
        "Paris",
        "London"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
//MARK 5
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//MARK 5
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiess.count
    }

//MARK 7
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! AllCitiesCell
        // Получаем город для конкретной строки
        let city = citiess[indexPath.row]
        // Устанавливаем город в надпись для ячейки
        cell.cityName.text = city

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
