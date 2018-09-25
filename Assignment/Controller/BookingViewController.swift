//
//  BookingViewController.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 10/9/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let movie =  [#imageLiteral(resourceName: "spiderman"), #imageLiteral(resourceName: "blackpanther"),#imageLiteral(resourceName: "escape"),#imageLiteral(resourceName: "mile22"),#imageLiteral(resourceName: "openingwide"),#imageLiteral(resourceName: "theequalizer"),#imageLiteral(resourceName: "avenger")]
    let movieName = [Movie.getAllMovie()[0].name,
                     Movie.getAllMovie()[1].name,
                     Movie.getAllMovie()[2].name,
                     Movie.getAllMovie()[3].name,
                     Movie.getAllMovie()[4].name,
                     Movie.getAllMovie()[5].name,
                     Movie.getAllMovie()[6].name]
    let movieDesArray = [Movie.getAllMovie()[0].description,
                        Movie.getAllMovie()[1].description,
                        Movie.getAllMovie()[2].description,
                        Movie.getAllMovie()[3].description,
                        Movie.getAllMovie()[4].description,
                        Movie.getAllMovie()[5].description,
                        Movie.getAllMovie()[6].description]



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
        cell.moviePoster.image = movie[indexPath.row]
        cell.movieName.text = movieName[indexPath.row]
        cell.movieDes.text = movieDesArray[indexPath.row]
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let bookingDetail = storyBoard.instantiateViewController(withIdentifier: "BookingLocation") as! BookingDetailViewController
        
        bookingDetail.getImage = movie[indexPath.row]
        bookingDetail.getName = movieName[indexPath.row]
        bookingDetail.getDes = movieDesArray[indexPath.row]
        self.navigationController?.pushViewController(bookingDetail, animated: true)
    }
    

}
