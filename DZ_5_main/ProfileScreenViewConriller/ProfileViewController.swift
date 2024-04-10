//
//  ProfileViewController.swift
//  DZ_5_main
//
//  Created by Nikita Shipovskiy on 10/04/2024.
//

import UIKit



class ProfileViewController: UIViewController {

    private var messange = Messenge.mockeDataPrifile()

    
    var image = ""
     lazy var imageProfile: UIImageView = {
         $0.image = UIImage(named: image)
        return $0
    }(UIImageView(frame: CGRect(x: 130, y: 114, width: 136, height: 136)))
    
    
    var textLabel = ""
    lazy var nameLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = textLabel
        
        return $0
    }(UILabel(frame: CGRect(x: 20, y: 277, width: view.frame.width - 40, height: 24)))
    
    
    lazy var tabelViewMessenge: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "messenge")
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        return $0
    }(UITableView(frame: CGRect(x: 20, y: 418, width: view.frame.width - 40, height: 280), style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tabelViewMessenge)
        view.addSubview(imageProfile)
        view.addSubview(nameLabel)
        
        
    }


}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messange.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelViewMessenge.dequeueReusableCell(withIdentifier: "messenge", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        let messange = messange[indexPath.row]
        
        config.text = messange.name
        config.textProperties.font = UIFont.systemFont(ofSize: 16, weight: .light)
        config.secondaryText = messange.messenge
        config.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .light)
        config.image = UIImage(named: messange.image)
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        
        
        cell.contentConfiguration = config
        return cell
    }
    
    
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "MESSANGE"
    }
    
}


