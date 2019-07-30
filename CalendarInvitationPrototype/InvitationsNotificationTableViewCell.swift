//
//  InvitationsNotificationTableViewCell.swift
//  CalendarInvitationPrototype
//
//  Created by chander bhushan on 29/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import UIKit

protocol InvitationsNotificationTableViewCellDelegate {
    func clickedBtnInvitationAccept(invitationId:Int)
    func clickedBtnInvitationReject(invitationId:Int)
}

class InvitationsNotificationTableViewCell: UITableViewCell {
    
    var delegate:InvitationsNotificationTableViewCellDelegate?
    
    @IBOutlet weak var btnInvitationReject: UIButton!
    @IBOutlet weak var btnInvitationAccept: UIButton!
    @IBOutlet weak var labelCandidateName: UILabel!
    @IBOutlet weak var labelHigherQualification: UILabel!
    @IBOutlet weak var labelInterviewTime: UILabel!
    @IBOutlet weak var labelInterviewDate: UILabel!
    @IBOutlet weak var labelExperience: UILabel!
    
    var invitationId:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnInvitationReject.layer.cornerRadius = 5
        btnInvitationAccept.layer.cornerRadius = 5
    }
    
    
    @IBAction func clickedBtnInvitationAccept(_ sender: Any) {
        delegate?.clickedBtnInvitationAccept(invitationId: self.invitationId!)
    }
    
    @IBAction func clickedBtnInvitationReject(_ sender: Any) {
        delegate?.clickedBtnInvitationReject(invitationId: self.invitationId!)
    }
    
    
}
