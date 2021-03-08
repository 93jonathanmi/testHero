//
//  MoreInfoViewController.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import UIKit

class MoreInfoViewController: UIViewController {

    var mData : ModelHeroLite?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    
    @IBOutlet weak var lblInteligence: UILabel!
    @IBOutlet weak var lblStrengh: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblDurability: UILabel!
    @IBOutlet weak var lblCombat: UILabel!
    @IBOutlet weak var lblPower: UILabel!
    
    @IBOutlet weak var lblAlterEgos: UILabel!
    @IBOutlet weak var lblAliases: UILabel!
    @IBOutlet weak var lblBirth: UILabel!
    @IBOutlet weak var lblAppearance: UILabel!
    @IBOutlet weak var lblPublisher: UILabel!
    @IBOutlet weak var lblAlignment: UILabel!
    
    @IBOutlet weak var lblExtra: UILabel!
    
    @IBOutlet weak var lblAfiliation: UILabel!
    @IBOutlet weak var lblRelative: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblName.text = mData?.name
        lblFullName.text = mData?.fullname
        
        if mData?.urlimage != ""{
            
            let url = URL(string: mData!.urlimage)

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
        
        lblInteligence.text = "Inteligence : \(mData?.intelligence ?? "Uknow")"
        lblStrengh.text = "Strengh : \(mData?.strength ?? "Uknow")"
        lblSpeed.text = "Speed : \(mData?.speed ?? "Uknow")"
        lblDurability.text = "Durability : \(mData?.durability ?? "Uknow")"
        lblCombat.text = "Combat : \(mData?.combat ?? "Uknow")"
        lblPower.text = "Power : \(mData?.power ?? "Uknow")"
        
        
        lblAlterEgos.text = "Alter-egos : \(mData?.alteregos ?? "Uknow")"
        lblAliases.text = "Aliases : \(mData?.aliases ?? "")"
        lblBirth.text = "Place of Birth : \(mData?.placeofbirth ?? "Uknow")"
        lblAppearance.text = "First Appearance : \(mData?.firstappearance ?? "Uknow")"
        lblPublisher.text = "Publisher : \(mData?.publisher ?? "Uknow")"
        lblAlignment.text = "Alignment : \(mData?.alignment ?? "Uknow")"
        
        
        lblExtra.text = "Eyes Color : \(mData?.eyecolor ?? "") - Hair Color : \(mData?.haircolor ?? "") - Gender : \(mData?.gender ?? "") - Race : \(mData?.race ?? "") - Height : \(mData?.height ?? "") - Weight : \(mData?.weight ?? "")"
        
        lblAfiliation.text = "Group Affiliation: \(mData?.groupaffiliation ?? "")"
        lblRelative.text = "Relatives: \(mData?.relatives ?? "")"
        
    }
    


}
