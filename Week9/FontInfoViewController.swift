
import UIKit

class FontInfoViewController: UIViewController {
    
    var font : UIFont!
    var favorite: Bool = false
    @IBOutlet weak var fontSampleLabel : UILabel!
    @IBOutlet weak var fontSizeSlider : UISlider!
    @IBOutlet weak var fontSizeLabel : UILabel!
    @IBOutlet weak var favoritwSwitch : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoritwSwitch.isOn = favorite
    }
    
    @IBAction func slideFontSize (slider : UISlider){
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(sender: UISwitch){
        let favouriteList = FavouritesList.sharedFavouritesList
        if sender.isOn {
            favouriteList.addFavourite(fontName: font.fontName)
        } else {
            favouriteList.removeFavourite(fontName: font.fontName)
        }
    }

}
