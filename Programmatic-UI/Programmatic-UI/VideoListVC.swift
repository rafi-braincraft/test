//
//  SecondScreen.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 20/10/24.
//

import UIKit


class VideoListVC: UIViewController, VideoDetailDelegate{ //----------delegate
    
    var tableView = UITableView() //initializing table view
    var videos: [Video] = []
    let detailVC = VideoDetails()
    var indV = 0
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BC Video List"
        videos = fetchData()
        configureTableView()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        detailVC.delegate = self
    }
    func configureTableView() {
        view.addSubview(tableView) //drag and drop the table view
        
        //set delegates
        setTableDelagate()
        
        //set row height
        tableView.rowHeight = 100
        
        
        //register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        
        //set constraints
        tableView.pin(to: view) //pin it with the top and bottom  of the vie
    }
    
    func setTableDelagate() {
        tableView.delegate = self //need to extend videoListVC
        tableView.dataSource = self
    }
}
extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    //how many cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    //what  cell I am showing
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell //dequeue reuseable cell is called every time a cell comes on the screen
        
        let video = videos[indexPath.row] //picking a video in a time
        cell.set(video: video) //setting the video to the video celll
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        let detailVC = VideoDetails()
        detailVC.configureVideo(video: video)
        detailVC.delegate = self //---------delegate
        indV = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

extension VideoListVC {
    func fetchData() -> [Video]{
        let video1 = Video(image: Images.noStoryboard, title: "No StoryBoard")
        let video2 = Video(image: Images.ninety, title: "The 90/90 Rule")
        let video3 = Video(image: Images.patreon, title: "Patreon for SwiftUI")
        let video4 = Video(image: Images.softSkills, title: "Soft Skills")
        
        let video5 = Video(image: Images.noStoryboard, title: "No StoryBoard extended extended extended")
        let video6 = Video(image: Images.ninety, title: "The 90/90 Rule")
        let video7 = Video(image: Images.patreon, title: "Patreon for SwiftUI")
        let video8 = Video(image: Images.softSkills, title: "Soft Skills")
        
        let video9 = Video(image: Images.noStoryboard, title: "No StoryBoard extended extended extended")
        let video10 = Video(image: Images.ninety, title: "The 90/90 Rule")
        let video11 = Video(image: Images.patreon, title: "Patreon for SwiftUI")
        let video12 = Video(image: Images.softSkills, title: "Soft Skills")


        
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10, video11, video12]
        
    }
    
    func didSelectVideo(_ video: Video) { //----------delegate
        // Handle the selected video here if needed
        
        videos[indV] = video // Update the video in the list
        tableView.reloadData() // Reload the table view to reflect the changes
        
    }
}


