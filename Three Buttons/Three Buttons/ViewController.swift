//
//  ViewController.swift
//  Three Buttons
//
//  Created by Admin on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var firstButton = UIButton(type: .system)
    lazy var secondButton = UIButton(type: .system)
    lazy var thirdButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        firstButton = configurationFirstButton()
        view.addSubview(firstButton)
        setupFirstButtonView(firstButton: firstButton)
        
        secondButton = configurationSecondButton()
        view.addSubview(secondButton)
        setupSecondButtonView(secondButton: secondButton)
        
        thirdButton = configurationThirdButton()
        view.addSubview(thirdButton)
        setupThirdButtonView(thirdButton: thirdButton)
    }
    
    func configurationFirstButton() -> UIButton {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("First Button", attributes: container)
        configuration.image = UIImage(systemName: "arrow.forward.circle.fill")
        configuration.imagePadding = 8
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.titleAlignment = .leading
        configuration.imagePlacement = .trailing
        configuration.baseBackgroundColor = .systemBlue
        
        let handler: UIButton.ConfigurationUpdateHandler = {button in
            if button.isHighlighted == true {
                UIView.animate(withDuration: 1,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 10,
                               options: [.allowUserInteraction,
                                         .beginFromCurrentState,
                                         UIView.AnimationOptions.curveEaseInOut]) {
                    button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                    button.transform = .identity
                }
            }
        }
        let firstButton = UIButton(configuration: configuration, primaryAction: nil)
        firstButton.isSelected = true
        firstButton.configurationUpdateHandler = handler
        return firstButton
    }
    
    func setupFirstButtonView(firstButton: UIButton){
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    func configurationSecondButton() -> UIButton {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Second Medium Button", attributes: container)
        configuration.image = UIImage(systemName: "arrow.forward.circle.fill")
        configuration.imagePadding = 8
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.titleAlignment = .leading
        configuration.imagePlacement = .trailing
        configuration.baseBackgroundColor = .systemBlue
        
        let handler: UIButton.ConfigurationUpdateHandler = {button in
            if button.isHighlighted == true {
                UIView.animate(withDuration: 1,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 10,
                               options: [.allowUserInteraction,
                                         .beginFromCurrentState,
                                         UIView.AnimationOptions.curveEaseInOut]) {
                    button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                    button.transform = .identity
                }
            }
        }
        let secondButton = UIButton(configuration: configuration, primaryAction: nil)
        secondButton.isSelected = true
        secondButton.configurationUpdateHandler = handler
        return secondButton
    }
    
    func setupSecondButtonView(secondButton: UIButton){
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
        ])
    }
    
    func configurationThirdButton() -> UIButton {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Third", attributes: container)
        configuration.image = UIImage(systemName: "arrow.forward.circle.fill")
        configuration.imagePadding = 8
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.titleAlignment = .leading
        configuration.imagePlacement = .trailing
        configuration.baseBackgroundColor = .systemBlue
        
        return UIButton(configuration: configuration, primaryAction: UIAction(handler: { [weak self] _ in
            self?.showModalController()
        }))
    }
    
    func setupThirdButtonView(thirdButton: UIButton){
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
        ])
    }
    private func showModalController(){
        let modalVC = UIViewController()
        modalVC.modalPresentationStyle = .popover
        modalVC.view.backgroundColor = .systemGray
        present(modalVC, animated: true)
    }
}


