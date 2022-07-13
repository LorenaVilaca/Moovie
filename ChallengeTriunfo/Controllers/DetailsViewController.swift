//
//  DetailsViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (movie)
        self.title = movie?.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
