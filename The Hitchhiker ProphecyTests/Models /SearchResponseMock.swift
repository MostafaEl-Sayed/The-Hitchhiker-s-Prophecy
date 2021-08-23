//
//  SearchResponseMock.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

@testable import The_Hitchhiker_Prophecy


extension Characters.Search.Output {
   static func mockedResults() -> Characters.Search.Output {
        Characters.Search.Output(
            code: 1,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: Characters.Search.Results.mockedResults()
            )
    }
}

extension Characters.Search.Results {
    static func mockedResults() -> Characters.Search.Results {
        Characters.Search.Results(
            offset: 1,
            limit: 1,
            total: 1,
            count: 1,
            results: [
                Characters.Search.Character.mockedResults(id: 1),
                Characters.Search.Character.mockedResults(id: 2),
                Characters.Search.Character.mockedResults(id: 3)
            ]
        )
    }
}

extension Characters.Search.Character {
    static func mockedResults(id: Int) -> Characters.Search.Character {
        Characters.Search.Character(
            id: id,
            name: "Mostafa",
            resultDescription: "iOS Engineer",
            modified: "",
            thumbnail: Thumbnail(path: "", thumbnailExtension: "") ,
            resourceURI: "",
            comics: Characters.Search.Character.Comics.mockedResults(),
            series: Characters.Search.Character.Comics.mockedResults(),
            stories: Characters.Search.Character.Stories.mockedResults(),
            events: Characters.Search.Character.Comics.mockedResults(),
            urls: []
        )
    }
}

extension Characters.Search.Character.Comics {
    static func mockedResults() -> Characters.Search.Character.Comics {
        Characters.Search.Character.Comics(available: 1, collectionURI: "", items: [], returned: 1)
    }
}

extension Characters.Search.Character.Stories {
    static func mockedResults() -> Characters.Search.Character.Stories {
        Characters.Search.Character.Stories(available: 1, collectionURI: "", items: [], returned: 1)
    }
}
