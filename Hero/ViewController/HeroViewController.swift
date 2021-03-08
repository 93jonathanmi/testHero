//
//  ViewController.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import UIKit

class HeroViewController: UIViewController {
    
    //vars
    
    var dataHero = [ModelHeroLite]()
    
    var countId = 0
    var limit = 10
    let maxEnteries = 500
    
    //outlets
    @IBOutlet weak var activityHero: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableHero: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        while self.limit > self.countId {
            self.countId = self.countId + 1
            
            self.GETHeroRequest()
            
        }
        print("Termino")
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableHero.dataSource = self
        tableHero.delegate = self
        
        searchBar.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMoreInfo"{
            
            let controllerDestination = segue.destination as? MoreInfoViewController
            
            let indexPath = tableHero.indexPath(for: (sender as? UITableViewCell)!)
            
            let listDestination = dataHero [indexPath!.row]
            
            controllerDestination?.mData = listDestination
            
        }
    }
    
    
    
    
}
extension HeroViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHero.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "heroCell") as! HeroCell
        let infoCell = dataHero[indexPath.row]
        
        cell.setInfoHero(Modelo: infoCell)
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableHero.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if dataHero.count != 0{
            
            if indexPath.row == dataHero.count - 1{
                
                print("llego al final")
                if dataHero.count < maxEnteries{
                    
                    var newIndex = dataHero.count
                    
                    limit = newIndex + 10
                    
                    print(countId, limit)
                    
                    while limit > countId {
                        self.countId = countId + 1
                        
                        GETHeroRequest()
                        
                    }
                    
                    
                }
            }
            
            
        }
        
    }
    
    
    
    
    //Get Heros
    func GETHeroRequest(){
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.superheroapi.com/api.php/10156112965520834/\(countId)")! as URL,
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
                    //print(parsedDictionaryArray)
                    
                    let valid = parsedDictionaryArray["response"] as! String
                    
                    
                    if valid == "success"{
                        
                        //
                        let id = parsedDictionaryArray["id"] as! String
                        let name = parsedDictionaryArray["name"] as! String
                        
                        
                        var intelligence = "Uknow"
                        var strength = "Uknow"
                        var speed = "Uknow"
                        var durability = "Uknow"
                        var power = "Uknow"
                        var combat = "Uknow"
                        
                        var fullName  = "Uknow"
                        var alterEgos = "Uknow"
                        var aliases = ""
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
                        
                        if let powerstats = parsedDictionaryArray["powerstats"] as? NSDictionary {
                            
                            intelligence = powerstats["intelligence"] as! String
                            strength = powerstats["strength"] as! String
                            speed = powerstats["speed"] as! String
                            durability = powerstats["durability"] as! String
                            power = powerstats["power"] as! String
                            combat = powerstats["combat"] as! String
                            
                        }
                        
                        
                        if let biography = parsedDictionaryArray["biography"] as? NSDictionary {
                            
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
                        
                        if let appearance = parsedDictionaryArray["appearance"] as? NSDictionary {
                            
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
                        
                        if let work = parsedDictionaryArray["work"] as? NSDictionary {
                            
                            occupation = work["occupation"] as! String
                            base = work["base"] as! String
                            
                        }
                        
                        if let connections = parsedDictionaryArray["connections"] as? NSDictionary {
                            
                            groupAffiliation = connections["group-affiliation"] as! String
                            relatives = connections["relatives"] as! String
                            
                        }
                        
                        
                        if let image = parsedDictionaryArray["image"] as? NSDictionary {
                            
                            imgImage = image["url"] as! String
                            
                        }
                        
                        //
                        
                        let newHero = ModelHeroLite(id: id, name: name, intelligence: intelligence, strength: strength, speed: speed, durability: durability, power: power, combat: combat, fullname: fullName, alteregos: alterEgos, aliases: aliases, placeofbirth: placeOfBirth, firstappearance: firstAppearance, publisher: publisher, alignment: alignment, gender: gender, race: race, height: height, weight: weight, eyecolor: eyeColor, haircolor: hairColor, occupation: occupation, base: base, groupaffiliation: groupAffiliation, relatives: relatives, urlimage: imgImage)
                        
                        self.dataHero.append(newHero)
                        
                        DispatchQueue.main.async {
                            self.perform(#selector(self.loadTable), with: nil, afterDelay: 0.8)
                        }
                    }
                    
                    
                    
                } catch let error as NSError {
                    
                    
                    print(error)
                }
                
                
            }
        })
        
        dataTask.resume()
        
        
    }
    
    
    //Reload a table
    @objc func loadTable(){
        self.tableHero.reloadData()
    }
    
    
    
}

extension HeroViewController: UISearchBarDelegate{
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "goToSearch", sender: self)
    }
    
}
