//
//  StopView.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 14/5/23.
//

import UIKit

class StopView: UIView {

    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblAddr: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPriceValue: UILabel!
    @IBOutlet weak var lblPaid: UILabel!
    @IBOutlet weak var lblPaidStatus: UILabel!

    let stopRestWorker: StopRestWorkerProtocol = StopRestWorker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
            //custom logic goes here
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    func setUp(id: Int) {
        stopRestWorker.fetch { response in
            switch response {
            case .success(let model):
                self.setValues(with: model)
            case .error(_):
                break
            }
        }
    }
    
    private func setValues(with model: StopRest) {
        lblUser.text = "Name:"
        lblUserName.text = model.userName
        lblAddr.text = "Addr.:"
        lblAddress.text = model.address
        lblPrice.text = "Price:"
        lblPriceValue.text = String(format: "%.1f", model.price ?? 0) + "€"
        lblPaid.text = "Status:"
        lblPaidStatus.text = model.paid ?? false ? "Paid" : "Pending"
        
        let customViewRect: CGRect = self.frame;
        let rect: CGRect = CGRectMake(-customViewRect.size.height/2, -customViewRect.size.height-40, customViewRect.size.width, customViewRect.size.height);
        self.frame = rect;
    }
    
}
