

import UIKit
import FSCalendar
class CalendarEventsViewController: UIViewController {
    
    
    @IBOutlet weak var viewCalendar: FSCalendar!
    @IBOutlet weak var tableViewEvents: UITableView!
    var allEvents:[InvitationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allEvents = CommonData.shared.getAcceptedInvitations(forDate: Date())
        tableViewEvents.rowHeight = UITableView.automaticDimension
        tableViewEvents.tableFooterView = UIView()
        self.navigationItem.title = "Events"
        self.navigationController?.navigationBar.tintColor = .black
        tableViewEvents.dataSource = self
        tableViewEvents.delegate = self
        viewCalendar.dataSource = self
        viewCalendar.delegate = self
    }
}


extension CalendarEventsViewController : UITableViewDelegate {
    
}

extension CalendarEventsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(InvitationsNotificationTableViewCell.self, forCellReuseIdentifier: "InvitationsNotificationTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell") as! EventsTableViewCell
        cell.labelCandidateName.text = allEvents[indexPath.row].cadidateName
        cell.labelInterviewTime.text = allEvents[indexPath.row].interviewTime
        cell.labelInterviewDate.text = allEvents[indexPath.row].interviewDate
        cell.labelHigherQualification.text = allEvents[indexPath.row].higherQualification
        cell.labelExperience.text = allEvents[indexPath.row].experience
        
        return cell
    }
    
    
}


extension CalendarEventsViewController : FSCalendarDelegate{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        allEvents = CommonData.shared.getAcceptedInvitations(forDate: date)
        if allEvents.count > 0 {
        tableViewEvents.reloadData()
        tableViewEvents.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension CalendarEventsViewController : FSCalendarDataSource{
   
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
         return CommonData.shared.getAcceptedInvitations(forDate: date).count
    }
}

extension CalendarEventsViewController : FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        return UIColor.white
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        return UIColor.black
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderRadiusFor date: Date) -> CGFloat {
        return 0
    }
}
