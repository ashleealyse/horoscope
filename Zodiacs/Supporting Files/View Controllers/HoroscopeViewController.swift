//
//  HoroscopeViewController.swift
//  Zodiacs
//
//  Created by Ashlee Krammer on 12/11/17.
//  Copyright © 2017 Ashlee Krammer. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var horoscopeDetailedScroll: UITextView!
    
    
    
    //Variables
    
    var horoscope: Horoscope?
    var defaults = UserDefaults.standard
    var yourHoroscope = ""
    let nameKey = "nameKey"
    let birthdayKey = "dateKey"
    var sign = ""
    var day = "today"
    var currentDay = ""
    var currentSign = ""
  
    //Buttons
    
    @IBAction func yesterdayButton(_ sender: Any) {
        currentDay = "yesterday"
        loadHoroscope()
    }
    @IBAction func todayButton(_ sender: Any) {
        currentDay = "today"
        loadHoroscope()
    }
    @IBAction func tomorrowButton(_ sender: Any) {
        currentDay = "tomorrow"
        loadHoroscope()
    }
    
    
    
    
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
//        if defaults.value(forKey: self.nameKey) == nil || defaults.value(forKey: self.birthdayKey) == nil {
//            signLabel.text = "Welcome"
//            horoscopeDetailedScroll.text =
//            """
//            Please navigate to the settings page to enter your name and birthdate and see what the stars have in store for you my dear...
//            """
//        loadHoroscope()
//        } else {
        loadHoroscope()
//        }

    }
    
    
    
    
    
    func generateSign(date: String) {
  
    }
    
    
    
    
    func loadHoroscope() {
        
       sign = "gemini"
        day = currentDay

        let urlStr = "https://aztro.herokuapp.com/?sign=\(sign)&day=\(day)"
        
        let completion: (Horoscope) -> Void = {(onlineHoroscope: Horoscope) in
            self.horoscope = onlineHoroscope
            self.setHoroscopeScreen()
        }
        
        
        HoroscopeAPIClient.manager.getHoroscope(from: urlStr, completionHandler: completion, errorHandler: {print($0)})

    }
    
    
    
    
    
    
    
    
    
    
    
    func setHoroscopeScreen() {
        
        var date = ""
        var luckyTime = ""
        var luckyNumber = "'"
        var color = ""
        var mood = ""
        var compatability = ""
        var description = ""
        
        signLabel.text = "Your Sign Here"
        
        if horoscope != nil {
            date = (horoscope?.current_date)!
            luckyTime = (horoscope?.lucky_time)!
            luckyNumber = (horoscope?.lucky_number)!
            color = (horoscope?.color)!
            mood = (horoscope?.mood)!
            compatability = (horoscope?.compatibility)!
            description = (horoscope?.description)!
        }

        
        yourHoroscope =
        """
        Todays Date:
        \(date)
        
        Lucky Time:
        \(luckyTime)
        
        Lucky Number:
        \(luckyNumber)
        
        Your Color:
        \(color)
        
        Mood:
        \(mood)
        
        Compatability:
        \(compatability)
        
        What's in store for \(sign.capitalized):
        \(self.defaults.value(forKey: self.nameKey)!), \(description)
        
        """
        signLabel.text = sign.capitalized
        horoscopeDetailedScroll.text = yourHoroscope
        
    }
    

    enum HoroscopeSign {
        case aries
        case taurus
        case gemini
        case cancer
        case leo
        case virgo
        case libra
        case scorpio
        case sagitarius
        case capricorn
        case aquarius
        case pisces
    }
    
    
}
