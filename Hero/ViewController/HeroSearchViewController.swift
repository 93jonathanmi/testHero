//
//  HeroSearchViewController.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import UIKit

class HeroSearchViewController: UIViewController {

    
    var dataHeroSearch = [ModelHeroLite]()

    var searchThis : String?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionData: UICollectionView!
    
    @IBAction func actBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.becomeFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionData.alpha = 0

        collectionData.dataSource = self
        collectionData.delegate = self
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMoreInfo"{
            
            let controllerDestination = segue.destination as? MoreInfoViewController
            
            let indexPath = collectionData.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let listDestination = dataHeroSearch [indexPath!.row]
            
            controllerDestination?.mData = listDestination
            
        }
    }
    


    

}


extension HeroSearchViewController : UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataHeroSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchCell
        
        let list = dataHeroSearch[indexPath.row]
        
        cell.setInfoHeroSearch(Modelo: list)
        
        return cell
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchThis = searchText
        
        
        if searchThis != ""{
            
            searchThis = searchThis!.trimmingCharacters(in: .whitespacesAndNewlines)
            searchThis = searchThis?.removeWhitespace()
            
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload), object: nil)
            self.perform(#selector(self.reload), with: nil, afterDelay: 0.9)
        }
        
    }
    

    @objc func reload() {
        GETHeroSearchRequest()

    }
    
    
    
    
    //Get Heros
    func GETHeroSearchRequest(){

        let request = NSMutableURLRequest(url: NSURL(string:"https://superheroapi.com/api/10156112965520834/search/\(searchThis ?? "")")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            
            if (error != nil) {
                print(error)
                
            } else {
                
                do {
                    
                    
                    let parsedDictionaryArray = try JSONSerialization.jsonObject(with: data!) as! [String:AnyObject]
                    print(parsedDictionaryArray)
                    
                    let valid = parsedDictionaryArray["response"] as! String

                    
                    if valid == "success"{
                        
                        self.dataHeroSearch.removeAll()
                        
                        if let arry = parsedDictionaryArray["results"] as? [[String:AnyObject]] {
                            for dic in arry {
                                
                                let id = dic["id"] as! String
                                let name = dic["name"] as! String
                                
                                
                                var intelligence = "Uknow"
                                var strength = "Uknow"
                                var speed = "Uknow"
                                var durability = "Uknow"
                                var power = "Uknow"
                                var combat = "Uknow"
                                
                                var fullName  = "Uknow"
                                var alterEgos = "Uknow"
                                var aliases = "Uknow"
                                var placeOfBirth = "Uknow"
                                var firstAppearance = "Uknow"
                                var publisher = "Uknow"
                                var alignment = "Uknow"
                                
                                var gender = "Uknow"
                                var race = "Uknow"
                                var height = ""
                                var weight = ""
                                var eyeColor = "Uknow"
                                var hairColor = "Uknow"
                                
                                var occupation = "Uknow"
                                var base = "Uknow"
                                
                                var groupAffiliation = "Uknow"
                                var relatives = "Uknow"
                                
                                var imgImage  = ""
                                
                                if let powerstats = dic["powerstats"] as? NSDictionary {
                                    
                                    intelligence = powerstats["intelligence"] as! String
                                    strength = powerstats["strength"] as! String
                                    speed = powerstats["speed"] as! String
                                    durability = powerstats["durability"] as! String
                                    power = powerstats["power"] as! String
                                    combat = powerstats["combat"] as! String
                                    
                                }
                                
                                
                                if let biography = dic["biography"] as? NSDictionary {
                                    
                                    fullName = biography["full-name"] as! String
                                    alterEgos = biography["alter-egos"] as! String
                                    
                                    if let arryAliases = biography["aliases"] as? NSArray {
                                        for element in arryAliases {
                                            if let persons = element as? String{
                                                aliases = "\(persons) \(aliases)"
                                            }
                                        }
                                        
                                    }
                                    
                                    placeOfBirth = biography["place-of-birth"] as! String
                                    firstAppearance = biography["first-appearance"] as! String
                                    publisher = biography["publisher"] as! String
                                    alignment = biography["alignment"] as! String
                                    
                                }
                                
                                if let appearance = dic["appearance"] as? NSDictionary {
                                    
                                    gender = appearance["gender"] as! String
                                    race = appearance["race"] as! String
                                    
                                    if let arryHeight = appearance["height"] as? NSArray {
                                        for element in arryHeight {
                                            if let newElement = element as? String{
                                                height = "\(newElement) \(height)"
                                            }
                                        }
                                        
                                    }
                                    if let arryWeight = appearance["weight"] as? NSArray {
                                        for element in arryWeight {
                                            if let newElement = element as? String{
                                                weight = "\(newElement) \(weight)"
                                            }
                                        }
                                        
                                    }
                                    
                                    eyeColor = appearance["eye-color"] as! String
                                    hairColor = appearance["hair-color"] as! String
                                    
                                    
                                }
                                
                                if let work = dic["work"] as? NSDictionary {
                                    
                                    occupation = work["occupation"] as! String
                                    base = work["base"] as! String
                                    
                                }
                                
                                if let connections = dic["connections"] as? NSDictionary {
                                    
                                    groupAffiliation = connections["group-affiliation"] as! String
                                    relatives = connections["relatives"] as! String
                                    
                                }
                                
                                
                                if let image = dic["image"] as? NSDictionary {
                                    
                                    imgImage = image["url"] as! String
                                    
                                }

                                
                                let newHero = ModelHeroLite(id: id, name: name, intelligence: intelligence, strength: strength, speed: speed, durability: durability, power: power, combat: combat, fullname: fullName, alteregos: alterEgos, aliases: aliases, placeofbirth: placeOfBirth, firstappearance: firstAppearance, publisher: publisher, alignment: alignment, gender: gender, race: race, height: height, weight: weight, eyecolor: eyeColor, haircolor: hairColor, occupation: occupation, base: base, groupaffiliation: groupAffiliation, relatives: relatives, urlimage: imgImage)
                                
                                self.dataHeroSearch.append(newHero)
                                
                            }
                            
                            DispatchQueue.main.async {
                                if self.dataHeroSearch.count > 0{
                                    self.collectionData.alpha = 1
                                    self.perform(#selector(self.loadTable), with: nil, afterDelay: 0.8)
                                }else{
                                    self.collectionData.alpha = 0
                                }
                                
                            }
                            
                            
                        }
                        
                        
                        

                    }
                    
                    
                    
                } catch let error as NSError {
                    
                    
                    print(error)
                }
                
                
            }
        })
        
        dataTask.resume()
        
        
    }
    
    @objc func loadTable(){
        self.collectionData.reloadData()
    }
    
   
}
