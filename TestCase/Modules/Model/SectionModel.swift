//
//  SectionModel.swift
//  TestCase
//
//  Created by helmi taufiq alhakim on 13/06/21.
//

import Foundation

// MARK: - DATA SETUP FOR TIMELINE
class Section {
    var isCollapsed: Bool
    var title: String
    var cells: [Cells]
    
    init(isCollapsed: Bool , title: String , cells : [Cells]  ) {
        self.isCollapsed = isCollapsed
        self.title = title
        self.cells = cells
    }
    
    static func FetchSection () -> [Section] {
        
        return [
            Section(
                isCollapsed: true,
                title: "2000",
                cells: [
                    Cells(
                        certificateName: "IOS Developer Academy",
                        courseName: "Swift 5 Bootcamp",
                        date: "2 May 2000"
                    ),
                    Cells(
                        certificateName: "Angela Yu Bootcamp 20201",
                        courseName: "The Complete 2021 Web Development Bootcamp",
                        date: "23 January 2000"
                    ),
                    Cells(
                        certificateName: "IOS Developer Academy",
                        courseName: "Swift 5 Bootcamp",
                        date: "14 March 2000"
                    ),
                ]),
            Section(
                isCollapsed: false,
                title: "2001",
                cells: [
                    Cells(
                        certificateName: "Microsoft Excel Certificate",
                        courseName: "Microsoft Excel Course for Beginner",
                        date: "2 May 2001"
                    ),
                ]),
            Section(
                isCollapsed: false,
                title: "2002",
                cells: [
                    Cells(
                        certificateName: "IOS Developer Academy",
                        courseName: "Swift 5 Bootcamp",
                        date: "14 March 2002"
                    ),
                    Cells(
                        certificateName: "IOS Developer Academy",
                        courseName: "Swift 5 Bootcamp",
                        date: "2 May 2002"
                    ),
                ]),
            Section(
                isCollapsed: false,
                title: "2003",
                cells: [
                    Cells(
                        certificateName: "Angela Yu Bootcamp 20201",
                        courseName: "The Complete 2021 Web Development Bootcamp",
                        date: "23 January 2003"
                    ),
                    Cells(
                        certificateName: "IOS Developer Academy",
                        courseName: "Swift 5 Bootcamp",
                        date: "14 March 2003"
                    ),
                ])
        ]
    }
}
