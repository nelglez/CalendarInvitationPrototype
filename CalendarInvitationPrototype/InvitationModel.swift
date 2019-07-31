//
//  InvitationModel.swift
//  CalendarInvitationPrototype
//
//  Created by chander bhushan on 29/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import Foundation

enum AcceptenceState {
    case ACCEPTED
    case REJECTED
    case PENDING
}

struct InvitationModel{
    var id:Int?
    var cadidateName:String?
    var higherQualification:String?
    var experience:String?
    var interviewTime:String?
    var interviewDate:String?
    var acceptanceState:AcceptenceState?
    
    init(id:Int,cadidateName:String,higherQualification:String,experience:String,interviewTime:String,interviewDate:String,acceptanceState:AcceptenceState){
        self.id   = id
        self.cadidateName   = cadidateName
        self.higherQualification   = higherQualification
        self.experience   = experience
        self.acceptanceState   = acceptanceState
        self.interviewTime = interviewTime
        self.interviewDate = interviewDate
    }
    
    init(dict:[AnyHashable:Any],acceptanceState:AcceptenceState? = AcceptenceState.PENDING){
        id              = Int(dict["id"] as? String ?? "0")
        cadidateName    = dict["cadidateName"] as? String
        higherQualification =   dict["higherQualification"] as? String
        experience   =  dict["experience"] as? String
        interviewDate   =   dict["interviewDate"] as? String
        interviewTime   =   dict["interviewTime"] as? String
        self.acceptanceState =   acceptanceState
    }
}


