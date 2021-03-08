//
//  SearchCell.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func prepareForReuse() {
        imgImage.image = nil
        imgImage.backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
        imgImage.roundCorners([ .bottomRight, .topRight , .bottomLeft, .topLeft], radius: 25)

    }

    func setInfoHeroSearch(Modelo: ModelHeroLite) {
        lblName.text = Modelo.name
        
        
        if Modelo.urlimage != ""{
            
            let url = URL(string: Modelo.urlimage)

            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    
                    if data != nil{
                    
                    self.imgImage.image = UIImage(data: data!)
                    }else{
                        
                        self.imgImage.image = UIImage(named:"iconGray")!
                        
                    }
                    
                }
            }
            
            
        }
        
        
        
    }

}
