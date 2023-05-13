//
//  RouteCollectionViewCell.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 13/5/23.
//

import UIKit

class RouteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var lblDriver: UILabel!
    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblStartName: UILabel!
    @IBOutlet weak var lblFinish: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblFihishTime: UILabel!
    @IBOutlet weak var lblStops: UILabel!
    
    
    @IBOutlet weak var lblFinishName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with model: RouteModel) {
        innerView.layer.cornerRadius = 8
        innerView.layer.borderWidth = 1
        innerView.layer.borderColor = UIColor.lightGray.cgColor
        
        lblDriver.text = "Driver:"
        lblDriverName.text = model.driverName
        lblStart.text = "From:"
        lblStartName.text = model.origin.address
        lblFinish.text = "To:"
        lblFinishName.text = model.destination.address
        lblStartTime.text = model.startTimeFormatted()
        lblFihishTime.text = model.endTimeFormatted()
        lblStops.text = "\(model.stops.count) Stops"
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                innerView.layer.borderColor = UIColor.green.cgColor
            } else {
                innerView.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }

}
