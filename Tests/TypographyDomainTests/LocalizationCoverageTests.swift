import XCTest
@testable import TypographyDomain

final class LocalizationCoverageTests: XCTestCase {
    override func setUp() {
        super.setUp()
        L10n.languageOverride = .en
    }

    override func tearDown() {
        L10n.languageOverride = nil
        super.tearDown()
    }

    func testEverySupportedLanguageHasCompleteLocalizationCoverage() {
        let expectedUIKeys = Set(L10n.englishPack.ui.keys)
        let expectedVerdicts = Set(Verdict.allCases)
        let expectedCategories = Set(CrimeCategory.allCases)
        let expectedCrimeTypes = Set(CrimeType.allCases)

        for language in AppLanguage.allCases {
            let pack = L10n.pack(for: language)

            XCTAssertEqual(pack.localizedUIKeys, expectedUIKeys, "UI key coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedVerdictKeys, expectedVerdicts, "Verdict coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCategoryKeys, expectedCategories, "Category coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCrimeTypeTitleKeys, expectedCrimeTypes, "Crime title coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCrimeTypeDescriptionKeys, expectedCrimeTypes, "Crime description coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedArticleKeys, expectedCrimeTypes, "Article coverage mismatch for \(language.rawValue)")

            XCTAssertFalse(pack.ui.values.contains(where: \.isEmpty), "Empty UI value found for \(language.rawValue)")
            XCTAssertFalse(pack.ui.values.contains { $0.contains("<t") || $0.contains("@@") }, "Marker leak found in UI for \(language.rawValue)")

            for crimeType in CrimeType.allCases {
                guard let article = pack.articles[crimeType] else {
                    XCTFail("Missing article for \(crimeType.rawValue) in \(language.rawValue)")
                    continue
                }

                XCTAssertFalse(article.overview.isEmpty, "Empty overview for \(crimeType.rawValue) in \(language.rawValue)")
                XCTAssertFalse(article.whyItMatters.isEmpty, "Empty whyItMatters for \(crimeType.rawValue) in \(language.rawValue)")
                XCTAssertFalse(article.fixSteps.isEmpty, "Missing fix steps for \(crimeType.rawValue) in \(language.rawValue)")
                XCTAssertFalse(article.fixSteps.contains(where: \.isEmpty), "Empty fix step for \(crimeType.rawValue) in \(language.rawValue)")
            }
        }
    }

    func testRepresentativeLocalizedTemplatesPreserveFormatPlaceholders() {
        let keysAndCounts: [(String, Int)] = [
            ("counts.crimes_categories", 2),
            ("counts.line_column", 2),
            ("share.offense_line", 2),
            ("engine.fix.replace_with", 1),
            ("settings.about_website", 1),
        ]

        for language in AppLanguage.allCases {
            let pack = L10n.pack(for: language)

            for (key, expectedCount) in keysAndCounts {
                let placeholderCount = pack.ui[key]?.components(separatedBy: "%@").count ?? 1
                XCTAssertEqual(placeholderCount - 1, expectedCount, "Placeholder mismatch for \(key) in \(language.rawValue)")
            }
        }
    }
}
