//
//  NewsTableViewController.swift
//  VK_Client_6
//
//  Created by Igor Polousov on 29.03.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var news = [
        News(userImage: .init(imageLiteralResourceName: "donald"), userName: "Donald Trump", newsDate: "21.04.2020г.", newsText: "Цена нефти марки WTI с поставкой в мае упала ниже одного доллара — впервые в истории. Об этом свидетельствуют данные торгов на бирже ICE в Лондоне. В моменте американская смесь стоила 16 центов, а потом стоимость опустилась до нуля. К 21:23 WTI торговалась в отрицательных значениях — минус 7,5 доллара, а после и вовсе — почти до минус 40 долларов (37,6 доллара за баррель).", newsImage: .init(imageLiteralResourceName: "wti")),
        
        News(userImage: .init(imageLiteralResourceName: "rayDalio"), userName: "Ray Dalio", newsDate: "23.11.2019г.", newsText: "Крупнейший хедж-фонд мира Bridgewater Associates, основанный миллиардером Реем Далио, сделал крупную ставку на падение фондовых рынков США и Европы к марту 2020 года, утверждает газета The Wall Street Journal. По словам источников издания, хедж-фонд, под управлением которого находится $150 млрд от 350 клиентов, вложил около $1,5 млрд покупку пут-опционов на американский фондовый индекс S&P 500 и европейский Euro Stoxx 50. Господин Далио заявил, что представленные газетой данные не соответствуют действительности.", newsImage: .init(imageLiteralResourceName: "dollars"))
 
    ]
    
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
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        let info = news[indexPath.row]
        cell.date.text = info.newsDate
        cell.friendImage.image = info.userImage
        cell.friendName.text = info.userName
        cell.newsImage.image = info.newsImage
        cell.newsText.text = info.newsText

        return cell
    }
}
