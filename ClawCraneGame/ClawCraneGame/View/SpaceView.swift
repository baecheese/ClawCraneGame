//
//  SpaceView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/18.
//

import UIKit

protocol SpaceViewDelegate {
    func update(space: Space)
}

class SpaceView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView?
    @IBOutlet weak var iconImage: UIImageView?
    @IBOutlet weak var bombImage: UIImageView?
    @IBOutlet weak var positionLabel: UILabel?
    
    private var viewModel: SpaceViewModel!
    
    class func instanceFromNib() -> SpaceView {
        return UINib(nibName: SpaceView.className, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SpaceView
    }
    
    func setContents(space: Space) {
        viewModel = SpaceViewModel(space)
        viewModel.setContents(to: self)
//        positionLabel?.text = "\(space.position.row), \(space.position.column)"
    }
    
    func showAnimation(state: Space.State) {
        viewModel.showAnimation(to: self, state: state)
    }
    

}
