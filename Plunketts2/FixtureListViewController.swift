//
//  FixtureListViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 17/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import UIKit

class FixtureListViewController: UITableViewController {
    
    let clubNames = ["Dublin GAA Head Office", "Adamstown","AIB","Ballinteer St. Johns","Ballyboden St. Endas","Ballyboughal", "Ballyfermot De La Salle", "Ballymun Kickhams",
                          "Bank of Ireland",
                          "Beann Eadair",
                          "Castleknock",
                          "Civil Service Football",
                          "Clanna Gael Fontenoy",
                          "Clann Mhuire",
                          "Clontarf",
                          "Commercials",
                          "Craobh Chiaráin",
                        "Croí Ró Naofa",
                        "Crumlin",
                        "Cuala",
                        "Erin Go Bragh",
                        "Erins Isle",
                        "Faughs",
            "Fingallians","Fingal Ravens",
        "Garda",
        "Garristown",
        "Geraldine Morans",
        "Good Counsel",
        "Innisfails",
        "Kevins",
        "Kilmacud Crokes",
        "Liffey Gaels",
        "Lucan Sarsfields",
        "Man-O-War",
        "Na Dubh Ghall",
        "Na Fianna",
        "Na Gaeil Óga CLG",
        "Naomh Barróg",
        "Naomh Fionnbarra",
        "Naomh Mearnóg",
        "Naomh Olaf",
        "O'Dwyers",
        "O'Tooles",
        "Parnells",
        "Pavee",
        "Portobello",
        "Raheny",
        "Ranelagh Gaels",
        "Realt Dearg",
        "Robert Emmets",
        "Rosmini Gaels",
        "Round Towers Clondalkin",
        "Round Towers Lusk",
        "Samildánach",
        "Scoil Uí Chonaill",
        "Setanta",
        "Shankill",
        "Skerries Harps",
        "St. Annes",
        "Starlights",
        "Stars of Erin",
        "St. Brendans",
        "St. Brigids",
        "St. Colmcille",
        "St. Finians Newcastle",
        "St. Finians Swords",
        "St. Francis Gaels",
        "St. James Gaels",
        "St. Joseph's O'Connell Boys",
        "St. Judes",
        "St. Kevins Killians",
        "St. Margarets",
        "St. Marks",
        "St. Marys",
        "St. Maurs",
        "St. Monicas",
        "St. Oliver Plunkett Eoghan Ruadh",
        "St. Patricks Donabate",
        "St. Patricks Palmerstown",
        "St. Peregrines",
        "St. Sylvesters",
        "St. Vincents",
        "Templeogue Synge Street",
        "Thomas Davis",
        "Trinity Gaels",
        "Tyrellstown",
        "U.C.D.",
        "Wanderers",
        "Westmanstown Gaels",
        "Whitehall Colmcille",
        "Wild Geese"]
    
    var fixtures: [Fixture] = []
    
    var competition = ["Senior B Hurling Championship Group 2", "Adult Hurling League Division Two","Adult Football League Division One"]
    
    var  teamName = ["Senior Hurlers", "Inter Hurlers", "Junior Hurlers","Senior Footballers", "Inter Footballers", "Junior A Footballers", "Junior B Footballers", "Minor Hurlers", "Minor Footballers", "U16 Hurlers","U16 Footballers", "U15 Hurlers","U15 Footballers","U14 Hurlers","U14 Footballers"]

    
    override func viewDidLoad() {
        
        tableView.delegate = self
        //tableView.backgroundColor = UIColor.red
        for team in teamName {
        let randomIndex = Int(arc4random_uniform(UInt32(clubNames.count)))
        let randomCompetitionIndex = Int(arc4random_uniform(UInt32(competition.count)))
        let fixture = Fixture()
            fixture.create(teamName: team, awayTeam: clubNames[randomIndex], date: nil, time: nil, location: nil, competition: competition[randomCompetitionIndex])
        fixtures.append(fixture)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtures.count
    }
    
    // colour of header bar
    /*override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacing: CGFloat = 20
        return cellSpacing
    }*/
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixtureList") as! FixtureListCell
        
        //cell.backgroundColor = UIColor.red
        cell.layoutMargins = UIEdgeInsets.zero
        cell.contentView.layoutMargins.bottom = 20
        
        cell.teamName?.text = fixtures[indexPath.row].teamName
        cell.competition?.text = fixtures[indexPath.row].competition
        cell.opponents?.text = fixtures[indexPath.row].awayTeam
        
        
        let awayTeam = UIImage(named: fixtures[indexPath.row].awayTeam!)
        cell.rightClub?.image = awayTeam
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fixtureCell = fixtures[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        controller.fixture = fixtureCell
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }

}

class FixtureListCell: UITableViewCell {
    
    @IBOutlet weak var competition: UILabel!
    @IBOutlet weak var rightClub: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var opponents: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    

    }


class Fixture {

    var teamName: String?
    var awayTeam: String?
    var date:Date?
    var time:Date?
    var location: String?
    var competition: String?
    
    func create(teamName: String?, awayTeam: String?, date:Date?,time:Date?,location: String?, competition: String?){
        self.teamName = teamName
        self.awayTeam = awayTeam
        self.date = date
        self.time = time
        self.location = location
        self.competition = competition
        
    }
    
    
    
}

