//
//  CommonData.swift
//  CalendarInvitationPrototype
//
//  Created by chander bhushan on 29/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import Foundation


class CommonData{
    var allInvitations = [InvitationModel]()
    static let shared  = CommonData()
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    private init() {
        
    }
    
    func loadData(){
        allInvitations.append(InvitationModel(id: 1,cadidateName: "Akansha", higherQualification: "BTECH", experience: "1 yrs", interviewTime: "9-11 AM", interviewDate: "30-07-2019", acceptanceState: .PENDING))
        allInvitations.append(InvitationModel(id: 2,cadidateName: "Chander", higherQualification: "MCA", experience: "1 yrs", interviewTime: "12-2 PM", interviewDate: "30-07-2019", acceptanceState: .PENDING))
        allInvitations.append(InvitationModel(id: 3,cadidateName: "Snehil", higherQualification: "BTECH", experience: "3 yrs", interviewTime: "2-4 PM", interviewDate: "30-07-2019", acceptanceState: .PENDING))
        allInvitations.append(InvitationModel(id: 4,cadidateName: "Prashant", higherQualification: "BTECH", experience: "3 yrs", interviewTime: "12-2 PM", interviewDate: "31-07-2019", acceptanceState: .PENDING))
        allInvitations.append(InvitationModel(id: 5,cadidateName: "Muskan", higherQualification: "BTECH", experience: "1 yrs", interviewTime: "2-4 PM", interviewDate: "01-08-2019", acceptanceState: .PENDING))
    }
    
    func approveInvitation(forId:Int){
       allInvitations = allInvitations.map { (invitationModel) -> InvitationModel in
        var invitationModel = invitationModel
            if invitationModel.id == forId{
                invitationModel.acceptanceState = .ACCEPTED
            }
            return invitationModel
        }
    }
    
    func rejectInvitation(forId:Int){
        allInvitations.removeAll { (invitaionModel) -> Bool in
            return invitaionModel.id == forId
        }
    }
    
    
    func getAcceptedInvitations(forDate:Date)->[InvitationModel]{
        return allInvitations.filter { (invitationModel) -> Bool in
                    let dateString = self.dateFormatter2.string(from: forDate)
            return invitationModel.acceptanceState == AcceptenceState.ACCEPTED ? invitationModel.interviewDate == dateString : false
        }
        
    }
    
    func getPendingInvitations()->[InvitationModel]{
            return CommonData.shared.allInvitations.filter({ (invitationModel) -> Bool in
                return invitationModel.acceptanceState == AcceptenceState.PENDING
            })
    }
}
