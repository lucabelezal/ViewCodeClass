import UIKit
import SnapKit

final class ViewController: UIViewController {
    private let textDataList = [
        "Message Cell 01",
        "Message Cell 02"
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self)
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.setTitle("My Button", for: .normal)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension ViewController: ViewCode {
    func buildHierarchy() {
        view.addSubviews(
            tableView,
            button
        )
        
        tableView.tableHeaderView = HeaderView(
            frame: CGRect(
                origin: .zero,
                size: .init(width: UIScreen.main.bounds.width, height: 200)
            )
        )
    }
    
    func setupConstraints() {
        //titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        //titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        //titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        //titleLabel.snp.makeConstraints { make in
        //    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
        //    make.leading.equalTo(view.snp.leading).offset(16)
        //    make.trailing.equalTo(view.snp.trailing).offset(-16)
        //}
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.height.equalTo(48)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
        tableView.backgroundColor = .lightGray
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        textDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let isFirst = indexPath.row == 0
        let message = textDataList[indexPath.row]
        cell.update(with: message, isFirst: isFirst)
        return cell
    }
}

extension ViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
}
