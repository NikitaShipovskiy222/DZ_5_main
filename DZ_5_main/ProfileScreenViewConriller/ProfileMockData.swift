//
//  ProfileMockData.swift
//  DZ_5_main
//
//  Created by Nikita Shipovskiy on 10/04/2024.
//

import Foundation



struct Messenge: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var messenge: String
    var image: String
    
    
  static  func mockeDataPrifile() -> [Messenge]{
        
        [
            Messenge(name: "Пашок Филипенко", messenge: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod", image: "nft1"),
            Messenge(name: "Давыдова Филлип", messenge: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod", image: "nft2"),
            Messenge(name: "Итон Ширман", messenge: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod", image: "nft3"),
            
        ]
    }
}
