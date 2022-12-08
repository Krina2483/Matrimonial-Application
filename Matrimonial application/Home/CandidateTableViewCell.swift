//
//  CandidateViewCellTableViewCell.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 22/11/22.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    @IBOutlet weak var candidateImg: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet weak var candidateInfo: UILabel!
    @IBOutlet weak var candidateEducation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

}
