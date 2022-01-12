//
//  ViewController.swift
//  TestTaskFood
//
//  Created by Admin on 09.01.2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        designMenu()
        // Do any additional setup after loading the view.
    }
    
    func designMenu(){
            
            let stackView = UIStackView()
            stackView.axis  = .vertical
            stackView.spacing = 20
            stackView.alignment = .center
            view.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
            
            let labelTitle = UILabel()
            labelTitle.text = "Тестовое Задание"
            labelTitle.numberOfLines = 0
            labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 33)
            labelTitle.textColor = .orange
            stackView.addArrangedSubview(labelTitle)

            
            
            
            let buttonStart = UIButton()
            buttonStart.setTitle("Начать", for: .normal)
            buttonStart.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            buttonStart.setTitleColor(.blue, for: .normal)
            buttonStart.addTarget(self, action: #selector(openListView), for: .touchUpInside)
            
            stackView.addArrangedSubview(buttonStart)
            
            
            
        }
        
        @objc func openListView(){
            let tabBarVC = UITabBarController()
            let menuVC = UINavigationController(rootViewController:  MenuVC())
            let contactsVC = UINavigationController(rootViewController: contactsViewController())
            let profileVC = UINavigationController(rootViewController: profileViewController())
            let basketVC =  UINavigationController(rootViewController: basketViewController())
            menuVC.title = "Меню"
            contactsVC.title = "Контакты"
            profileVC.title = "Профиль"
            basketVC.title = "Корзина"
            tabBarVC.tabBar.tintColor = .red
            
            tabBarVC.tabBar.backgroundColor = .white
            tabBarVC.setViewControllers([menuVC, contactsVC,profileVC,basketVC], animated: true)
            
            let images = ["menuImage","contactsImage","profileImage","basketImage"]
            guard let items = tabBarVC.tabBar.items else {
                return
                
            }
            
            for i in 0..<items.count {
                items[i].image = UIImage(named: images[i])
            }
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true, completion: nil)
        }
    
    class contactsViewController: UIViewController {
        override func viewDidLoad() {
            view.backgroundColor = .white
            let labelTitle = UILabel()
            labelTitle.text = "Демо"
            labelTitle.numberOfLines = 0
            labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 40)
            labelTitle.textColor = .orange
            view.addSubview(labelTitle)
            
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        }
    }
    
    class profileViewController: UIViewController {
        override func viewDidLoad() {
            view.backgroundColor = .white
            let labelTitle = UILabel()
            labelTitle.text = "Демо"
            labelTitle.numberOfLines = 0
            labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 40)
            labelTitle.textColor = .orange
            view.addSubview(labelTitle)
            
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        }
    }
    
    class basketViewController: UIViewController {
        override func viewDidLoad() {
            view.backgroundColor = .white
            let labelTitle = UILabel()
            labelTitle.text = "Демо"
            labelTitle.numberOfLines = 0
            labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 40)
            labelTitle.textColor = .orange
            view.addSubview(labelTitle)
            
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        }
    }
}

