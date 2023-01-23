import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        // Assigning VCs to variables
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: UpcomingVC())
        let vc3 = UINavigationController(rootViewController: SearchVC())
        let vc4 = UINavigationController(rootViewController: DownloadsVC())
        
        // Add icons to buttons
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        // Add text to button
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Seaches"
        vc4.title = "Downloads"
        
        // Color of tabBar
        tabBar.tintColor = .label
        
        // Setting them up for usesage
        setViewControllers([vc1, vc2, vc3 , vc4], animated: true)
        
    }

}
