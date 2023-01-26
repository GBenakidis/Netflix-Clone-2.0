import UIKit

class HomeVC: UIViewController {
    let sectionTitles: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top Rated"]
    
    private let homeFeedTable: UITableView = {
        // Initializing table, with specification of using headers
        // .zero, because we have already initialized it in viewDidLayoutSubviews
        // .grouped, it will tableView this file the same as Apple uses inside Settings app
        let table = UITableView(frame: .zero, style: .grouped)
        
        // Register our custom viewCell
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable) // Add tableView to View
        
        // Assigning data, for tableView to work properly
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        // Add header space for HomeVC
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
        
        fetchData()
    }
    
    private func configureNavbar(){
        // Get photo
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal) // Forcing iOS system to use image as it is
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        // Make icons white
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func fetchData() {
//        APICaller.shared.getTrendingMovies { results in
//            switch results {
//
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//        APICaller.shared.getTrendingTvs { results in
//            //
//        }
//        APICaller.shared.getUpcomingMovies{ _ in
//        }
//        APICaller.shared.getPopular{ _ in
//        }
        APICaller.shared.getTopRated { _ in
        }
    }
    
}

// To keep our file clean
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    // Number of rows inside each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Delegate method that tells that tableView which cell we are going to dequeue for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Proper way to write it without errors
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // Labels of each section
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // Add title above for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Dynamic number of sections
        return sectionTitles[section]
    }
    
    // Scroll down to hide header navigation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Offset of the top safe instance of the screen
        let defaultOffset = view.safeAreaInsets.top
        // Offset assign
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}
