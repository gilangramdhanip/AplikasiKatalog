//
//  GameTableViewCell.swift
//  AplikasiKatalog
//
//  Created by Gilang Ramdhani Putra on 12/09/21.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseGame: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var genreGame: UILabel!
    
    
    func setCellWithValuesOf(_ game: Game){
        updateUI(title: game.name, desc: game.released, gameImage: game.background_image, genre: game.genres)
    }

    private func updateUI(title: String?, desc: String?, gameImage : String?, genre : [Genre]) {
        
        self.releaseGame.text = desc
        self.gameTitle.text = title
        
        guard let imageString = gameImage else {return}
        
        guard let postImageUrl = URL(string: imageString) else {
            self.gameImage.image = UIImage(named: "")
            return
        }
        
        self.gameImage.layer.cornerRadius = 5
        
        self.gameImage.image = nil
        
        getImageDataFrom(url: postImageUrl)
        
            self.genreGame.text = "\(genre.map{$0.name})"
    }
    
    
    private func getImageDataFrom(url : URL){
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            
            if let error = error {
                print("Data Task Error : \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                
                print("Empty Data")
                
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.gameImage.image = image
                }
            }
            
        }.resume()
    }

}
