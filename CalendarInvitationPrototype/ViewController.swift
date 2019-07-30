//
//  ViewController.swift
//  CalendarInvitationPrototype
//
//  Created by chander bhushan on 29/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var allInvitations:[InvitationModel] = []
    
    @IBOutlet weak var tableViewInvitations: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        allInvitations = CommonData.shared.getPendingInvitations()
        tableViewInvitations.rowHeight = UITableView.automaticDimension
        self.navigationItem.title = "Notifications"
        self.tableViewInvitations.dataSource = self
        self.tableViewInvitations.delegate = self
        self.tableViewInvitations.tableFooterView = UIView()
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "calendar"), style: .done, target: self, action: #selector(clickedBtnCalendar))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(refreshDataForNotification), name: NSNotification.Name.eventNotification, object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func viewDidDisappear(_ animated: Bool) {
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func refreshDataForNotification(){
        allInvitations = CommonData.shared.getPendingInvitations()
        tableViewInvitations.reloadData()
    }
    
    @objc func clickedBtnCalendar(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CalendarEventsViewController") as! CalendarEventsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInvitations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationsNotificationTableViewCell") as! InvitationsNotificationTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.labelCandidateName.text = allInvitations[indexPath.row].cadidateName
        cell.labelHigherQualification.text = allInvitations[indexPath.row].higherQualification
        cell.labelExperience.text = allInvitations[indexPath.row].experience
        cell.labelInterviewTime.text = allInvitations[indexPath.row].interviewTime
        cell.labelInterviewDate.text = allInvitations[indexPath.row].interviewDate
        cell.invitationId = allInvitations[indexPath.row].id
        cell.delegate = self
        return cell
    }
    
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController : InvitationsNotificationTableViewCellDelegate {
    func clickedBtnInvitationAccept(invitationId:Int) {
        CommonData.shared.approveInvitation(forId: invitationId)
        self.allInvitations = CommonData.shared.getPendingInvitations()
        self.tableViewInvitations.reloadData()
    }
    
    func clickedBtnInvitationReject(invitationId:Int) {
        CommonData.shared.rejectInvitation(forId: invitationId)
        self.allInvitations = CommonData.shared.getPendingInvitations()
        self.tableViewInvitations.reloadData()
    }
}
