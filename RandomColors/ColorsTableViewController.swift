//
//  ColorsTableViewController.swift
//  RandomColors
//
//  Created by Gerson Fuchs on 16/09/23.
//

import UIKit

class ColorsTableViewController: UIViewController {
    var colors: [UIColor] = []
    enum Cells {
        static let colorCell = "ColorCell"
    }
    enum Segues {
        static let toDetail = "ToColorsDetailViewController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVicewController = segue.destination as! ColorsDetailViewController
        destinationVicewController.color = sender as? UIColor
    }
}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
