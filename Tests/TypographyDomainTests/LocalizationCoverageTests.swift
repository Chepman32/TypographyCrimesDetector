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
        let currentOnboardingKeys: Set<String> = [
            "onboarding.welcome.title",
            "onboarding.welcome.subtitle",
            "onboarding.welcome.cta",
            "onboarding.role.title",
            "onboarding.role.subtitle",
            "onboarding.role.designer",
            "onboarding.role.designer.sub",
            "onboarding.role.writer",
            "onboarding.role.writer.sub",
            "onboarding.role.developer",
            "onboarding.role.developer.sub",
            "onboarding.role.student",
            "onboarding.role.student.sub",
            "onboarding.role.other",
            "onboarding.role.other.sub",
            "onboarding.crimes.title",
            "onboarding.crimes.subtitle",
            "onboarding.crimes.skip",
            "onboarding.social.title",
            "onboarding.social.subtitle",
            "onboarding.social.quote1",
            "onboarding.social.author1",
            "onboarding.social.quote2",
            "onboarding.social.author2",
            "onboarding.social.quote3",
            "onboarding.social.author3",
            "onboarding.social.quote4",
            "onboarding.social.author4",
            "onboarding.strictness.title",
            "onboarding.strictness.subtitle",
            "onboarding.strictness.lenient.tag",
            "onboarding.strictness.standard.tag",
            "onboarding.strictness.strict.tag",
            "onboarding.strictness.recommended",
            "onboarding.theme.title",
            "onboarding.demo.title",
            "onboarding.demo.subtitle",
            "onboarding.demo.placeholder",
            "onboarding.demo.use_sample",
            "onboarding.demo.analyze",
            "onboarding.demo.results_title",
            "onboarding.demo.results_body",
            "onboarding.demo_sentence",
            "onboarding.ready.title",
            "onboarding.ready.subtitle",
            "onboarding.ready.cta",
            "onboarding.choice.straight_quotes.wrong",
            "onboarding.choice.straight_quotes.right",
            "onboarding.choice.double_space.wrong",
            "onboarding.choice.double_space.right",
            "onboarding.choice.comic_sans.right",
            "onboarding.welcome.artwork.line1",
            "onboarding.welcome.artwork.line2",
        ]
        let englishDemoSentence = L10n.englishPack.ui["onboarding.demo_sentence"]

        for language in AppLanguage.allCases {
            let pack = L10n.pack(for: language)

            XCTAssertEqual(pack.localizedUIKeys, expectedUIKeys, "UI key coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedVerdictKeys, expectedVerdicts, "Verdict coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCategoryKeys, expectedCategories, "Category coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCrimeTypeTitleKeys, expectedCrimeTypes, "Crime title coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedCrimeTypeDescriptionKeys, expectedCrimeTypes, "Crime description coverage mismatch for \(language.rawValue)")
            XCTAssertEqual(pack.localizedArticleKeys, expectedCrimeTypes, "Article coverage mismatch for \(language.rawValue)")
            XCTAssertTrue(currentOnboardingKeys.isSubset(of: pack.localizedUIKeys), "Current onboarding keys missing for \(language.rawValue)")

            XCTAssertFalse(pack.ui.values.contains(where: \.isEmpty), "Empty UI value found for \(language.rawValue)")
            XCTAssertFalse(pack.ui.values.contains { $0.contains("<t") || $0.contains("@@") }, "Marker leak found in UI for \(language.rawValue)")
            XCTAssertNotNil(pack.ui["onboarding.welcome.artwork.line1"]?.range(of: "[["))
            XCTAssertNotNil(pack.ui["onboarding.welcome.artwork.line1"]?.range(of: "]]"))
            XCTAssertNotNil(pack.ui["onboarding.welcome.artwork.line2"]?.range(of: "[["))
            XCTAssertNotNil(pack.ui["onboarding.welcome.artwork.line2"]?.range(of: "]]"))

            if language != .en {
                XCTAssertNotEqual(
                    pack.ui["onboarding.demo_sentence"],
                    englishDemoSentence,
                    "Demo sentence should be localized for \(language.rawValue)"
                )
            }

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
