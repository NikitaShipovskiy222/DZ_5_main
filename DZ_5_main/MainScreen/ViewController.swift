//
//  ViewController.swift
//  DZ_5_main
//
//  Created by Nikita Shipovskiy on 10/04/2024.
//

import UIKit
import CoreLocation



class ViewController: UIViewController {

    
    private var friends = Friends.mockDate()
    
    lazy var tabelView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "friend")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tabelView)
        title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
}


}



extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        friends.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        let friend = friends[indexPath.section][indexPath.row]
        config.text = friend.name
        config.textProperties.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        config.secondaryText = "\(friend.messnge.count) Cообщений"
        config.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        config.image = UIImage(named: friend.image)
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        
        
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print(friends[indexPath.section][indexPath.row].id)
        let profileVC = ProfileViewController()
        profileVC.textLabel = self.friends[indexPath.section][indexPath.row].name
        profileVC.image = self.friends[indexPath.section][indexPath.row].image
        navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(indexPath)
        friends[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "New"
        }
        return "Best"
    }
    
}



