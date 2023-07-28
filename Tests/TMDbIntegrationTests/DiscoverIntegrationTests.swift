import TMDb
import XCTest

final class DiscoverIntegrationTests: XCTestCase {

    var discoverService: DiscoverService!

    override func setUp() {
        super.setUp()
        TMDb.configure(TMDbConfiguration(apiKey: tmdbAPIKey))
        discoverService = DiscoverService()
    }

    override func tearDown() {
        discoverService = nil
        super.tearDown()
    }

    func testMovies() async throws {
        let movieList = try await discoverService.movies()

        XCTAssertFalse(movieList.results.isEmpty)
    }

    func testTVShows() async throws {
        let tvShowList = try await discoverService.tvShows()

        XCTAssertFalse(tvShowList.results.isEmpty)
    }

}