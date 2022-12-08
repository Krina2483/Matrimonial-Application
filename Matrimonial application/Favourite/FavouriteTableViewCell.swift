//
//  Favourite.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 24/11/22.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var CandidateImage: UIImageView!
    @IBOutlet weak var CandidateName: UILabel!
    @IBOutlet weak var CandidateDateOfBirth: UILabel!
    @IBOutlet weak var CandidateEducation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        CandidateImage.layer.masksToBounds = true
        CandidateImage.layer.cornerRadius = CandidateImage.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
