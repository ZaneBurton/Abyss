//
//  DetailViewController.swift
//  Abyss
//
//  Created by Zane Burton on 3/18/19.
//  Copyright © 2019 Zane Burton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var formatLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var networkLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func configureView() {

        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.name
            }
            if let label = titleLbl {
                label.text = detail.name
            }
            if let label = descriptionLbl {
                label.text = detail.description
            }
            //titleLbl.text = detail.name
            //title = detail.name
            if let label = yearLbl {
                if let ended = detail.yearEnd {
                    label.text = "\(detail.yearStart) - \(ended)"
                } else {
                    label.text = detail.yearStart
                }
            }
            if let label = formatLbl {
                label.text = detail.format
            }
            if let label = episodeLbl {
                if let countEpisodes = detail.episodes {
                    if countEpisodes > 1 {
                        label.text = "\(countEpisodes) Episodes"
                    } else {
                        label.text = "\(countEpisodes) Episodes"
                    }
                } else {
                    label.text = ""
                }
            }
            if let label = networkLbl {
                if let network = detail.network {
                    label.text = network
                } else if let studio = detail.studio {
                    label.text = studio
                }
            }
            if let imageView = profilePic {
                let url = URL(string: detail.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
            if let label = summaryLbl {
                label.text = detail.summary
            }
        }
                

        //titleLbl.text = detailItem?.name
        // Update the user interface for the detail item.
       /*if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }*/
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: Entry? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

