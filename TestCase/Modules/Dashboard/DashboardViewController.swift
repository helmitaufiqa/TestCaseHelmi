//
//  DashboardViewController.swift
//  TestCase
//
//  Created by helmi taufiq alhakim on 13/06/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    private var sectionModel = Section.FetchSection()
    private var carouselModel = CarouselModel.FetchCarousel()
    
    private var timer = Timer()
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageController()
        setupCollectionView()
        setupTable()
    }
    
    // MARK: - PAGE CONTROLLER SETUP
    private func setupPageController() {
        pageController.numberOfPages = carouselModel.count
        pageController.currentPage = 0
        pageController.currentPageIndicatorTintColor = .orange
        pageController.pageIndicatorTintColor = .lightGray
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                         target: self,
                                         selector: #selector(self.changePagesHandler),
                                         userInfo: nil,
                                         repeats: true )
        }
    }
    
    // MARK: - COLLECTION VIEW SETUP
    private func setupCollectionView() {
        let nib = UINib(nibName: "CarouselCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CarouselCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - TABLE VIEW SETUP
    private func setupTable() {
        let headerNib = UINib(nibName: "TimelineSectionTableViewCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "SectionCell")
        
        let itemNib = UINib(nibName: "TimelineItemTableViewCell", bundle: nil)
        tableView.register(itemNib, forCellReuseIdentifier: "ItemCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - CHANGE CAROUSEL PAGES AUTOMATICALLY SETUP
    @objc
    private func changePagesHandler() {
        if counter < carouselModel.count {
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index,
                                        at: .centeredHorizontally,
                                        animated: true)
            pageController.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index,
                                        at: .centeredHorizontally,
                                        animated: false)
            pageController.currentPage = counter
            counter = 1
        }
    }
    
    // MARK: - ACTION SELECTOR TOGGLE SETUP
    @objc
    private func hideSection(sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            let section = sender.tag
            
            self.sectionModel[section].isCollapsed = !self.sectionModel[section].isCollapsed
            
            self.tableView.reloadData()
        }
    }
}


extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - TABLEVIEW CELLS SETUP
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sectionModel[section].isCollapsed {
            return 0
        }
        
        return sectionModel[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? TimelineItemTableViewCell else { return UITableViewCell() }
        
        let items = sectionModel[indexPath.section].cells[indexPath.row]
        cell.configure(title: items.certificateName, courseTitle: items.courseName, date: items.date)
        
        return cell
    }
    
    // MARK: - TABLEVIEW SECTION SETUP
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModel.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! TimelineSectionTableViewCell
        
        headerView.configure(isCollapsed: !sectionModel[section].isCollapsed)
        headerView.yearButton.setTitle(sectionModel[section].title, for: .normal)
        headerView.yearButton.tag = section
        headerView.yearButton.addTarget(self,
                                        action: #selector(hideSection(sender:)),
                                        for: .touchUpInside)
        
        return headerView
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - COLLECTION VIEW CELLS SETUP
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCollectionViewCell
        
        cell?.imageView.image = carouselModel[indexPath.row].image
        
        return cell ?? UICollectionViewCell()
    }
    
    // MARK: - COLLECTION VIEW PAGING INDICATOR SETUP
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.row
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - COLLECTION VIEW LAYOUT CELLS SETUP
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
