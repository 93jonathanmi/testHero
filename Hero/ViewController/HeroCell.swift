//
//  HeroCell.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import UIKit

class HeroCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    
    
    override func prepareForReuse() {
        imgImage.image = nil
        imgImage.backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
        imgImage.roundCorners([ .bottomRight, .topRight , .bottomLeft, .topLeft], radius: 25)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setInfoHero(Modelo: ModelHeroLite) {
        lblName.text = Modelo.name
        lblFullName.text = Modelo.fullname
        
        
        if Modelo.urlimage != ""{
            
            let url = URL(string: Modelo.urlimage)

            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
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
