//
//  VideoCell.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 20/10/24.
//

import UIKit

class VideoCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConfiguration()
        setTitleLabelConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set(video: Video)
    {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    func configureImageView() {
        videoImageView.layer.cornerRadius = 10 //setting corner radius to imageview
        videoImageView.clipsToBounds = true
        
    }
    func configureTitleLabel() {
        videoTitleLabel.numberOfLines = 0 //allows multiple lines
        videoTitleLabel.adjustsFontSizeToFitWidth = true //adjust font size to fit
        
    }
    
    func setImageConfiguration() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true //cnter y axis of the table view
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true //12 padding on the left
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true // height = 80
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true //width = height*16/9
    }
    
    func setTitleLabelConfiguration() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true //on the right of videoImageView and margin 20
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true //12 padding on the right
        
    }
    
    
}
