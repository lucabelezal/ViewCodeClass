import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "TableViewCell"
        label.font = .systemFont(ofSize: 34)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with text: String, isFirst: Bool) {
        messageLabel.text = text
        backgroundColor = isFirst ? .red : .orange
    }
}

extension TableViewCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)

        }
    }
}
