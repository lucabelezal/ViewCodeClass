import UIKit
import SnapKit

final class ViewController: UIViewController {
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Teste"
        label.font = .systemFont(ofSize: 32)
        return label
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
}

extension ViewController: ViewCode {
    func buildHierarchy() {
        view.addSubviews(titleLabel)
    }
    
    func setupConstraints() {
//        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
        titleLabel.backgroundColor = .red
    }
}
