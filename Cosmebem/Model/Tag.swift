//
//  File.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import Foundation
import UIKit

struct Tag {
    let name: String
    let description: String
    let image: UIImage?
}

var tags: [Tag] = [
    Tag(name: "Hypoallergenic", description: "Hypoallergenic cosmetics are products that manufacturers claim produce fewer allergic reactions than other cosmetic products. Consumers with hypersensitive skin, and even those with normal skin, may be led to believe that these products will be gentler to their skin than non-hypoallergenic cosmetics.", image: UIImage(named: "hypoallergenic-black")),
    
    Tag(name: "Organic", description: "The organic cosmetic is a product formulated and produced exclusively with certified natural ingredients. Every organic product is produced within the principles of sustainability, as it is ecologically correct and socially fair, its residues do not harm nature and the production process is concerned with the communities involved.", image: UIImage(named: "vegan-black")),
    
    Tag(name: "Alcohol free", description: "Some consumers select alcohol free products because they believe ethyl alcohol dries out their skin or hair.In cosmetic labeling, the term alcohol, used by itself, refers to ethyl alcohol. Cosmetic products, including those labeled alcohol free, may contain other alcohols, such as cetyl, stearyl, cetearyl, or lanolin alcohol. These are known as fatty alcohols, and their effects on the skin are quite different from those of ethyl alcohol. Isopropyl alcohol, which some consumers may think of as drying the skin, is rarely used in cosmetics.", image: UIImage(named: "alcohol-black")),
    
    Tag(name: "Oil free", description: "Oil-free cosmetics are products that do not contain ingredients which are greasy. Typically, the list of excluded ingredients is: petrolatum, lanolin, stearic acid, and isopropyl esters. Removing these key ingredients reduce the overall oiliness of the product, reducing the chance that it causes the pores to clog.", image: UIImage(named: "oil-black")),
    
    Tag(name: "Cruelty free", description: "In the animal rights movement, cruelty-free is a label for products or activities that do not harm or kill animals anywhere in the world. Products tested on animals or made from animals are not considered cruelty-free, since these tests are often painful and cause the suffering and death of millions of animals every year.", image: UIImage(named: "cruelty-black")),
    
    Tag(name: "Silicone free", description: "Silicones are best known for their occlusive properties, which is a fancy way of saying that they form a barrier-like coating on the skin that’s resistant to both water and air.", image: UIImage(named: "silicone-black")),
    
    Tag(name: "Non-trangenic, Non-GMO", description: "Hypoallergenic cosmetics are products that manufacturers claim produce fewer allergic reactions than other cosmetic products. Consumers with hypersensitive skin, and even those with normal skin, may be led to believe that these products will be gentler to their skin than non-hypoallergenic cosmetics.", image: UIImage(named: "non-trangenic-black")),
    
    Tag(name: "No talc", description: " Talcum of dubious origin can be harmful to health, as it may contain asbestos, which is a known carcinogen.", image: UIImage(named: "no-talc-black"))
]
