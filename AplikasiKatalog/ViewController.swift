//
//  ViewController.swift
//  AplikasiKatalog
//
//  Created by Gilang Ramdhani Putra on 12/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = ApiService()
    
//    private var viewModel = GameViewModel()

    @IBOutlet var gameTableView: UITableView!
    
    var game = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

//        gameTableView.delegate = self
//        gameTableView.dataSource = self
//        loadGameData()
        
        apiService.getData{
            data in
            self.game = data
                        DispatchQueue.main.async {
            self.gameTableView.reloadData()
                        }
        }
        
//        gameTableView.dataSource = self
        
    }
    
//    func loadGameData(){
//        viewModel.fetchGameData { [weak self] in
//            DispatchQueue.main.async {
//                self?.gameTableView.dataSource = self
//                self?.gameTableView.delegate = self
//                self?.gameTableView.reloadData()
//            }
//
//
//        }
//    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableViewCell", for : indexPath) as! GameTableViewCell
        
        let game = game[indexPath.row]

        cell.setCellWithValuesOf(game)
        
        
        return cell
    }
    
}

