import UIKit

class UserinfoVC: UIViewController {
    
    static var nibName: String { String(describing: self ) }
    
    @IBOutlet weak var bgGradientPhoto: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    internal var address: String?
    internal var location: Location?
    
    @IBOutlet weak var genderIcon: UIImageView!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var ages: UILabel!
    @IBOutlet weak var localtime: UILabel!
    
    var interactionMap: UIContextMenuInteraction!
    var interactionPhoto: UIContextMenuInteraction!
    var interactionName: UIContextMenuInteraction!
    var interactionEmail: UIContextMenuInteraction!
    
    private(set) var result: Result?
    
    public func setUserInfo(_ result: Result) {
        _photoSetup(result)
        _nameSetup(result)
        _emailSetup(result)
        _ageSetup(result)
        _genderSetup(result)
        _locationSetup(result)
        self.result = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Info"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let username = try? result?.name.jsonString() {
            API.report(key: "Currently viewed", value: username)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let username = try? result?.name.jsonString() {
            API.report(key: "Viewing is over", value: username)
        }
    }
}
