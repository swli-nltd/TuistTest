//
//  CatchViewController.swift
//  CatchUI
//
//  Created by Ronan on 01/07/21.
//  Copyright © 2021 Sonomos. All rights reserved.
//

import UIKit
import Haneke
import Common

public class CatchViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    public var presenter: CatchPresenting?
    private var pokemonView: PokemonView?
    
    public override func viewDidLoad() {
        let image = UIImage(named: "Background", in: Bundle(for: CatchViewController.self), with: nil)
        backgroundImageView.image = image
        
        let buttonImage = UIImage(named: "Ball", in: Bundle(for: CatchViewController.self), with: nil)
        
        button.setImage(buttonImage, for: .normal)
    }
    
    @IBAction func ballAction() {
        dismiss(animated: true) {
            guard let presenter = self.presenter else { return }
            presenter.catchPokemonAction()
        }
    }
}

extension CatchViewController: CatchView {
    func update() {
        guard let presenter = presenter else { return }
        guard let screenPokemon = presenter.pokemon() else { return }
        guard let pokemonView = PokemonView.loadFromNib() else { return }
        
        pokemonView.name.text = screenPokemon.name
        pokemonView.height.text = "Height: \(screenPokemon.height)"
        pokemonView.weight.text = "Weight: \(screenPokemon.weight)"
        
        view.addSubview(pokemonView)
        
        guard let path = screenPokemon.iconPath else { return }
        guard let imageURL = URL(string: path) else { return }
        
        let placeholderImage = UIImage(named: "PokemonPlaceholder", in: Bundle(for: CatchViewController.self), with: nil)
        
        pokemonView.imageView.hnk_setImageFromURL(imageURL, placeholder: placeholderImage)
        pokemonView.backgroundColor = UIColor.clear
        pokemonView.center = view.center
    }
    
    func leavePokemonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func showLeaveOrCatchAlert() {
        let alertController = alert(with: Constants.Translations.CatchScene.leaveOrCatchAlertMessageTitle)
        let button = leaveButton(with: Constants.Translations.CatchScene.leaveItButtonTitle)
        let catchButton = alertButton(with: Constants.Translations.CatchScene.catchItButtonTitle)
        
        alertController.addAction(button)
        alertController.addAction(catchButton)
        present(alertController,
                               animated: true,
                               completion: nil)
    }
    
    func showLeaveItAlert() {
        let alertController = alert(with: Constants.Translations.CatchScene.alreadyHaveItAlertMessageTitle)
        let button = leaveButton(with: Constants.Translations.CatchScene.leaveItButtonTitle)
        
        alertController.addAction(button)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    func showNotFoundAlert() {
        showError(message: Constants.Translations.CatchScene.noPokemonFoundAlertTitle)
    }
    
    func showError(message: String) {
        let alertController = alert(with: message)
        let okButton = leaveButton(with: Constants.Translations.ok)
        
        alertController.addAction(okButton)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    private func alert(with title: String) -> UIAlertController {
        return UIAlertController(title: title,
                                 message: nil,
                                 preferredStyle: .alert)
    }
    
    private func leaveButton(with title: String) -> UIAlertAction {
        return UIAlertAction(title: title,
                             style: .default) { _ in
                                self.leavePokemonAction()
        }
    }
    
    private func alertButton(with title: String) -> UIAlertAction {
        return UIAlertAction(title: title,
                             style: .default,
                             handler: nil)
    }
}
