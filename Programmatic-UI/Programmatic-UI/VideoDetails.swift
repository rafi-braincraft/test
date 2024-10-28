//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 21/10/24.
//

import UIKit

protocol VideoDetailDelegate: AnyObject { //------------delegate
    func didSelectVideo(_ video: Video)
}

class VideoDetails: UIViewController {
    
    var video: Video?
    weak var delegate: VideoDetailDelegate? //----------delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = video?.title
        view.backgroundColor = .systemBackground
        var text = ""
        text += video?.title ?? "No title"
        text += " video details"
        video?.title = text
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.didSelectVideo(video!)
    }
    
    func configureVideo(video: Video)
    {
        self.video = video
    }
}
