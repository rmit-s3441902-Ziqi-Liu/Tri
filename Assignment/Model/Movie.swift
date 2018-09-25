//
//  Movie.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/15.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class Movie {
    var name: String
    var description: String
    static var movies = [Movie]()

    

    
    
    init(name:String, description:String) {
        self.name = name
        self.description = description
    }
    
    
    static func getAllMovie() -> [Movie] {
        let avengerDes : String = "Iron Man, Thor, the Hulk and the rest of the Avenge rs unite to battle their most powerful enemy yet -- the evil Thanos. On a mission to collect all six Infinity Stones, Thanos plans to use the artifacts to inflict his twisted will on reality. "

        
        let blackpancerDes: String = "After the death of his father, T'Challa returns home to the African nation of Wakanda to take his rightful place as king. When a powerful enemy suddenly reappears. "
        
        let escapeDes : String = "Ray Breslin manages an elite team of security specialists trained in the art of breaking people out of the world's most impenetrable prisons. "
        
        let openingwideDes: String = "Previously thought to be extinct, a massive creature attacks a deep-sea submersible, leaving it disabled and trapping the crew at the bottom of the Pacific. "
        

        
        let spidermanDes: String = "Previously thought to be extinct, a massive creature attacks a deep-sea submersible, leaving it disabled and trapping the crew at the bottom of the Pacific. With time running out"
        
        let theequalizerDes: String = "If you have a problem and there is nowhere else to turn, the mysterious and elusive Robert McCall will deliver the vigilante justice you seek. "
        
        let mileDes: String = "CIA operative James Silva leads a small but lethal paramilitary team on an urgent and dangerous mission. They must transport a foreign intelligence asset from an American embassy in Southeast Asia to an airfield for extraction -- a distance of 22 miles.  "

        
        let spider = Movie (name: "Spider Man", description: spidermanDes)
        let panther = Movie (name:"Black Panther", description: blackpancerDes)
        let escape = Movie (name: "Escape Plan", description: escapeDes)
        let mile = Movie(name: "Mile 22", description: mileDes)
        let opening = Movie (name: "Opening Wide", description: openingwideDes)
        let equalizer = Movie(name: "The Equalizer", description: theequalizerDes)
        let avenger3 = Movie (name: "Avenger", description: avengerDes)
        
        movies.append(spider)
        movies.append(panther)
        movies.append(escape)
        movies.append(mile)
        movies.append(opening)
        movies.append(equalizer)
        movies.append(avenger3)

        
        return movies
    }
    
    
}
