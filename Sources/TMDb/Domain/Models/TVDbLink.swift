//
//  TVDbLink.swift
//  TMDb
//
//  Copyright © 2024 Adam Young.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an AS IS BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

///
/// An IMDb external link.
///
/// e.g. to a movie's IMDb page.
///
public struct TVDbLink: ExternalLink {

    ///
    /// IMDb identifier.
    ///
    public let id: String

    ///
    /// URL of the IMDb web page.
    ///
    public let url: URL

    ///
    /// Creates an IMDb link object using an IMDb title identifier.
    ///
    /// e.g. for a movie or TV series.
    ///
    /// - Parameter imdbTitleID: The IMDb movie or TV series identifier.
    ///
    public init?(tvdbTitleID: Int?) {
        guard
            let tvdbTitleID,
            let url = Self.tvdbURL(forTitle: String(tvdbTitleID))
        else {
            return nil
        }

        self.init(id: String(tvdbTitleID), url: url)
    }

}

extension TVDbLink {

    private init(id: String, url: URL) {
        self.id = id
        self.url = url
    }

}

extension TVDbLink {

    private static func tvdbURL(forTitle tvdbTitleID: String) -> URL? {
        URL(string: "https://www.tvdb.com/title/\(tvdbTitleID)/")
    }

    private static func tvdbURL(forName nameID: String) -> URL? {
        URL(string: "https://www.tvdb.com/name/\(nameID)/")
    }

}
