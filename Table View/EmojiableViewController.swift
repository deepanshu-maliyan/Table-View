//
//  EmojiableViewController.swift
//  Table View
//
//  Created by Deepanshu Maliyan on 08/09/1946 Saka.
//

import UIKit

class EmojiableViewController: UITableViewController {
    
    
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue 'z's.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
        Emoji(symbol: "😂", name: "Face with Tears of Joy", description: "A laughing face with tears streaming down.", usage: "hysterical laughter, joy."),
        Emoji(symbol: "😢", name: "Crying Face", description: "A face with a tear rolling down the cheek.", usage: "sadness, disappointment."),
        Emoji(symbol: "🤔", name: "Thinking Face", description: "A face with a hand on its chin, deep in thought.", usage: "thinking, wondering."),
        Emoji(symbol: "😎", name: "Smiling Face with Sunglasses", description: "A cool, confident smiley wearing sunglasses.", usage: "coolness, confidence."),
        Emoji(symbol: "😴", name: "Sleeping Face", description: "A face with closed eyes and a snot bubble.", usage: "sleep, boredom."),
        Emoji(symbol: "🌟", name: "Glowing Star", description: "A single shining star.", usage: "special, brilliance, inspiration."),
        Emoji(symbol: "🔥", name: "Fire", description: "Flames of fire.", usage: "hot, lit, impressive."),
        Emoji(symbol: "🌈", name: "Rainbow", description: "A colorful arc in the sky.", usage: "hope, positivity."),
        Emoji(symbol: "☕️", name: "Hot Beverage", description: "A cup of steaming coffee or tea.", usage: "morning, coffee time, relaxation."),
        Emoji(symbol: "🎉", name: "Party Popper", description: "A burst of confetti and streamers.", usage: "celebration, party."),
        Emoji(symbol: "🥳", name: "Partying Face", description: "A face with a party hat and a noisemaker.", usage: "party, celebration."),
        Emoji(symbol: "🤯", name: "Exploding Head", description: "A face with the top of its head blown off.", usage: "mind-blowing, shock."),
        Emoji(symbol: "🙌", name: "Raising Hands", description: "Two hands raised in celebration.", usage: "praise, accomplishment."),
        Emoji(symbol: "🥺", name: "Pleading Face", description: "A face with big, puppy-dog eyes.", usage: "begging, pleading."),
        Emoji(symbol: "🌍", name: "Earth Globe Europe-Africa", description: "The planet Earth showing Europe and Africa.", usage: "world, global."),
        Emoji(symbol: "🌞", name: "Sun with Face", description: "A smiling sun.", usage: "sunny, happy weather."),
        Emoji(symbol: "🪐", name: "Ringed Planet", description: "A planet with a ring, like Saturn.", usage: "space, planet."),
        Emoji(symbol: "🎵", name: "Musical Note", description: "A single music note.", usage: "music, song."),
        Emoji(symbol: "🎂", name: "Birthday Cake", description: "A cake with lit candles.", usage: "birthday, celebration."),
        Emoji(symbol: "⚡️", name: "High Voltage", description: "A lightning bolt.", usage: "electricity, power, energy."),
        Emoji(symbol: "🚀", name: "Rocket", description: "A rocket blasting off.", usage: "space, ambition, progress."),
        Emoji(symbol: "📸", name: "Camera", description: "A camera with a flash.", usage: "photography, memories."),
        Emoji(symbol: "❤️", name: "Red Heart", description: "A classic red heart.", usage: "love, affection."),
        Emoji(symbol: "🛌", name: "Person in Bed", description: "A person sleeping in a bed.", usage: "rest, sleep."),
        Emoji(symbol: "🌙", name: "Crescent Moon", description: "A crescent-shaped moon.", usage: "night, sleep.")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return emojis.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojisCell", for: indexPath)
        
        /*configure the cell*/
        let emoji = emojis[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(emoji.symbol) - \(emoji.name)"
        content.secondaryText = emoji.description
        cell.showsReorderControl = true
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row) // Insert the moved emoji at the new position
        tableView.reloadData() // Reload the table to reflect the changes (optional, depending on your needs)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emojiSymbol = emojis[indexPath.row]
        print("\(emojiSymbol.symbol) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from the data source
            emojis.remove(at: indexPath.row)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
     
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//             Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    


