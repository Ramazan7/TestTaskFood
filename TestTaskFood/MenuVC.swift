//
//  MenuVC.swift
//  TestTaskFood
//
//  Created by Admin on 09.01.2022.
//

import UIKit

class MenuVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    let mainScrollView = UIScrollView()
    let cityLabel = UILabel()
    let cityChangeButton = UIButton()
    let bannerScrollview = UIScrollView()
    let categories = ["Пицца","Комбо","Десерты","Напитки"]
    let buttonPizza = UIButton()
    let buttonKombo = UIButton()
    let buttonDessert = UIButton()
    let buttonBeverages = UIButton()
    let categoriesScrollView = UIScrollView()
    let pizzaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let tabBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.backgroundColor = #colorLiteral(red: 0.9526892304, green: 0.9611908793, blue: 0.9764197469, alpha: 1)
        mainScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        mainScrollView.contentSize = CGSize(width: 600, height: 2000)
        view.addSubview(mainScrollView)
        
        designMenu()
        viewAdd()
        constraintAdd()
        categoryButtons(nameCategories: categories)
        designCollectionView()
        // Do any additional setup after loading the view.
    }


    func designMenu(){
        cityLabel.text = "Москва"
        cityChangeButton.setTitle("⌄", for: .normal)
        cityChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        cityChangeButton.setTitleColor(.black, for: .normal)
    }
    
    func bannerDesign(nameImageOne:String, nameImageTwo:String){
        
        bannerScrollview.contentSize = CGSize(width: 600, height: 150)
        bannerScrollview.showsHorizontalScrollIndicator = false
        
        let imageOne = UIImageView()
        imageOne.image = UIImage(named: nameImageOne)
        imageOne.contentMode = .scaleToFill
        
        bannerScrollview.addSubview(imageOne)
        
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        imageOne.topAnchor.constraint(equalTo: bannerScrollview.topAnchor).isActive = true
        imageOne.leftAnchor.constraint(equalTo: bannerScrollview.leftAnchor, constant: 10).isActive = true
        imageOne.heightAnchor.constraint(equalTo: bannerScrollview.heightAnchor).isActive = true
        imageOne.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        let imageTwo = UIImageView()
        imageTwo.image = UIImage(named: nameImageTwo)
        imageTwo.contentMode = .scaleToFill
        
        bannerScrollview.addSubview(imageTwo)
        
        imageTwo.translatesAutoresizingMaskIntoConstraints = false
        imageTwo.topAnchor.constraint(equalTo: bannerScrollview.topAnchor).isActive = true
        imageTwo.leftAnchor.constraint(equalTo: imageOne.rightAnchor).isActive = true
        imageTwo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageTwo.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
   
    func categoryButtons(nameCategories:[String]){
        
        categoriesScrollView.contentSize = CGSize(width: 450, height: 70)
        categoriesScrollView.showsHorizontalScrollIndicator = false
        
        buttonPizza.setTitle("Пицца", for: .normal)
        buttonPizza.layer.cornerRadius = 15
        buttonPizza.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonPizza.setTitleColor(.red, for: .normal)
        buttonPizza.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        buttonPizza.layer.borderWidth = 1
        buttonPizza.addTarget(.none, action: #selector(categoriesButton), for: .touchUpInside)
        
        buttonKombo.setTitle("Комбо", for: .normal)
        buttonKombo.layer.cornerRadius = 15
        buttonKombo.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonKombo.setTitleColor(.red, for: .normal)
        buttonKombo.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        buttonKombo.layer.borderWidth = 1
        buttonKombo.addTarget(.none, action: #selector(categoriesButton), for: .touchUpInside)
        
        buttonDessert.setTitle("Десерты", for: .normal)
        buttonDessert.layer.cornerRadius = 15
        buttonDessert.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonDessert.setTitleColor(.red, for: .normal)
        buttonDessert.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        buttonDessert.layer.borderWidth = 1
        buttonDessert.addTarget(.none, action: #selector(categoriesButton), for: .touchUpInside)
        
        buttonBeverages.setTitle("Напитки", for: .normal)
        buttonBeverages.layer.cornerRadius = 15
        buttonBeverages.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonBeverages.setTitleColor(.red, for: .normal)
        buttonBeverages.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        buttonBeverages.layer.borderWidth = 1
        buttonBeverages.addTarget(.none, action: #selector(categoriesButton), for: .touchUpInside)
        
        categoriesScrollView.addSubview(buttonPizza)
        categoriesScrollView.addSubview(buttonKombo)
        categoriesScrollView.addSubview(buttonDessert)
        categoriesScrollView.addSubview(buttonBeverages)
        
        buttonPizza.translatesAutoresizingMaskIntoConstraints = false
        buttonPizza.topAnchor.constraint(equalTo: bannerScrollview.bottomAnchor, constant: 20).isActive = true
        buttonPizza.leftAnchor.constraint(equalTo: categoriesScrollView.leftAnchor, constant: 30).isActive = true
        buttonPizza.widthAnchor.constraint(equalToConstant: 82).isActive = true
        buttonPizza.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        buttonKombo.translatesAutoresizingMaskIntoConstraints = false
        buttonKombo.topAnchor.constraint(equalTo: bannerScrollview.bottomAnchor, constant: 20).isActive = true
        buttonKombo.leftAnchor.constraint(equalTo: buttonPizza.rightAnchor, constant: 8).isActive = true
        buttonKombo.widthAnchor.constraint(equalToConstant: 82).isActive = true
        buttonKombo.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        buttonDessert.translatesAutoresizingMaskIntoConstraints = false
        buttonDessert.topAnchor.constraint(equalTo: bannerScrollview.bottomAnchor, constant: 20).isActive = true
        buttonDessert.leftAnchor.constraint(equalTo: buttonKombo.rightAnchor, constant: 8).isActive = true
        buttonDessert.widthAnchor.constraint(equalToConstant: 82).isActive = true
        buttonDessert.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        buttonBeverages.translatesAutoresizingMaskIntoConstraints = false
        buttonBeverages.topAnchor.constraint(equalTo: bannerScrollview.bottomAnchor, constant: 20).isActive = true
        buttonBeverages.leftAnchor.constraint(equalTo: buttonDessert.rightAnchor, constant: 8).isActive = true
        buttonBeverages.widthAnchor.constraint(equalToConstant: 82).isActive = true
        buttonBeverages.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @objc func categoriesButton(sender: UIButton){
        
        buttonPizza.backgroundColor = .clear
        buttonKombo.backgroundColor = .clear
        buttonDessert.backgroundColor = .clear
        buttonBeverages.backgroundColor = .clear
        sender.backgroundColor = #colorLiteral(red: 0.9640734792, green: 0.8204472661, blue: 0.8625238538, alpha: 1)
        
        mainScrollView.setContentOffset(CGPoint(x: 0, y: 110), animated: true)
        pizzaCollectionView.setContentOffset(CGPoint(x: 0, y: 400), animated: true)
        categoriesScrollView.backgroundColor = .white

        switch sender.titleLabel?.text {
        case ("Пицца"): pizzaCollectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case ("Комбо"): pizzaCollectionView.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
        case ("Десерты"): pizzaCollectionView.setContentOffset(CGPoint(x: 0, y: 300), animated: true)
        case ("Напитки"): pizzaCollectionView.setContentOffset(CGPoint(x: 0, y: 500), animated: true)
        default: break
        }
       
    }
    
    func viewAdd(){
        mainScrollView.addSubview(cityLabel)
        mainScrollView.addSubview(cityChangeButton)
        mainScrollView.addSubview(bannerScrollview)
        mainScrollView.addSubview(categoriesScrollView)
        mainScrollView.addSubview(tabBar)
    }
    
    func constraintAdd(){
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: mainScrollView.topAnchor,constant: 0).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor,constant: 30).isActive = true
        
        cityChangeButton.translatesAutoresizingMaskIntoConstraints = false
        cityChangeButton.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: -20).isActive = true
        cityChangeButton.leftAnchor.constraint(equalTo: cityLabel.rightAnchor).isActive = true
        
        bannerScrollview.translatesAutoresizingMaskIntoConstraints = false
        bannerScrollview.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15).isActive = true
        bannerScrollview.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor).isActive = true
        bannerScrollview.rightAnchor.constraint(equalTo: mainScrollView.rightAnchor).isActive = true
        bannerScrollview.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        bannerScrollview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        categoriesScrollView.translatesAutoresizingMaskIntoConstraints = false
        categoriesScrollView.topAnchor.constraint(equalTo: bannerScrollview.bottomAnchor, constant: 15).isActive = true
        categoriesScrollView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor).isActive = true
        categoriesScrollView.rightAnchor.constraint(equalTo: mainScrollView.rightAnchor).isActive = true
        categoriesScrollView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        categoriesScrollView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
        if(indexPath.row == 0){
            mainScrollView.setContentOffset(CGPoint(x: 0, y: -100), animated: true) // standart
            categoriesScrollView.backgroundColor = #colorLiteral(red: 0.9526892304, green: 0.9611908793, blue: 0.9764197469, alpha: 1)
        }
        if(indexPath.row == 6){
            mainScrollView.setContentOffset(CGPoint(x: 0, y: 110), animated: true)
            categoriesScrollView.backgroundColor = .white
        }
    }
    
    func designCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 180)
        layout.scrollDirection = .vertical

        pizzaCollectionView.collectionViewLayout = layout
        pizzaCollectionView.frame = .zero
        bannerDesign(nameImageOne: "bannerImage1", nameImageTwo: "bannerImage2")
        pizzaCollectionView.contentSize = CGSize(width: 100, height: 200)
        pizzaCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        pizzaCollectionView.backgroundColor = UIColor.white
        pizzaCollectionView.dataSource = self
        pizzaCollectionView.delegate = self
        mainScrollView.addSubview(pizzaCollectionView)
        
        pizzaCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pizzaCollectionView.topAnchor.constraint(equalTo: categoriesScrollView.bottomAnchor).isActive = true
        pizzaCollectionView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor).isActive = true
        pizzaCollectionView.rightAnchor.constraint(equalTo: mainScrollView.rightAnchor).isActive = true
        pizzaCollectionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        pizzaCollectionView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        let cellPizzaView = UIView()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza1")
        imageView.contentMode = .scaleToFill
        
        let titlePizza = UILabel()
        titlePizza.text = "Ветчина и грибы"
        titlePizza.textColor = .black
        titlePizza.font = UIFont.boldSystemFont(ofSize: 17)
        
        let descriptionPizza = UILabel()
        descriptionPizza.text = "Ветчина? шампиньоны \n увеличиная порция \n моцереллы? томатный соус"
        descriptionPizza.textColor = .black
        descriptionPizza.font = descriptionPizza.font.withSize(12)
        descriptionPizza.numberOfLines = 0
        
        let buttonPrice = UIButton()
        buttonPrice.setTitle("от 345 р.", for: .normal)
        buttonPrice.layer.cornerRadius = 15
        buttonPrice.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonPrice.setTitleColor(.red, for: .normal)
        buttonPrice.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        buttonPrice.layer.borderWidth = 1
        buttonPrice.addTarget(.none, action: #selector(categoriesButton), for: .touchUpInside)
        
        cellPizzaView.addSubview(imageView)
        cellPizzaView.addSubview(titlePizza)
        cellPizzaView.addSubview(descriptionPizza)
        cellPizzaView.addSubview(buttonPrice)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: cellPizzaView.topAnchor, constant: 24).isActive = true
        imageView.leftAnchor.constraint(equalTo: cellPizzaView.leftAnchor,constant: 16).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 133).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        titlePizza.translatesAutoresizingMaskIntoConstraints = false
        titlePizza.topAnchor.constraint(equalTo: cellPizzaView.topAnchor, constant: 32).isActive = true
        titlePizza.leftAnchor.constraint(equalTo: imageView.rightAnchor,constant: 16).isActive = true
        
        descriptionPizza.translatesAutoresizingMaskIntoConstraints = false
        descriptionPizza.topAnchor.constraint(equalTo: titlePizza.bottomAnchor, constant: 8).isActive = true
        descriptionPizza.leftAnchor.constraint(equalTo: imageView.rightAnchor,constant: 16).isActive = true
        
        buttonPrice.translatesAutoresizingMaskIntoConstraints = false
        buttonPrice.topAnchor.constraint(equalTo: descriptionPizza.bottomAnchor, constant: 16).isActive = true
        buttonPrice.leftAnchor.constraint(equalTo: imageView.rightAnchor,constant: 115).isActive = true
        buttonPrice.widthAnchor.constraint(equalToConstant: 87).isActive = true
        buttonPrice.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        cell.addSubview(cellPizzaView)
        
        cellPizzaView.translatesAutoresizingMaskIntoConstraints = false
        cellPizzaView.widthAnchor.constraint(equalTo: cell.widthAnchor).isActive = true
        cellPizzaView.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        cellPizzaView.backgroundColor = .white
        return cell
    }
}
