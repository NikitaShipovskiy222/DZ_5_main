//
//  mockDataVC.swift
//  DZ_5_main
//
//  Created by Nikita Shipovskiy on 10/04/2024.
//

import Foundation


struct Friends: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var messnge: [String]
    var image: String
        
    static func mockDate() -> [[Friends]] {
    [
        [
        Friends(name: "Иван Иванов", messnge: ["","","",""], image: "1"),
        Friends(name: "Паша Марченок", messnge: ["","","","","","",""], image: "2"),
        Friends(name: "Илья Филипенко", messnge: ["","","","","","","","",""], image: "3")
        ],
        [
        Friends(name: "Егор Бельман", messnge: ["","","",""], image: "4"),
        Friends(name: "Миша Рыбкин", messnge: ["","","","","","",""], image: "5"),
        Friends(name: "Игорь Белый", messnge: ["","","","","","","","",""], image: "6")
        ]
    ]
        
    }
}
