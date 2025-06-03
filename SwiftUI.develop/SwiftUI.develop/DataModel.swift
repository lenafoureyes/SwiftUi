//
//  DataModel.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct DataModel {
    static let posts: [Post] = [
        Post(
            title: "Желудь",
            description: "Удача, личная сила, защита и мудрость.",
            imageName: "acorn.image"
        ),
        Post(
            title: "Репейник",
            description: "Защищает и разрушает порчу, помогает спать, приносит удачу и эффективен в отмене заклинаний.",
            imageName: "agrimony.image"
        ),
        Post(
            title: "Базилик",
            description: "Используется в заклинаниях на Любовь, экзорцизм, богатство, симпатию и защиту.",
            imageName: "basil.image"
        ),
        Post(
            title: "Календула",
            description: " Привлекает успех и справедливость в юридических вопросах. Увеличивает психические/духовные силы и помогает пророческим снам. Рассеивает негатив.",
            imageName: "calendula.image"
        )
    ]
}
