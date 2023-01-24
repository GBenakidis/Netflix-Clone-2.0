import UIKit

class HomeVC: UIViewController {
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
        
        // Add header space for HomeVC
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x:0, y:0, width: view.bounds.width, height: 450))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
}

// To keep our file clean
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
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
}
