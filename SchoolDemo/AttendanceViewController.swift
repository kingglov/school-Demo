//
//  AttendanceViewController.swift
//  SchoolDemo
//
//  Created by Madhukar on 07/03/2020.
//  Copyright © 2020 sailaja. All rights reserved.
//

import UIKit
import VACalendar
class AttendanceViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var showCalendarButton: UIButton!
    @IBOutlet weak var caledarView: UIView!
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd LLLL"
        return formatter
    }()
    
    private lazy var calendarPopup: CalendarPopUpView = {
        let frame = CGRect(
            x: 0,
            y: 0,
            width: caledarView.frame.width ,
            height: 365
        )
        let calendar = CalendarPopUpView(frame: frame)
            calendar.backgroundColor = .none
            calendar.layer.shadowColor = UIColor.black.cgColor
            calendar.layer.shadowOpacity = 0.4
            calendar.layer.shadowOffset = .zero
            calendar.layer.shadowRadius = 5
        
            calendar.didSelectDay = { [weak self] date in
            
        }
        
        return calendar
    }()
    let defaultCalendar: Calendar = {
         var calendar = Calendar.current
         calendar.firstWeekday = 1
         calendar.timeZone = TimeZone(secondsFromGMT: 0)!
         return calendar
     }()
     var calendarView: VACalendarView!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.isHidden = false
        view.backgroundColor = UIColor(
            red: 240 / 255,
            green: 240 / 255,
            blue: 240 / 255,
            alpha: 1.0
        )
         let calendar = VACalendar(calendar: defaultCalendar)
                calendarView = VACalendarView(frame: .zero, calendar: calendar)
                calendarView.showDaysOut = true
                calendarView.selectionStyle = .multi
        calendarView.monthDelegate = calendarPopup.monthHeaderView
                calendarView.dayViewAppearanceDelegate = self
                calendarView.monthViewAppearanceDelegate = self
                calendarView.calendarDelegate = self
                calendarView.scrollDirection = .horizontal
                calendarView.setSupplementaries([
                    (Date().addingTimeInterval(-(60 * 60 * 70)), [VADaySupplementary.bottomDots([.red, .magenta])]),
                    (Date().addingTimeInterval((60 * 60 * 110)), [VADaySupplementary.bottomDots([.red])]),
                    (Date().addingTimeInterval((60 * 60 * 370)), [VADaySupplementary.bottomDots([.blue, .darkGray])]),
                    (Date().addingTimeInterval((60 * 60 * 430)), [VADaySupplementary.bottomDots([.orange, .purple, .cyan])])
                    ])
        caledarView.addSubview(calendarView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if calendarView.frame == .zero {
            calendarView.frame = CGRect(
                x: caledarView.frame.minX,
                y: caledarView.frame.minY,
                width: view.frame.width,
                height: caledarView.frame.height
            )
            calendarView.setup()
        }
    }
    @IBAction func didTapSelectDay(_ sender: UIButton) {
    }
    
    
    
}
extension AttendanceViewController: VAMonthHeaderViewDelegate {
    
    func didTapNextMonth() {
        calendarView.nextMonth()
    }
    
    func didTapPreviousMonth() {
        calendarView.previousMonth()
    }
    
}

extension AttendanceViewController: VAMonthViewAppearanceDelegate {
    
    func leftInset() -> CGFloat {
        return 10.0
    }
    
    func rightInset() -> CGFloat {
        return 10.0
    }
    
    func verticalMonthTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    func verticalMonthTitleColor() -> UIColor {
        return .black
    }
    
    func verticalCurrentMonthTitleColor() -> UIColor {
        return .red
    }
    
}

extension AttendanceViewController: VADayViewAppearanceDelegate {
    
    func textColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
        case .selected:
            return .white
        case .unavailable:
            return .lightGray
        default:
            return .black
        }
    }
    
    func textBackgroundColor(for state: VADayState) -> UIColor {
        switch state {
        case .selected:
            return .red
        default:
            return .clear
        }
    }
    
    func shape() -> VADayShape {
        return .circle
    }
    
    func dotBottomVerticalOffset(for state: VADayState) -> CGFloat {
        switch state {
        case .selected:
            return 2
        default:
            return -7
        }
    }
    
}

extension AttendanceViewController: VACalendarViewDelegate {
    
    func selectedDates(_ dates: [Date]) {
        calendarView.startDate = dates.last ?? Date()
        print(dates)
    }
    
}
