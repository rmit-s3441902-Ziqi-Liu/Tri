//
//  FeaturedViewController.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 10/9/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 
    
    @IBOutlet weak var nowMovie: UICollectionView!
    
    @IBOutlet weak var comingMovie: UICollectionView!
    
    let nowMoiveArray = [#imageLiteral(resourceName: "spiderman"), #imageLiteral(resourceName: "blackpanther"), #imageLiteral(resourceName: "escape"), #imageLiteral(resourceName: "mile22")]

    let comingMoiveArray = [#imageLiteral(resourceName: "spiderman"), #imageLiteral(resourceName: "blackpanther"), #imageLiteral(resourceName: "escape"), #imageLiteral(resourceName: "mile22"),#imageLiteral(resourceName: "openingwide"), #imageLiteral(resourceName: "theequalizer")]
    let movieNameArray = [Movie.getAllMovie()[0].name,
                          Movie.getAllMovie()[1].name,
                          Movie.getAllMovie()[2].name,
                          Movie.getAllMovie()[3].name,
                          Movie.getAllMovie()[4].name,
                          Movie.getAllMovie()[5].name]
    
    let movieDesArray = [Movie.getAllMovie()[0].description,
                         Movie.getAllMovie()[1].description,
                         Movie.getAllMovie()[2].description,
                         Movie.getAllMovie()[3].description,
                         Movie.getAllMovie()[4].description,
                         Movie.getAllMovie()[5].description]
                         
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowMovie.delegate = self
        nowMovie.dataSource = self
        
        comingMovie.delegate = self
        comingMovie.dataSource = self
//
//        let layout = self.comingMovie.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsetsMake(0, 5, 5, 0)
//        layout.minimumInteritemSpacing = 5
//        layout.itemSize = CGSize(width: (self.comingMovie.frame.size.width-20)/2, height: self.comingMovie.frame.size.height/3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1;
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.nowMovie {
            return nowMoiveArray.count
        } else {
            return comingMoiveArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.nowMovie {
            let cell: NowCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowCollectionViewCell", for: indexPath) as! NowCollectionViewCell
            cell.now.image = nowMoiveArray[indexPath.row]
            return cell
        } else {
            let cell:ComingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingCollectionViewCell", for: indexPath) as! ComingCollectionViewCell
            cell.coming.image = comingMoiveArray[indexPath.row]
            cell.movieName.text = movieNameArray[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let bookingDetail = storyBoard.instantiateViewController(withIdentifier: "BookingLocation") as! BookingDetailViewController
        
        bookingDetail.getImage = comingMoiveArray[indexPath.row]
        bookingDetail.getName = movieNameArray[indexPath.row]
        bookingDetail.getDes = movieDesArray[indexPath.row]

        self.navigationController?.pushViewController(bookingDetail, animated: true)
    }
    

}
