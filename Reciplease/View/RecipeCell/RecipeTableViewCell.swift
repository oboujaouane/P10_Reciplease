//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ingredientsLabel: UILabel!
    @IBOutlet private weak var servingsLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    /// Allow to display information in cells
    func configure(recipe: Recipe) {
        titleLabel.text = recipe.label
        for ingredient in recipe.ingredientLines {
            ingredientsLabel.text? += "\(ingredient), "
        }
        servingsLabel.text = "For \(String(recipe.yield))"
        totalTimeLabel.text = "\(String(recipe.totalTime)) minutes"
    }
    
    /// Network call to load image for cells
    func imageForCell(recipeUrl: String) {
        EdamamService.shared.getImage(url: recipeUrl, callback: { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let image = image {
                    self.backgroundImageView.image = image
                }
            }
        })
    }
    
}
