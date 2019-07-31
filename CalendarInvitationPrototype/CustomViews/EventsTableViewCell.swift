//
//  EventsTableViewCell.swift
//  CalendarInvitationPrototype
//
//  Created by chander bhushan on 30/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCandidateName: UILabel!
    @IBOutlet weak var labelHigherQualification: UILabel!
    @IBOutlet weak var labelInterviewTime: UILabel!
    @IBOutlet weak var labelInterviewDate: UILabel!
    @IBOutlet weak var labelExperience: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
