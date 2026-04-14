import Foundation

public enum AppLanguage: String, CaseIterable, Codable, Hashable, Sendable {
    case en
    case zhHans = "zh-Hans"
    case ja
    case ko
    case de
    case fr
    case es
    case ptBR = "pt-BR"
    case ar
    case ru
    case it
    case nl
    case tr
    case th
    case vi
    case id
    case pl
    case uk
    case hi
    case he
    case sv
    case no
    case da
    case fi
    case cs
    case hu
    case ro
    case el
    case ms

    public static var current: AppLanguage {
        resolve(from: Locale.preferredLanguages + [Locale.autoupdatingCurrent.identifier])
    }

    public var locale: Locale {
        Locale(identifier: rawValue.replacingOccurrences(of: "-", with: "_"))
    }

    public var displayName: String {
        switch self {
        case .en: "English"
        case .zhHans: "简体中文"
        case .ja: "日本語"
        case .ko: "한국어"
        case .de: "Deutsch"
        case .fr: "Français"
        case .es: "Español"
        case .ptBR: "Português (Brasil)"
        case .ar: "العربية"
        case .ru: "Русский"
        case .it: "Italiano"
        case .nl: "Nederlands"
        case .tr: "Türkçe"
        case .th: "ไทย"
        case .vi: "Tiếng Việt"
        case .id: "Bahasa Indonesia"
        case .pl: "Polski"
        case .uk: "Українська"
        case .hi: "हिन्दी"
        case .he: "עברית"
        case .sv: "Svenska"
        case .no: "Norsk"
        case .da: "Dansk"
        case .fi: "Suomi"
        case .cs: "Čeština"
        case .hu: "Magyar"
        case .ro: "Română"
        case .el: "Ελληνικά"
        case .ms: "Bahasa Melayu"
        }
    }

    private static func resolve(from identifiers: [String]) -> AppLanguage {
        for identifier in identifiers {
            let normalized = identifier.replacingOccurrences(of: "_", with: "-").lowercased()
            switch normalized {
            case let value where value.hasPrefix("zh-hans"),
                 let value where value.hasPrefix("zh-cn"),
                 let value where value.hasPrefix("zh-sg"):
                return .zhHans
            case let value where value.hasPrefix("pt-br"):
                return .ptBR
            case "pt":
                return .ptBR
            case let value where value.hasPrefix("nb"),
                 let value where value.hasPrefix("nn"),
                 let value where value.hasPrefix("no"):
                return .no
            case let value where value.hasPrefix("en"):
                return .en
            case let value where value.hasPrefix("ja"):
                return .ja
            case let value where value.hasPrefix("ko"):
                return .ko
            case let value where value.hasPrefix("de"):
                return .de
            case let value where value.hasPrefix("fr"):
                return .fr
            case let value where value.hasPrefix("es"):
                return .es
            case let value where value.hasPrefix("ar"):
                return .ar
            case let value where value.hasPrefix("ru"):
                return .ru
            case let value where value.hasPrefix("it"):
                return .it
            case let value where value.hasPrefix("nl"):
                return .nl
            case let value where value.hasPrefix("tr"):
                return .tr
            case let value where value.hasPrefix("th"):
                return .th
            case let value where value.hasPrefix("vi"):
                return .vi
            case let value where value.hasPrefix("id"):
                return .id
            case let value where value.hasPrefix("pl"):
                return .pl
            case let value where value.hasPrefix("uk"):
                return .uk
            case let value where value.hasPrefix("hi"):
                return .hi
            case let value where value.hasPrefix("he"):
                return .he
            case let value where value.hasPrefix("sv"):
                return .sv
            case let value where value.hasPrefix("da"):
                return .da
            case let value where value.hasPrefix("fi"):
                return .fi
            case let value where value.hasPrefix("cs"):
                return .cs
            case let value where value.hasPrefix("hu"):
                return .hu
            case let value where value.hasPrefix("ro"):
                return .ro
            case let value where value.hasPrefix("el"):
                return .el
            case let value where value.hasPrefix("ms"):
                return .ms
            default:
                continue
            }
        }
        return .en
    }
}

struct LocalizedArticleCopy: Sendable {
    let overview: String
    let whyItMatters: String
    let history: String?
    let wrongExample: String?
    let rightExample: String?
    let fixSteps: [String]

    init(
        overview: String,
        whyItMatters: String,
        history: String?,
        wrongExample: String? = nil,
        rightExample: String? = nil,
        fixSteps: [String]
    ) {
        self.overview = overview
        self.whyItMatters = whyItMatters
        self.history = history
        self.wrongExample = wrongExample
        self.rightExample = rightExample
        self.fixSteps = fixSteps
    }
}

struct LocalizationPack: Sendable {
    let ui: [String: String]
    let verdictShortLabels: [Verdict: String]
    let crimeCategoryTitles: [CrimeCategory: String]
    let crimeTypeTitles: [CrimeType: String]
    let crimeTypeDescriptions: [CrimeType: String]
    let articles: [CrimeType: LocalizedArticleCopy]
    let localizedUIKeys: Set<String>
    let localizedVerdictKeys: Set<Verdict>
    let localizedCategoryKeys: Set<CrimeCategory>
    let localizedCrimeTypeTitleKeys: Set<CrimeType>
    let localizedCrimeTypeDescriptionKeys: Set<CrimeType>
    let localizedArticleKeys: Set<CrimeType>
}

public enum L10n {
    nonisolated(unsafe) static var languageOverride: AppLanguage?

    public static var currentLanguage: AppLanguage { languageOverride ?? AppLanguage.current }
    public static var currentLocale: Locale { currentLanguage.locale }

    public static func setLanguageOverride(_ language: AppLanguage?) {
        languageOverride = language
    }

    public static func text(_ key: String) -> String {
        let pack = pack(for: currentLanguage)
        return pack.ui[key] ?? englishPack.ui[key] ?? key
    }

    public static func format(_ key: String, _ arguments: CVarArg...) -> String {
        let template = text(key)
        return withVaList(arguments) { pointer in
            NSString(format: template, locale: currentLocale, arguments: pointer) as String
        }
    }

    public static func verdictShortLabel(_ verdict: Verdict) -> String {
        pack(for: currentLanguage).verdictShortLabels[verdict]
            ?? englishPack.verdictShortLabels[verdict]
            ?? verdict.label
    }

    public static func crimeCategoryTitle(_ category: CrimeCategory) -> String {
        pack(for: currentLanguage).crimeCategoryTitles[category]
            ?? englishPack.crimeCategoryTitles[category]
            ?? category.rawValue
    }

    public static func crimeTypeTitle(_ crimeType: CrimeType) -> String {
        pack(for: currentLanguage).crimeTypeTitles[crimeType]
            ?? englishPack.crimeTypeTitles[crimeType]
            ?? crimeType.rawValue
    }

    public static func crimeTypeDescription(_ crimeType: CrimeType) -> String {
        pack(for: currentLanguage).crimeTypeDescriptions[crimeType]
            ?? englishPack.crimeTypeDescriptions[crimeType]
            ?? crimeType.rawValue
    }

    public static func article(for crimeType: CrimeType) -> CrimeEducationalArticle {
        let pack = pack(for: currentLanguage)
        let localized = pack.articles[crimeType]
        let fallback = LocalizedArticleCopy.fallback

        return CrimeEducationalArticle(
            crimeType: crimeType,
            title: crimeTypeTitle(crimeType),
            overview: localized?.overview ?? crimeTypeDescription(crimeType),
            whyItMatters: localized?.whyItMatters ?? text("learn.default_why"),
            history: localized?.history ?? fallback.history,
            wrongExample: localized?.wrongExample ?? defaultWrongExamples[crimeType] ?? "Wrong",
            rightExample: localized?.rightExample ?? defaultRightExamples[crimeType] ?? "Right",
            fixSteps: localized?.fixSteps ?? [text("learn.default_fix")]
        )
    }

    public static func crimeCountSummary(crimes: Int, categories: Int) -> String {
        format(
            "counts.crimes_categories",
            number(crimes),
            number(categories)
        )
    }

    public static func detectedIssuesSummary(_ crimes: Int) -> String {
        format("counts.detected_issues", number(crimes))
    }

    public static func violationCountSummary(_ count: Int) -> String {
        format("counts.entries", number(count))
    }

    public static func characterCountSummary(_ count: Int) -> String {
        format("counts.characters", number(count))
    }

    public static func lineColumnSummary(line: Int, column: Int) -> String {
        format("counts.line_column", number(line), number(column))
    }

    public static func reportCardSummary(crimes: Int, verdict: Verdict) -> String {
        format("counts.crimes_verdict", number(crimes), verdict.label)
    }

    public static func shareOffenseSummary(crimeType: CrimeType, count: Int) -> String {
        format("share.offense_line", crimeType.displayName, number(count))
    }

    public static func replacementToken(from suggestion: String) -> String? {
        let marker = "__TOKEN__"
        let template = format("engine.fix.replace_with", marker)
        guard let markerRange = template.range(of: marker) else { return nil }

        let prefix = String(template[..<markerRange.lowerBound])
        let suffix = String(template[markerRange.upperBound...])

        guard suggestion.hasPrefix(prefix), suggestion.hasSuffix(suffix) else { return nil }

        let start = suggestion.index(suggestion.startIndex, offsetBy: prefix.count)
        let end = suggestion.index(suggestion.endIndex, offsetBy: -suffix.count)
        guard start <= end else { return nil }
        return String(suggestion[start..<end])
    }

    public static func number(_ value: Int) -> String {
        value.formatted(.number.locale(currentLocale))
    }

    static func pack(for language: AppLanguage) -> LocalizationPack {
        switch language {
        case .en: englishPack
        case .zhHans: simplifiedChinesePack
        case .ja: japanesePack
        case .ko: koreanPack
        case .de: germanPack
        case .fr: frenchPack
        case .es: spanishPack
        case .ptBR: brazilianPortuguesePack
        case .ar: arabicPack
        case .ru: russianPack
        case .it: italianPack
        case .nl: dutchPack
        case .tr: turkishPack
        case .th: thaiPack
        case .vi: vietnamesePack
        case .id: indonesianPack
        case .pl: polishPack
        case .uk: ukrainianPack
        case .hi: hindiPack
        case .he: hebrewPack
        case .sv: swedishPack
        case .no: norwegianPack
        case .da: danishPack
        case .fi: finnishPack
        case .cs: czechPack
        case .hu: hungarianPack
        case .ro: romanianPack
        case .el: greekPack
        case .ms: malayPack
        }
    }

    private static let defaultWrongExamples: [CrimeType: String] = [
        .straightQuotes: "\"Hello\" and 'goodbye'",
        .fakeEllipsis: "Wait...",
        .hyphenAsDash: "He paused -- dramatically.",
        .doubleSpace: "The case is closed.  Move on.",
        .widow: "Typography is a matter of rhythm and\ncare.",
        .orphan: "A long paragraph ends and the next block begins with\na.",
        .inconsistentSpacing: "First sentence. Second sentence.  Third sentence.",
        .comicSans: "Comic Sans everywhere",
        .primeMarks: "5'11\"",
        .multiplicationSign: "1920x1080",
        .trademarkSymbol: "(c) 2026 Brand Name (tm)",
    ]

    private static let defaultRightExamples: [CrimeType: String] = [
        .straightQuotes: "“Hello” and ‘goodbye’",
        .fakeEllipsis: "Wait…",
        .hyphenAsDash: "He paused — dramatically.",
        .doubleSpace: "The case is closed. Move on.",
        .widow: "Typography is a matter of rhythm\nand care.",
        .orphan: "A long paragraph ends and the next block begins with a fuller line.",
        .inconsistentSpacing: "First sentence. Second sentence. Third sentence.",
        .comicSans: "Use a font suited to the document’s tone.",
        .primeMarks: "5′11″",
        .multiplicationSign: "1920×1080",
        .trademarkSymbol: "© 2026 Brand Name ™",
    ]

    private static let englishUI: [String: String] = [
            "app.tab.crime_lab": "Crime Lab",
            "app.tab.case_files": "Case Files",
            "app.tab.learn": "Learn",
            "app.tab.settings": "Settings",
            "counts.crimes_categories": "Crimes: %@ · Categories: %@",
            "counts.detected_issues": "Detected issues: %@",
            "counts.entries": "Entries: %@",
            "counts.characters": "Characters: %@",
            "counts.line_column": "Line %@ · Col %@",
            "counts.crimes_verdict": "Crimes: %@ · %@",
            "share.offense_line": "• %@: %@",
            "general.done": "Done",
            "general.cancel": "Cancel",
            "general.retry": "Retry",
            "general.next": "Next",
            "general.skip": "Skip",
            "general.got_it": "Got it",
            "general.coming_soon": "Coming Soon",
            "general.wrong": "Wrong",
            "general.right": "Right",
            "history.empty_title": "No cases yet",
            "history.empty_subtitle": "Run a scan and your case files will appear here.",
            "history.share": "Share",
            "history.delete": "Delete",
            "history.title": "Case Files",
            "history.today": "TODAY",
            "history.yesterday": "YESTERDAY",
            "history.this_week": "THIS WEEK",
            "history.this_month": "THIS MONTH",
            "history.select_all": "Select All",
            "history.delete_selected": "Delete Selected",
            "learn.title": "The Law Library",
            "learn.search_prompt": "Search crime types",
            "learn.empty_title": "No matching crimes found",
            "learn.empty_subtitle": "Try a different search term.",
            "learn.what_is_this": "What is this issue?",
            "learn.why_it_matters": "Why it matters",
            "learn.history_origin": "History and context",
            "learn.how_to_fix": "How to fix it",
            "learn.default_why": "Good typography is a system of thoughtful details.",
            "learn.default_fix": "Use the correct character and keep the document consistent.",
            "input.method": "Input Method",
            "input.method.paste": "Paste / Type",
            "input.method.camera": "Camera (OCR)",
            "input.placeholder": "Paste or type your text here…",
            "input.paste_from_clipboard": "Paste from Clipboard",
            "input.title": "Submit Evidence",
            "input.analyze": "Analyze",
            "input.analyze_evidence": "Analyze Evidence",
            "input.camera_message": "Camera-based text recognition is coming in a future update. For now, paste or type your text to analyze.",
            "input.trimmed_warning": "Text was trimmed to 100,000 characters.",
            "input.clipboard_empty": "Clipboard is empty. Copy some text first.",
            "input.no_text": "No text to analyze. Paste or type some text first.",
            "home.new_investigation": "New Investigation",
            "home.new_investigation_subtitle": "Paste or type text to begin forensic typography analysis",
            "home.new_investigation_badge": "PASTE · TYPE · ANALYZE",
            "home.recent_cases": "Recent Cases",
            "home.see_all": "See All →",
            "home.empty_title": "No cases yet",
            "home.empty_subtitle": "Start your first investigation.",
            "home.begin_investigation": "Begin Investigation",
            "home.stat.scans": "Scans",
            "home.stat.crimes": "Crimes",
            "home.stat.avg": "Avg",
            "onboarding.splash_tagline": "Every glyph is evidence.",
            "onboarding.welcome.title": "Every Glyph\nIs Evidence",
            "onboarding.welcome.subtitle": "Typpo catches the typography crimes that spellcheck misses.",
            "onboarding.welcome.cta": "Start Investigation",
            "onboarding.role.title": "What brings you\nto the scene?",
            "onboarding.role.subtitle": "This helps us tailor your experience.",
            "onboarding.role.designer": "Designer",
            "onboarding.role.designer.sub": "I craft pixel-perfect layouts",
            "onboarding.role.writer": "Writer",
            "onboarding.role.writer.sub": "Words are my weapon",
            "onboarding.role.developer": "Developer",
            "onboarding.role.developer.sub": "I ship code with text",
            "onboarding.role.student": "Student",
            "onboarding.role.student.sub": "Learning the craft",
            "onboarding.role.other": "Other",
            "onboarding.role.other.sub": "Curious citizen",
            "onboarding.crimes.title": "Which crimes\nbother you most?",
            "onboarding.crimes.subtitle": "Select all that apply — you can change this later.",
            "onboarding.crimes.skip": "Detect Everything",
            "onboarding.social.title": "You\u{2019}re in\ngood company",
            "onboarding.social.subtitle": "Typography professionals and enthusiasts use Typpo every day.",
            "onboarding.social.quote1": "Finally, something that catches the curly quote mistakes my editor always misses.",
            "onboarding.social.author1": "Sarah K., Copy Editor",
            "onboarding.social.quote2": "I run every client deliverable through Typpo before sending. It\u{2019}s saved me from embarrassment more than once.",
            "onboarding.social.author2": "Marcus T., Brand Designer",
            "onboarding.strictness.title": "How strict\nshould we be?",
            "onboarding.strictness.subtitle": "You can always adjust this in Settings.",
            "onboarding.strictness.lenient.tag": "Just the big stuff",
            "onboarding.strictness.standard.tag": "The sweet spot",
            "onboarding.strictness.strict.tag": "No crime goes unpunished",
            "onboarding.strictness.recommended": "Recommended",
            "onboarding.theme.title": "Choose your look",
            "onboarding.demo.title": "Try it now",
            "onboarding.demo.subtitle": "Paste any text and watch Typpo find the crimes hiding in plain sight.",
            "onboarding.demo.placeholder": "Paste or type text here\u{2026}",
            "onboarding.demo.use_sample": "Use sample text",
            "onboarding.demo.analyze": "Analyze Evidence",
            "onboarding.demo.results_title": "Case closed.",
            "onboarding.demo.results_body": "This is what Typpo does \u{2014} every paste, every time.",
            "onboarding.demo.preview": "He said [[\"Hello\"...]]\nand left [[--]] quickly.",
            "onboarding.ready.title": "Your badge\nis ready",
            "onboarding.ready.subtitle": "You\u{2019}re all set, Detective. Time to clean up some typography.",
            "onboarding.ready.cta": "Start Investigating",
            "onboarding.choice.straight_quotes.wrong": #""Hello""#,
            "onboarding.choice.straight_quotes.right": "\u{201C}Hello\u{201D}",
            "onboarding.choice.double_space.wrong": "word  word",
            "onboarding.choice.double_space.right": "word word",
            "onboarding.choice.comic_sans.right": "A better fit",
            "onboarding.welcome.artwork.line1": #"She said [["hello"...]]"#,
            "onboarding.welcome.artwork.line2": "and left [[--]] quickly.",
            "onboarding.page1.title": "Paste. Analyze. Review.",
            "onboarding.page1.body": "Drop in any text and the app will flag typographic issues hiding in plain sight.",
            "onboarding.page2.title": "We Catch What Spellcheck Misses",
            "onboarding.page2.body": "Straight quotes, fake ellipses, hyphens pretending to be em dashes, and inconsistent spacing all show up here.",
            "onboarding.page3.title": "Get Your Crime Score",
            "onboarding.page3.body": "See how clean your typography is, then share the verdict.",
            "onboarding.page4.title": "Learn As You Go",
            "onboarding.page4.body": "Open any issue to see why it matters and how to fix it.",
            "onboarding.start": "Start Investigating",
            "onboarding.sample.not_em_dash": "Not an em dash",
            "onboarding.library.investigate": "Investigate",
            "onboarding.library.study": "Study the rules",
            "analysis.failed_title": "Analysis Failed",
            "analysis.failed_body": "Something went wrong during the scan. Please try again.",
            "analysis.status.scan": "Scanning for typographic evidence…",
            "analysis.status.quotes": "Checking quotation marks…",
            "analysis.status.dashes": "Checking dash usage…",
            "analysis.status.ellipsis": "Checking ellipses…",
            "analysis.status.spacing": "Checking spacing consistency…",
            "analysis.status.layout": "Checking widows and orphans…",
            "analysis.status.comic_sans": "Checking font metadata…",
            "analysis.status.compiling": "Compiling report…",
            "mugshot.title": "Flagged for typographic misconduct",
            "mugshot.body": "Comic Sans was found in the submitted evidence. In playful contexts it can work, but in most product and editorial settings it reads as a mismatch.",
            "mugshot.continue": "Open Full Report →",
            "report.breakdown": "Crime Breakdown",
            "report.share": "Share Report",
            "report.new_scan": "New Scan",
            "report.close": "Close Report",
            "report.copy_fixed": "Copy Fixed Text",
            "report.copy_fixed_hint": "Copies the current corrected text.",
            "report.clean_title": "Spotless",
            "report.clean_body": "No typographic issues were detected. This text is a model citizen.",
            "report.replace_single_space": "Replace with a single space",
            "report.fixed_text_copied": "Fixed text copied ✓",
            "report.manual_rewrite": "This issue needs a manual rewrite.",
            "report.apply_failed": "Could not apply this fix.",
            "report.issue_fixed": "Issue fixed and report updated ✓",
            "report.learn_more": "Learn more about this issue →",
            "settings.detection_rules": "Detection Rules",
            "settings.scoring": "Scoring",
            "settings.strictness": "Scoring Strictness",
            "settings.dash_style": "Em-dash Style",
            "settings.appearance": "Appearance",
            "settings.theme": "Theme",
            "settings.language": "Language",
            "settings.language.system": "System",
            "settings.haptics": "Haptic Feedback",
            "settings.sounds": "Sound Effects",
            "settings.data": "Data",
            "settings.clear_all": "Clear All Case Files",
            "settings.export_all": "Export All Reports",
            "settings.about": "About",
            "settings.version": "Version",
            "settings.typpo": "Typpo",
            "settings.rate_app": "Rate on App Store",
            "settings.send_feedback": "Send Feedback",
            "settings.privacy": "Privacy Policy",
            "settings.footer": "Made with care and proper curly quotes.",
            "settings.title": "Settings",
            "settings.clear_confirm_title": "Clear all case files?",
            "settings.clear_confirm_message": "This action cannot be undone.",
            "settings.delete_all": "Delete All",
            "settings.about_body": "Forensic analysis for your text. Paste any text, get your score, and share the verdict.",
            "settings.about_placeholder": "This build is fully offline and still uses placeholder release links for the website, privacy policy, and App Store destination.",
            "settings.about_website": "Website: %@",
            "share.title": "Share Report",
            "share.copy_report_image": "Copy Report Image",
            "share.save_to_photos": "Save to Photos",
            "share.copy_report_text": "Copy Report Text",
            "share.photos_needed": "Photos Access Needed",
            "share.open_settings": "Open Settings",
            "share.photos_message": "Photos access is needed to save the report image. Open Settings to grant access.",
            "share.primary.share_text": "Share Text",
            "share.primary.copy_link": "Copy Link",
            "share.primary.share": "Share",
            "share.copied_clipboard": "Copied to clipboard ✓",
            "share.deep_link_copied": "Deep link copied ✓",
            "share.render_failed": "Could not render the report image.",
            "share.saved_photos": "Saved to Photos ✓",
            "share.save_failed": "Could not save the report image.",
            "share.swipe_up": "OPEN THE APP TO ANALYZE YOUR OWN TEXT",
            "share.report_heading": "Typography Report",
            "share.score_prefix": "Score",
            "share.top_issues": "Top issues",
            "brand.wordmark": "TYPO CRIMES",
            "brand.scene_tape": "TYPO CRIME SCENE",
            "brand.scene_tape_full": "TYPO CRIME SCENE — DO NOT CROSS",
            "onboarding.demo_sentence": #"He said "Hello"... and left -- quickly."#,
            "engine.whitespace_only": "Your text contains only whitespace. It is not criminal, but it is suspicious.",
            "engine.non_latin_warning": "Analysis is tuned for Latin-script typography. Some spacing and punctuation rules may not apply to this writing system.",
            "engine.short_text_note": "Widow and orphan detection is less reliable on very short passages.",
            "engine.fix.single_space": "Use a single space after sentence-ending punctuation.",
            "engine.fix.replace_with": "Replace with %@",
            "engine.fix.normalize_spacing": "Normalize sentence spacing throughout the text.",
            "engine.fix.rewrite_widow": "Rewrite or reflow the paragraph to avoid a one-word final line.",
            "engine.fix.rewrite_orphan": "Adjust nearby copy to avoid a tiny carry-over line.",
            "engine.fix.change_font": "Use a more suitable font.",
            "engine.explain.double_space": "This sentence ends with multiple spaces, a typewriter-era convention that does not belong in proportional typography.",
            "engine.explain.straight_quotes": "This quotation mark uses the straight ASCII form instead of directional curly quotes.",
            "engine.explain.hyphen_dash": "This interruption uses hyphen-minus characters instead of a proper dash.",
            "engine.explain.fake_ellipsis": "This run of periods should be replaced with the ellipsis character.",
            "engine.explain.inconsistent_spacing": "This sentence spacing differs from the dominant pattern in the text.",
            "engine.explain.widow": "The paragraph ends with an isolated final-line word, creating a visible widow.",
            "engine.explain.orphan": "This paragraph starts with a very short line after a long preceding paragraph, which likely reads as an orphan.",
            "engine.explain.comic_sans": "Comic Sans metadata was found in the submitted rich text.",
            "engine.explain.prime_marks": "This measurement mark uses an ASCII quote instead of a proper prime symbol.",
            "engine.explain.multiplication_sign": "This dimension uses the letter x where the multiplication sign should appear.",
            "engine.explain.trademark_symbol": "This fallback notation should be replaced with the proper symbol.",
            "category.punctuation": "Punctuation Issues",
            "category.spacing": "Spacing Issues",
            "category.layout": "Layout Issues",
            "category.font": "Font Issues",
            "category.symbol": "Symbol Issues",
            "severity.infraction": "INFRACTION",
            "severity.misdemeanor": "MISDEMEANOR",
            "severity.felony": "FELONY",
            "verdict.clean": "CLEAN",
            "verdict.infraction": "INFRACTION",
            "verdict.misdemeanor": "MISDEMEANOR",
            "verdict.felony": "FELONY",
            "verdict.capital": "CAPITAL OFFENSE",
            "strictness.lenient": "Lenient",
            "strictness.standard": "Standard",
            "strictness.strict": "Strict",
            "theme.system": "System",
            "theme.light": "Light",
            "theme.dark": "Dark",
            "dash.spaced": "Spaced",
            "dash.closed": "Closed",
            "share_format.image": "Image",
            "share_format.story": "Story",
            "share_format.landscape": "Landscape",
            "share_format.text": "Plain Text",
            "share_format.link": "Copy Link",
            "share_format_desc.image": "PNG image optimized for social feeds.",
            "share_format_desc.story": "1080×1920 story-ready report.",
            "share_format_desc.landscape": "Wide card for article and social previews.",
            "share_format_desc.text": "Formatted textual summary.",
            "share_format_desc.link": "Placeholder deep link copy.",
            "evidence_source.typed": "Typed",
            "evidence_source.pasted": "Pasted",
            "evidence_source.pasted_rich": "Pasted Rich Text"
            ,"toast.load_failed": "Could not load saved case files."
            ,"toast.save_failed": "Could not save the case file."
            ,"toast.delete_failed": "Deletion failed."
            ,"toast.cleared": "All case files cleared."
            ,"toast.clear_failed": "Could not clear case files."
            ,"toast.export_failed": "Export failed."
        ]

    static let englishPack = LocalizationPack(
        ui: englishUI,
        verdictShortLabels: [
            .clean: "Cln.",
            .infraction: "Inf.",
            .misdemeanor: "Msd.",
            .felony: "Fel.",
            .capitalOffense: "Cap."
        ],
        crimeCategoryTitles: [
            .punctuation: "Punctuation Issues",
            .spacing: "Spacing Issues",
            .layout: "Layout Issues",
            .font: "Font Issues",
            .symbol: "Symbol Issues"
        ],
        crimeTypeTitles: [
            .doubleSpace: "Double Spaces",
            .straightQuotes: "Straight Quotes",
            .hyphenAsDash: "Hyphen as Dash",
            .fakeEllipsis: "Fake Ellipsis",
            .widow: "Widows",
            .orphan: "Orphans",
            .inconsistentSpacing: "Inconsistent Spacing",
            .comicSans: "Comic Sans",
            .primeMarks: "Prime Marks",
            .multiplicationSign: "Wrong Multiplication Sign",
            .trademarkSymbol: "Trademark Symbol Misuse"
        ],
        crimeTypeDescriptions: [
            .doubleSpace: "Extra spaces after sentence-ending punctuation.",
            .straightQuotes: "ASCII quotes used where curly quotes belong.",
            .hyphenAsDash: "Hyphens standing in for a real dash.",
            .fakeEllipsis: "Three periods used instead of the ellipsis character.",
            .widow: "A final line left with only one short word.",
            .orphan: "A tiny carry-over line at the start of a paragraph.",
            .inconsistentSpacing: "Mixed sentence-spacing styles in one text.",
            .comicSans: "Comic Sans detected in the submitted evidence.",
            .primeMarks: "ASCII quotes used where prime symbols belong.",
            .multiplicationSign: "The letter x used instead of ×.",
            .trademarkSymbol: "Fallback notation used instead of ©, ®, or ™."
        ],
        articles: [
            .doubleSpace: .init(
                overview: "Double spaces after a sentence come from typewriter habits. In modern proportional type, one space is the cleaner default.",
                whyItMatters: "Extra spaces create uneven rhythm and visible gaps in a paragraph.",
                history: "Typewriters used fixed-width characters, so extra spacing once helped readers see sentence breaks.",
                fixSteps: [
                    "Search for repeated spaces after punctuation.",
                    "Run a quick clean-up pass before sharing.",
                    "If double spaces are intentional, keep them consistent."
                ]
            ),
            .straightQuotes: .init(
                overview: "Straight quotes are plain ASCII marks. Finished text usually reads better with directional curly quotes.",
                whyItMatters: "Curly quotes look more polished and improve the visual rhythm of a sentence.",
                history: "Early keyboards and character sets kept only one simple quote mark for both directions.",
                fixSteps: [
                    "Turn on smart punctuation where available.",
                    "Clean up text pasted from plain-text sources.",
                    "Check measurements so prime marks stay correct."
                ]
            ),
            .hyphenAsDash: .init(
                overview: "Hyphens join words, but they are not substitutes for em dashes or en dashes.",
                whyItMatters: "The correct dash improves tone, spacing, and readability.",
                history: "Double hyphens were a workaround in systems that could not easily produce rich punctuation.",
                fixSteps: [
                    "Use the real dash character your style requires.",
                    "Keep hyphens for compounds, not sentence breaks.",
                    "Stay consistent across the whole document."
                ]
            ),
            .fakeEllipsis: .init(
                overview: "Three periods can mimic an ellipsis, but they are not the same character.",
                whyItMatters: "A real ellipsis has balanced spacing and behaves better in a line of text.",
                history: "Many casual writing workflows still default to typing three periods.",
                fixSteps: [
                    "Replace three periods with the ellipsis character.",
                    "Use text replacement if you type it often.",
                    "Check imported copy before publishing."
                ]
            ),
            .widow: .init(
                overview: "A widow leaves one short word stranded on the last line of a paragraph.",
                whyItMatters: "That weak ending disrupts the shape and rhythm of the paragraph.",
                history: "Editors and designers have long adjusted line breaks to avoid widows in print.",
                fixSteps: [
                    "Tighten or rewrite the sentence slightly.",
                    "Adjust line length if layout tools are available.",
                    "Treat this as a soft style recommendation."
                ]
            ),
            .orphan: .init(
                overview: "An orphan is a tiny carry-over line that starts a new paragraph or text block awkwardly.",
                whyItMatters: "It breaks reading flow and makes the layout feel less considered.",
                history: "Editorial workflows traditionally fix orphans before publication.",
                fixSteps: [
                    "Rewrite a nearby phrase to rebalance the break.",
                    "Open the measure slightly if you control layout.",
                    "Use it as a warning, not a rigid error."
                ]
            ),
            .inconsistentSpacing: .init(
                overview: "Mixing single and double sentence spacing makes the text feel stitched together from different sources.",
                whyItMatters: "Readers notice inconsistency quickly, even when they cannot explain why.",
                history: nil,
                fixSteps: [
                    "Choose one sentence-spacing style.",
                    "Normalize pasted text before sharing it.",
                    "Keep the choice consistent from start to finish."
                ]
            ),
            .comicSans: .init(
                overview: "Comic Sans is not forbidden, but it carries a strong cultural tone that often clashes with serious copy.",
                whyItMatters: "Fonts communicate mood before a reader even processes the words.",
                history: "Comic Sans was designed in 1994 for a children’s software interface and later spread far beyond that context.",
                fixSteps: [
                    "Pick a typeface that fits the message.",
                    "Reserve playful display faces for clearly playful work.",
                    "Disable this detector if the choice is intentional."
                ]
            ),
            .primeMarks: .init(
                overview: "Measurements such as feet, inches, minutes, and seconds often need prime symbols rather than quote marks.",
                whyItMatters: "The correct mark prevents ambiguity and makes technical text look more deliberate.",
                history: nil,
                fixSteps: [
                    "Use prime and double-prime symbols after numerals.",
                    "Watch for automatic smart-quote conversion.",
                    "Check specs, menus, and product dimensions carefully."
                ]
            ),
            .multiplicationSign: .init(
                overview: "The letter x and the multiplication sign are not interchangeable in dimensions.",
                whyItMatters: "Using × gives technical and product copy a cleaner typographic finish.",
                history: nil,
                fixSteps: [
                    "Replace x between numbers with ×.",
                    "Use text replacement for common size formats.",
                    "Review specs and marketing assets for consistency."
                ]
            ),
            .trademarkSymbol: .init(
                overview: "Forms such as (c), (r), and (tm) are fallback notation, not polished final copy.",
                whyItMatters: "The proper symbols save space and make legal or brand text look finished.",
                history: nil,
                fixSteps: [
                    "Replace fallback notation with ©, ®, and ™.",
                    "Check legal and marketing copy before release.",
                    "Keep the spacing around those symbols consistent."
                ]
            )
        ],
        localizedUIKeys: Set(englishUI.keys),
        localizedVerdictKeys: Set(Verdict.allCases),
        localizedCategoryKeys: Set(CrimeCategory.allCases),
        localizedCrimeTypeTitleKeys: Set(CrimeType.allCases),
        localizedCrimeTypeDescriptionKeys: Set(CrimeType.allCases),
        localizedArticleKeys: Set(CrimeType.allCases)
    )

    static func makePack(
        language: AppLanguage,
        ui: [String: String],
        verdictShortLabels: [Verdict: String],
        crimeCategoryTitles: [CrimeCategory: String],
        crimeTypeTitles: [CrimeType: String],
        crimeTypeDescriptions: [CrimeType: String],
        articles: [CrimeType: LocalizedArticleCopy] = [:]
    ) -> LocalizationPack {
        let localizedUI = ui.merging(uiOverrides(for: language)) { _, new in new }

        return LocalizationPack(
            ui: englishPack.ui.merging(localizedUI) { _, new in new },
            verdictShortLabels: englishPack.verdictShortLabels.merging(verdictShortLabels) { _, new in new },
            crimeCategoryTitles: englishPack.crimeCategoryTitles.merging(crimeCategoryTitles) { _, new in new },
            crimeTypeTitles: englishPack.crimeTypeTitles.merging(crimeTypeTitles) { _, new in new },
            crimeTypeDescriptions: englishPack.crimeTypeDescriptions.merging(crimeTypeDescriptions) { _, new in new },
            articles: articles,
            localizedUIKeys: Set(localizedUI.keys),
            localizedVerdictKeys: Set(verdictShortLabels.keys),
            localizedCategoryKeys: Set(crimeCategoryTitles.keys),
            localizedCrimeTypeTitleKeys: Set(crimeTypeTitles.keys),
            localizedCrimeTypeDescriptionKeys: Set(crimeTypeDescriptions.keys),
            localizedArticleKeys: Set(articles.keys)
        )
    }

    private static func uiOverrides(for language: AppLanguage) -> [String: String] {
        onboardingOverrides(for: language).merging(settingsOverrides(for: language)) { _, new in new }
    }

    private static func settingsOverrides(for language: AppLanguage) -> [String: String] {
        switch language {
        case .en:
            [:]
        case .zhHans:
            [
                "settings.language": "语言",
                "settings.language.system": "跟随系统",
            ]
        case .ja:
            [
                "settings.language": "言語",
                "settings.language.system": "システム",
            ]
        case .ko:
            [
                "settings.language": "언어",
                "settings.language.system": "시스템",
            ]
        case .de:
            [
                "settings.language": "Sprache",
                "settings.language.system": "System",
            ]
        case .fr:
            [
                "settings.language": "Langue",
                "settings.language.system": "Système",
            ]
        case .es:
            [
                "settings.language": "Idioma",
                "settings.language.system": "Sistema",
            ]
        case .ptBR:
            [
                "settings.language": "Idioma",
                "settings.language.system": "Sistema",
            ]
        case .ar:
            [
                "settings.language": "اللغة",
                "settings.language.system": "النظام",
            ]
        case .ru:
            [
                "settings.language": "Язык",
                "settings.language.system": "Система",
            ]
        case .it:
            [
                "settings.language": "Lingua",
                "settings.language.system": "Sistema",
            ]
        case .nl:
            [
                "settings.language": "Taal",
                "settings.language.system": "Systeem",
            ]
        case .tr:
            [
                "settings.language": "Dil",
                "settings.language.system": "Sistem",
            ]
        case .th:
            [
                "settings.language": "ภาษา",
                "settings.language.system": "ตามระบบ",
            ]
        case .vi:
            [
                "settings.language": "Ngôn ngữ",
                "settings.language.system": "Theo hệ thống",
            ]
        case .id:
            [
                "settings.language": "Bahasa",
                "settings.language.system": "Sistem",
            ]
        case .pl:
            [
                "settings.language": "Język",
                "settings.language.system": "System",
            ]
        case .uk:
            [
                "settings.language": "Мова",
                "settings.language.system": "Система",
            ]
        case .hi:
            [
                "settings.language": "भाषा",
                "settings.language.system": "सिस्टम",
            ]
        case .he:
            [
                "settings.language": "שפה",
                "settings.language.system": "מערכת",
            ]
        case .sv:
            [
                "settings.language": "Språk",
                "settings.language.system": "System",
            ]
        case .no:
            [
                "settings.language": "Språk",
                "settings.language.system": "System",
            ]
        case .da:
            [
                "settings.language": "Sprog",
                "settings.language.system": "System",
            ]
        case .fi:
            [
                "settings.language": "Kieli",
                "settings.language.system": "Järjestelmä",
            ]
        case .cs:
            [
                "settings.language": "Jazyk",
                "settings.language.system": "Systém",
            ]
        case .hu:
            [
                "settings.language": "Nyelv",
                "settings.language.system": "Rendszer",
            ]
        case .ro:
            [
                "settings.language": "Limbă",
                "settings.language.system": "Sistem",
            ]
        case .el:
            [
                "settings.language": "Γλώσσα",
                "settings.language.system": "Σύστημα",
            ]
        case .ms:
            [
                "settings.language": "Bahasa",
                "settings.language.system": "Sistem",
            ]
        }
    }

    static func uiMap(_ source: String) -> [String: String] {
        parseStringMap(source)
    }

    static func verdictMap(_ source: String) -> [Verdict: String] {
        Dictionary(
            uniqueKeysWithValues: parseStringMap(source).compactMap { key, value in
                Verdict(rawValue: key).map { ($0, value) }
            }
        )
    }

    static func categoryMap(_ source: String) -> [CrimeCategory: String] {
        Dictionary(
            uniqueKeysWithValues: parseStringMap(source).compactMap { key, value in
                CrimeCategory(rawValue: key).map { ($0, value) }
            }
        )
    }

    static func crimeTypeMap(_ source: String) -> [CrimeType: String] {
        Dictionary(
            uniqueKeysWithValues: parseStringMap(source).compactMap { key, value in
                CrimeType(rawValue: key).map { ($0, value) }
            }
        )
    }

    static func articleMap(
        _ entries: [(CrimeType, String, String, String?, String?, String?, [String])]
    ) -> [CrimeType: LocalizedArticleCopy] {
        Dictionary(
            uniqueKeysWithValues: entries.map { crimeType, overview, whyItMatters, history, wrongExample, rightExample, fixSteps in
                (
                    crimeType,
                    LocalizedArticleCopy(
                        overview: overview,
                        whyItMatters: whyItMatters,
                        history: history,
                        wrongExample: wrongExample,
                        rightExample: rightExample,
                        fixSteps: fixSteps
                    )
                )
            }
        )
    }

    private static func onboardingOverrides(for language: AppLanguage) -> [String: String] {
        switch language {
        case .en:
            [:]
        case .zhHans:
            uiMap("""
onboarding.welcome.title|每个字形都有讲究
onboarding.welcome.subtitle|Typpo 能揪出拼写检查发现不了的排版问题。
onboarding.welcome.cta|开始检查
onboarding.role.title|你为什么来到 Typpo？
onboarding.role.subtitle|这能帮我们调整你的体验。
onboarding.role.designer|设计师
onboarding.role.designer.sub|我在意像素和版式
onboarding.role.writer|写作者
onboarding.role.writer.sub|我很在意文字的读感
onboarding.role.developer|开发者
onboarding.role.developer.sub|我做带文字的产品
onboarding.role.student|学生
onboarding.role.student.sub|我还在学这门手艺
onboarding.role.other|其他
onboarding.role.other.sub|我只是对排版好奇
onboarding.crimes.title|哪些问题最让你受不了？
onboarding.crimes.subtitle|可多选，之后也能改。
onboarding.crimes.skip|全部都检查
onboarding.social.title|你并不孤单
onboarding.social.subtitle|设计师、编辑和排版爱好者每天都在用 Typpo。
onboarding.social.quote1|终于有个工具，能把编辑总会挑出来的弯引号问题先抓出来了。
onboarding.social.author1|Sarah K.，文字编辑
onboarding.social.quote2|我每次把客户稿件发出去前都会先过一遍 Typpo，它已经不止一次帮我避免尴尬。
onboarding.social.author2|Marcus T.，品牌设计师
onboarding.strictness.title|希望我们严格到什么程度？
onboarding.strictness.subtitle|之后随时都能在“设置”里调整。
onboarding.strictness.lenient.tag|只抓明显的问题
onboarding.strictness.standard.tag|刚刚好
onboarding.strictness.strict.tag|连细节都别放过
onboarding.strictness.recommended|推荐
onboarding.theme.title|选一个你喜欢的界面
onboarding.demo.title|现在试试看
onboarding.demo.subtitle|随便贴一段文字，看看 Typpo 怎么把问题找出来。
onboarding.demo.placeholder|在这里粘贴或输入文字…
onboarding.demo.use_sample|使用示例文本
onboarding.demo.analyze|分析文本
onboarding.demo.results_title|一眼看出来了。
onboarding.demo.results_body|这就是 Typpo 的工作方式，每次粘贴都一样可靠。
onboarding.demo.preview|她说了[["你好"...]] 然后[[--]]匆匆走开。
onboarding.ready.title|可以开始了
onboarding.ready.subtitle|都准备好了。现在去把排版收拾干净吧。
onboarding.ready.cta|开始检查
onboarding.choice.straight_quotes.wrong|"你好"
onboarding.choice.straight_quotes.right|「你好」
onboarding.choice.double_space.wrong|文本  文本
onboarding.choice.double_space.right|文本 文本
onboarding.choice.comic_sans.right|换个更合适的字体
onboarding.welcome.artwork.line1|她说了[["你好"...]]
onboarding.welcome.artwork.line2|然后[[--]]匆匆走开。
onboarding.demo_sentence|她说 "你好"... 然后 -- 匆匆走开。
""")
        case .ja:
            uiMap("""
onboarding.welcome.title|すべての字形は手がかり
onboarding.welcome.subtitle|Typpo は、スペルチェックでは見逃す組版の乱れを見つけます。
onboarding.welcome.cta|チェックを始める
onboarding.role.title|Typpo を使う理由は？
onboarding.role.subtitle|体験を少し合わせるために教えてください。
onboarding.role.designer|デザイナー
onboarding.role.designer.sub|レイアウトの完成度にこだわる
onboarding.role.writer|書き手
onboarding.role.writer.sub|文章の読み心地を大事にする
onboarding.role.developer|開発者
onboarding.role.developer.sub|文字のあるプロダクトを作る
onboarding.role.student|学生
onboarding.role.student.sub|まだ学んでいる途中
onboarding.role.other|その他
onboarding.role.other.sub|単純にタイポが気になる
onboarding.crimes.title|いちばん気になるのはどれですか？
onboarding.crimes.subtitle|複数選択できます。あとで変更もできます。
onboarding.crimes.skip|全部チェックする
onboarding.social.title|仲間はたくさんいます
onboarding.social.subtitle|デザイナーや編集者、文字好きの人たちが毎日 Typpo を使っています。
onboarding.social.quote1|校正でいつも指摘される引用符のミスを、先に拾ってくれるのが本当に助かります。
onboarding.social.author1|Sarah K.、コピーエディター
onboarding.social.quote2|クライアントに送る前に必ず Typpo を通しています。何度も助けられました。
onboarding.social.author2|Marcus T.、ブランドデザイナー
onboarding.strictness.title|どれくらい細かく見ますか？
onboarding.strictness.subtitle|あとから設定でいつでも変えられます。
onboarding.strictness.lenient.tag|大きなものだけ
onboarding.strictness.standard.tag|ちょうどいい厳しさ
onboarding.strictness.strict.tag|細部まで拾う
onboarding.strictness.recommended|おすすめ
onboarding.theme.title|表示テーマを選ぶ
onboarding.demo.title|今すぐ試す
onboarding.demo.subtitle|テキストを貼り付けて、Typpo が問題を見つける様子を見てください。
onboarding.demo.placeholder|ここにテキストを貼り付けるか入力…
onboarding.demo.use_sample|サンプルを使う
onboarding.demo.analyze|テキストを解析
onboarding.demo.results_title|見つかりました。
onboarding.demo.results_body|貼り付けるたびに、Typpo はこんなふうに働きます。
onboarding.demo.preview|彼は[["こんにちは"...]]と言い、[[--]]すぐに立ち去った。
onboarding.ready.title|準備完了です
onboarding.ready.subtitle|これで OK。タイポグラフィを整えにいきましょう。
onboarding.ready.cta|チェックを始める
onboarding.choice.straight_quotes.wrong|"こんにちは"
onboarding.choice.straight_quotes.right|「こんにちは」
onboarding.choice.double_space.wrong|文字  文字
onboarding.choice.double_space.right|文字 文字
onboarding.choice.comic_sans.right|もっと合う書体にする
onboarding.welcome.artwork.line1|彼は[["こんにちは"...]]と言った。
onboarding.welcome.artwork.line2|そして[[--]]すぐに立ち去った。
onboarding.demo_sentence|彼は "こんにちは"... と言って -- すぐに立ち去った。
""")
        case .ko:
            uiMap("""
onboarding.welcome.title|모든 글리프에는 단서가 있다
onboarding.welcome.subtitle|Typpo는 맞춤법 검사기가 놓치는 타이포 문제를 찾아냅니다.
onboarding.welcome.cta|검사 시작
onboarding.role.title|Typpo를 찾은 이유가 뭔가요?
onboarding.role.subtitle|조금 더 맞는 경험을 보여드리기 위해서예요.
onboarding.role.designer|디자이너
onboarding.role.designer.sub|레이아웃 완성도에 민감해요
onboarding.role.writer|작성자
onboarding.role.writer.sub|문장이 읽히는 느낌을 챙겨요
onboarding.role.developer|개발자
onboarding.role.developer.sub|텍스트가 있는 제품을 만들어요
onboarding.role.student|학생
onboarding.role.student.sub|아직 배우는 중이에요
onboarding.role.other|기타
onboarding.role.other.sub|그냥 타이포가 궁금해요
onboarding.crimes.title|가장 거슬리는 문제는 무엇인가요?
onboarding.crimes.subtitle|여러 개 선택할 수 있고 나중에 바꿀 수도 있어요.
onboarding.crimes.skip|전부 검사하기
onboarding.social.title|당신만 그런 게 아니에요
onboarding.social.subtitle|디자이너와 에디터, 타이포 애호가들이 매일 Typpo를 씁니다.
onboarding.social.quote1|편집자가 늘 잡아내던 따옴표 실수를 먼저 걸러줘서 정말 좋았어요.
onboarding.social.author1|Sarah K., 카피 에디터
onboarding.social.quote2|클라이언트에게 보내기 전에 항상 Typpo를 한 번 돌립니다. 민망한 실수를 여러 번 막아줬어요.
onboarding.social.author2|Marcus T., 브랜드 디자이너
onboarding.strictness.title|어느 정도로 엄격하게 볼까요?
onboarding.strictness.subtitle|나중에 설정에서 언제든 바꿀 수 있어요.
onboarding.strictness.lenient.tag|눈에 띄는 것만
onboarding.strictness.standard.tag|가장 균형이 좋아요
onboarding.strictness.strict.tag|디테일까지 놓치지 않기
onboarding.strictness.recommended|추천
onboarding.theme.title|원하는 분위기를 골라보세요
onboarding.demo.title|바로 체험해보기
onboarding.demo.subtitle|아무 텍스트나 붙여 넣고 Typpo가 문제를 잡아내는 걸 보세요.
onboarding.demo.placeholder|여기에 텍스트를 붙여 넣거나 입력하세요…
onboarding.demo.use_sample|샘플 텍스트 사용
onboarding.demo.analyze|텍스트 분석
onboarding.demo.results_title|바로 잡아냈어요.
onboarding.demo.results_body|텍스트를 붙여 넣을 때마다 Typpo는 이렇게 작동합니다.
onboarding.demo.preview|그가[["안녕"...]]이라고 말하고 [[--]]급히 떠났다.
onboarding.ready.title|준비됐어요
onboarding.ready.subtitle|이제 시작하면 됩니다. 타이포를 한 번 정리해보죠.
onboarding.ready.cta|검사 시작
onboarding.choice.straight_quotes.wrong|"안녕"
onboarding.choice.straight_quotes.right|“안녕”
onboarding.choice.double_space.wrong|텍스트  텍스트
onboarding.choice.double_space.right|텍스트 텍스트
onboarding.choice.comic_sans.right|더 어울리는 글꼴로 바꾸기
onboarding.welcome.artwork.line1|그가[["안녕"...]]이라고 말했다.
onboarding.welcome.artwork.line2|그리고[[--]]급히 떠났다.
onboarding.demo_sentence|그가 "안녕"... 이라고 말하고 -- 급히 떠났다.
""")
        case .de:
            uiMap("""
onboarding.welcome.title|Jede Glyphe ist ein Hinweis
onboarding.welcome.subtitle|Typpo findet typografische Patzer, die der Spellcheck übersieht.
onboarding.welcome.cta|Prüfung starten
onboarding.role.title|Was bringt dich zu Typpo?
onboarding.role.subtitle|So können wir das Erlebnis besser auf dich zuschneiden.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Ich achte auf Layout bis ins Detail
onboarding.role.writer|Autor
onboarding.role.writer.sub|Mir ist wichtig, wie Text klingt
onboarding.role.developer|Entwickler
onboarding.role.developer.sub|Ich baue Produkte mit viel Text
onboarding.role.student|Student
onboarding.role.student.sub|Ich lerne das Handwerk noch
onboarding.role.other|Andere
onboarding.role.other.sub|Ich bin einfach typografieneugierig
onboarding.crimes.title|Welche Fehler stören dich am meisten?
onboarding.crimes.subtitle|Mehrfachauswahl ist möglich. Später kannst du das ändern.
onboarding.crimes.skip|Alles prüfen
onboarding.social.title|Du bist in guter Gesellschaft
onboarding.social.subtitle|Designer, Lektorinnen und Typo-Nerds nutzen Typpo jeden Tag.
onboarding.social.quote1|Endlich ein Tool, das die Anführungszeichenfehler erwischt, die meine Redaktion sonst immer findet.
onboarding.social.author1|Sarah K., Copy-Editorin
onboarding.social.quote2|Bevor etwas an Kundinnen rausgeht, läuft es einmal durch Typpo. Das hat mir schon mehrfach Peinlichkeiten erspart.
onboarding.social.author2|Marcus T., Brand Designer
onboarding.strictness.title|Wie streng sollen wir sein?
onboarding.strictness.subtitle|Das kannst du später jederzeit in den Einstellungen ändern.
onboarding.strictness.lenient.tag|Nur die groben Schnitzer
onboarding.strictness.standard.tag|Genau die richtige Schärfe
onboarding.strictness.strict.tag|Jedes Detail mitnehmen
onboarding.strictness.recommended|Empfohlen
onboarding.theme.title|Wähle deinen Look
onboarding.demo.title|Jetzt ausprobieren
onboarding.demo.subtitle|Füge einen Text ein und sieh zu, wie Typpo die Probleme markiert.
onboarding.demo.placeholder|Text hier einfügen oder eingeben…
onboarding.demo.use_sample|Beispieltext verwenden
onboarding.demo.analyze|Text analysieren
onboarding.demo.results_title|Treffer.
onboarding.demo.results_body|Genau so arbeitet Typpo jedes Mal, wenn du Text einfügst.
onboarding.demo.preview|Sie sagte[["Hallo"...]] und ging [[--]] schnell weiter.
onboarding.ready.title|Du bist startklar
onboarding.ready.subtitle|Alles eingerichtet. Zeit, die Typografie aufzuräumen.
onboarding.ready.cta|Prüfung starten
onboarding.choice.straight_quotes.wrong|"Hallo"
onboarding.choice.straight_quotes.right|„Hallo“
onboarding.choice.double_space.wrong|Wort  Wort
onboarding.choice.double_space.right|Wort Wort
onboarding.choice.comic_sans.right|Eine passendere Schrift wählen
onboarding.welcome.artwork.line1|Sie sagte[["Hallo"...]]
onboarding.welcome.artwork.line2|und ging [[--]] schnell weiter.
onboarding.demo_sentence|Sie sagte "Hallo"... und ging -- schnell weiter.
""")
        case .fr:
            uiMap("""
onboarding.welcome.title|Chaque glyphe est un indice
onboarding.welcome.subtitle|Typpo repère les faux pas typographiques que le correcteur laisse passer.
onboarding.welcome.cta|Lancer l’analyse
onboarding.role.title|Qu’est-ce qui t’amène sur Typpo ?
onboarding.role.subtitle|Cela nous aide à adapter l’expérience.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Je soigne la mise en page jusque dans le détail
onboarding.role.writer|Rédacteur
onboarding.role.writer.sub|Je fais attention au rythme des mots
onboarding.role.developer|Développeur
onboarding.role.developer.sub|Je livre des produits avec beaucoup de texte
onboarding.role.student|Étudiant
onboarding.role.student.sub|J’apprends encore le métier
onboarding.role.other|Autre
onboarding.role.other.sub|Je suis juste curieux côté typo
onboarding.crimes.title|Quels écarts t’agacent le plus ?
onboarding.crimes.subtitle|Tu peux tout sélectionner et modifier ça plus tard.
onboarding.crimes.skip|Tout surveiller
onboarding.social.title|Tu es bien entouré
onboarding.social.subtitle|Designers, éditeurs et passionnés de typo utilisent Typpo tous les jours.
onboarding.social.quote1|Enfin un outil qui attrape les erreurs de guillemets avant que mon éditrice ne les relève.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Je passe chaque livrable client dans Typpo avant l’envoi. Ça m’a évité plus d’un moment gênant.
onboarding.social.author2|Marcus T., designer de marque
onboarding.strictness.title|À quel point doit-on être strict ?
onboarding.strictness.subtitle|Tu pourras toujours ajuster ça dans Réglages.
onboarding.strictness.lenient.tag|Seulement l’évident
onboarding.strictness.standard.tag|Le bon équilibre
onboarding.strictness.strict.tag|Ne rien laisser passer
onboarding.strictness.recommended|Recommandé
onboarding.theme.title|Choisis ton ambiance
onboarding.demo.title|Essaie maintenant
onboarding.demo.subtitle|Colle un texte et regarde Typpo repérer ce qui cloche.
onboarding.demo.placeholder|Colle ou saisis un texte ici…
onboarding.demo.use_sample|Utiliser l’exemple
onboarding.demo.analyze|Analyser le texte
onboarding.demo.results_title|Affaire réglée.
onboarding.demo.results_body|C’est exactement comme ça que Typpo travaille, à chaque collage.
onboarding.demo.preview|Elle a dit[["Bonjour"...]] puis est partie [[--]] vite.
onboarding.ready.title|Tout est prêt
onboarding.ready.subtitle|Tu peux y aller. On va remettre un peu d’ordre dans la typo.
onboarding.ready.cta|Lancer l’analyse
onboarding.choice.straight_quotes.wrong|"Bonjour"
onboarding.choice.straight_quotes.right|« Bonjour »
onboarding.choice.double_space.wrong|mot  mot
onboarding.choice.double_space.right|mot mot
onboarding.choice.comic_sans.right|Choisir une police plus juste
onboarding.welcome.artwork.line1|Elle a dit[["Bonjour"...]]
onboarding.welcome.artwork.line2|puis est partie [[--]] vite.
onboarding.demo_sentence|Elle a dit "Bonjour"... puis est partie -- vite.
""")
        case .es:
            uiMap("""
onboarding.welcome.title|Cada glifo es una pista
onboarding.welcome.subtitle|Typpo detecta los fallos tipográficos que el corrector no ve.
onboarding.welcome.cta|Empezar revisión
onboarding.role.title|¿Qué te trae a Typpo?
onboarding.role.subtitle|Esto nos ayuda a ajustar mejor tu experiencia.
onboarding.role.designer|Diseñador
onboarding.role.designer.sub|Cuido el layout al milímetro
onboarding.role.writer|Redactor
onboarding.role.writer.sub|Me importa cómo suena el texto
onboarding.role.developer|Desarrollador
onboarding.role.developer.sub|Lanzo productos con mucho texto
onboarding.role.student|Estudiante
onboarding.role.student.sub|Sigo aprendiendo el oficio
onboarding.role.other|Otro
onboarding.role.other.sub|Simplemente soy curioso con la tipografía
onboarding.crimes.title|¿Qué problemas te molestan más?
onboarding.crimes.subtitle|Puedes marcar varios. Luego lo cambias si quieres.
onboarding.crimes.skip|Revisarlo todo
onboarding.social.title|Estás en buena compañía
onboarding.social.subtitle|Diseñadores, editores y amantes de la tipografía usan Typpo cada día.
onboarding.social.quote1|Por fin algo que detecta los fallos de comillas curvas antes de que mi editora los señale.
onboarding.social.author1|Sarah K., editora de textos
onboarding.social.quote2|Paso cada entrega para clientes por Typpo antes de enviarla. Ya me ha ahorrado más de una vergüenza.
onboarding.social.author2|Marcus T., diseñador de marca
onboarding.strictness.title|¿Qué tan estrictos debemos ser?
onboarding.strictness.subtitle|Siempre podrás cambiarlo después en Ajustes.
onboarding.strictness.lenient.tag|Solo lo más evidente
onboarding.strictness.standard.tag|El punto justo
onboarding.strictness.strict.tag|Que no se escape nada
onboarding.strictness.recommended|Recomendado
onboarding.theme.title|Elige tu estilo
onboarding.demo.title|Pruébalo ahora
onboarding.demo.subtitle|Pega cualquier texto y mira cómo Typpo encuentra lo que falla.
onboarding.demo.placeholder|Pega o escribe texto aquí…
onboarding.demo.use_sample|Usar texto de muestra
onboarding.demo.analyze|Analizar texto
onboarding.demo.results_title|Caso resuelto.
onboarding.demo.results_body|Así trabaja Typpo cada vez que pegas un texto.
onboarding.demo.preview|Dijo[["Hola"...]] y se fue [[--]] rápido.
onboarding.ready.title|Ya está todo listo
onboarding.ready.subtitle|Todo preparado. Toca poner en orden esa tipografía.
onboarding.ready.cta|Empezar revisión
onboarding.choice.straight_quotes.wrong|"Hola"
onboarding.choice.straight_quotes.right|«Hola»
onboarding.choice.double_space.wrong|texto  texto
onboarding.choice.double_space.right|texto texto
onboarding.choice.comic_sans.right|Usar una tipografía más adecuada
onboarding.welcome.artwork.line1|Dijo[["Hola"...]]
onboarding.welcome.artwork.line2|y se fue [[--]] rápido.
onboarding.demo_sentence|Dijo "Hola"... y se fue -- rápido.
""")
        case .ptBR:
            uiMap("""
onboarding.welcome.title|Cada glifo é uma pista
onboarding.welcome.subtitle|O Typpo encontra os deslizes tipográficos que o corretor deixa passar.
onboarding.welcome.cta|Começar revisão
onboarding.role.title|O que trouxe você ao Typpo?
onboarding.role.subtitle|Isso ajuda a ajustar melhor a sua experiência.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Eu cuido do layout até o último detalhe
onboarding.role.writer|Redator
onboarding.role.writer.sub|Eu ligo para o ritmo do texto
onboarding.role.developer|Desenvolvedor
onboarding.role.developer.sub|Eu lanço produtos cheios de texto
onboarding.role.student|Estudante
onboarding.role.student.sub|Ainda estou aprendendo o ofício
onboarding.role.other|Outro
onboarding.role.other.sub|Só sou curioso com tipografia
onboarding.crimes.title|Quais problemas mais incomodam você?
onboarding.crimes.subtitle|Selecione quantos quiser. Depois dá para mudar.
onboarding.crimes.skip|Vigiar tudo
onboarding.social.title|Você está em boa companhia
onboarding.social.subtitle|Designers, editores e gente obcecada por tipografia usam o Typpo todos os dias.
onboarding.social.quote1|Finalmente um app que pega os erros de aspas antes que minha editora encontre.
onboarding.social.author1|Sarah K., editora de texto
onboarding.social.quote2|Eu passo todo material de cliente pelo Typpo antes de enviar. Já me salvou de constrangimento mais de uma vez.
onboarding.social.author2|Marcus T., designer de marca
onboarding.strictness.title|Quão rígidos devemos ser?
onboarding.strictness.subtitle|Você pode ajustar isso depois em Ajustes.
onboarding.strictness.lenient.tag|Só o que salta aos olhos
onboarding.strictness.standard.tag|Na medida certa
onboarding.strictness.strict.tag|Sem deixar passar nada
onboarding.strictness.recommended|Recomendado
onboarding.theme.title|Escolha o seu visual
onboarding.demo.title|Teste agora
onboarding.demo.subtitle|Cole qualquer texto e veja o Typpo encontrar o que está fora do lugar.
onboarding.demo.placeholder|Cole ou digite um texto aqui…
onboarding.demo.use_sample|Usar texto de exemplo
onboarding.demo.analyze|Analisar texto
onboarding.demo.results_title|Caso encerrado.
onboarding.demo.results_body|É assim que o Typpo trabalha, toda vez que você cola um texto.
onboarding.demo.preview|Ela disse[["Olá"...]] e saiu [[--]] depressa.
onboarding.ready.title|Tudo pronto
onboarding.ready.subtitle|Já está valendo. Hora de dar um trato nessa tipografia.
onboarding.ready.cta|Começar revisão
onboarding.choice.straight_quotes.wrong|"Olá"
onboarding.choice.straight_quotes.right|“Olá”
onboarding.choice.double_space.wrong|texto  texto
onboarding.choice.double_space.right|texto texto
onboarding.choice.comic_sans.right|Trocar por uma fonte mais adequada
onboarding.welcome.artwork.line1|Ela disse[["Olá"...]]
onboarding.welcome.artwork.line2|e saiu [[--]] depressa.
onboarding.demo_sentence|Ela disse "Olá"... e saiu -- depressa.
""")
        case .ar:
            uiMap("""
onboarding.welcome.title|كل غليف يحمل دليلاً
onboarding.welcome.subtitle|Typpo يلتقط هفوات الطباعة التي يفوتها التدقيق الإملائي.
onboarding.welcome.cta|ابدأ الفحص
onboarding.role.title|ما الذي جاء بك إلى Typpo؟
onboarding.role.subtitle|هذا يساعدنا على تهيئة التجربة لك بشكل أفضل.
onboarding.role.designer|مصمم
onboarding.role.designer.sub|أهتم بالدقة في الترتيب
onboarding.role.writer|كاتب
onboarding.role.writer.sub|يهمني وقع الكلمات على القارئ
onboarding.role.developer|مطور
onboarding.role.developer.sub|أبني منتجات مليئة بالنصوص
onboarding.role.student|طالب
onboarding.role.student.sub|ما زلت أتعلم المهنة
onboarding.role.other|أخرى
onboarding.role.other.sub|أنا فقط فضولي تجاه الطباعة
onboarding.crimes.title|ما أكثر الأخطاء التي تزعجك؟
onboarding.crimes.subtitle|يمكنك اختيار أكثر من خيار، ويمكن تغييره لاحقًا.
onboarding.crimes.skip|راقب كل شيء
onboarding.social.title|أنت بين أهل الخبرة
onboarding.social.subtitle|مصممون ومحررون وعشاق الطباعة يستخدمون Typpo كل يوم.
onboarding.social.quote1|أخيرًا أداة تلتقط أخطاء علامات الاقتباس قبل أن تصل إليها عين المحرر.
onboarding.social.author1|Sarah K.، محررة نصوص
onboarding.social.quote2|أمرّر كل تسليم للعميل عبر Typpo قبل الإرسال، وقد أنقذني من مواقف محرجة أكثر من مرة.
onboarding.social.author2|Marcus T.، مصمم هوية
onboarding.strictness.title|كم تريدنا أن نكون صارمين؟
onboarding.strictness.subtitle|يمكنك تعديل ذلك لاحقًا من الإعدادات.
onboarding.strictness.lenient.tag|فقط الواضح منها
onboarding.strictness.standard.tag|التوازن المناسب
onboarding.strictness.strict.tag|لا تدع شيئًا يفلت
onboarding.strictness.recommended|موصى به
onboarding.theme.title|اختر الشكل الذي يناسبك
onboarding.demo.title|جرّبه الآن
onboarding.demo.subtitle|ألصق أي نص وشاهد كيف يكتشف Typpo ما فيه من مشاكل.
onboarding.demo.placeholder|ألصق النص هنا أو اكتب…
onboarding.demo.use_sample|استخدم نصًا تجريبيًا
onboarding.demo.analyze|حلّل النص
onboarding.demo.results_title|اتضح الأمر.
onboarding.demo.results_body|هكذا يعمل Typpo في كل مرة تلصق فيها نصًا.
onboarding.demo.preview|قال[["مرحبا"...]] ثم غادر [[--]] بسرعة.
onboarding.ready.title|أنت جاهز الآن
onboarding.ready.subtitle|تم الإعداد. حان وقت ترتيب هذه الطباعة.
onboarding.ready.cta|ابدأ الفحص
onboarding.choice.straight_quotes.wrong|"مرحبا"
onboarding.choice.straight_quotes.right|«مرحبا»
onboarding.choice.double_space.wrong|نص  نص
onboarding.choice.double_space.right|نص نص
onboarding.choice.comic_sans.right|اختر خطًا أنسب
onboarding.welcome.artwork.line1|قال[["مرحبا"...]]
onboarding.welcome.artwork.line2|ثم غادر [[--]] بسرعة.
onboarding.demo_sentence|قال "مرحبا"... ثم غادر -- بسرعة.
""")
        case .ru:
            uiMap("""
onboarding.welcome.title|Каждый глиф — это улика
onboarding.welcome.subtitle|Typpo находит типографические промахи, которые не видит проверка орфографии.
onboarding.welcome.cta|Начать проверку
onboarding.role.title|Зачем вам Typpo?
onboarding.role.subtitle|Это поможет чуть точнее настроить ваш опыт.
onboarding.role.designer|Дизайнер
onboarding.role.designer.sub|Я замечаю даже мелочи в макете
onboarding.role.writer|Автор
onboarding.role.writer.sub|Мне важно, как звучит текст
onboarding.role.developer|Разработчик
onboarding.role.developer.sub|Я выпускаю продукты с большим количеством текста
onboarding.role.student|Студент
onboarding.role.student.sub|Я еще учусь ремеслу
onboarding.role.other|Другое
onboarding.role.other.sub|Мне просто небезразлична типографика
onboarding.crimes.title|Какие ошибки раздражают вас сильнее всего?
onboarding.crimes.subtitle|Можно выбрать несколько пунктов. Позже это легко изменить.
onboarding.crimes.skip|Проверять всё
onboarding.social.title|Вы в хорошей компании
onboarding.social.subtitle|Дизайнеры, редакторы и любители типографики пользуются Typpo каждый день.
onboarding.social.quote1|Наконец-то инструмент, который ловит ошибки с кавычками раньше моего редактора.
onboarding.social.author1|Sarah K., копирайт-редактор
onboarding.social.quote2|Я прогоняю через Typpo каждый клиентский материал перед отправкой. Не раз спасало от неловких моментов.
onboarding.social.author2|Marcus T., бренд-дизайнер
onboarding.strictness.title|Насколько строго проверять?
onboarding.strictness.subtitle|Позже это можно изменить в настройках.
onboarding.strictness.lenient.tag|Только самое заметное
onboarding.strictness.standard.tag|Оптимальный баланс
onboarding.strictness.strict.tag|Не упускать ни одной детали
onboarding.strictness.recommended|Рекомендуем
onboarding.theme.title|Выберите оформление
onboarding.demo.title|Попробовать сейчас
onboarding.demo.subtitle|Вставьте любой текст и посмотрите, как Typpo находит проблемные места.
onboarding.demo.placeholder|Вставьте текст сюда или начните печатать…
onboarding.demo.use_sample|Использовать пример
onboarding.demo.analyze|Проверить текст
onboarding.demo.results_title|Поймали.
onboarding.demo.results_body|Именно так Typpo работает каждый раз, когда вы вставляете текст.
onboarding.demo.preview|Она сказала[["Привет"...]] и ушла [[--]] очень быстро.
onboarding.ready.title|Всё готово
onboarding.ready.subtitle|Можно начинать. Пора навести порядок в типографике.
onboarding.ready.cta|Начать проверку
onboarding.choice.straight_quotes.wrong|"Привет"
onboarding.choice.straight_quotes.right|«Привет»
onboarding.choice.double_space.wrong|слово  слово
onboarding.choice.double_space.right|слово слово
onboarding.choice.comic_sans.right|Выбрать более подходящий шрифт
onboarding.welcome.artwork.line1|Она сказала[["Привет"...]]
onboarding.welcome.artwork.line2|и ушла [[--]] очень быстро.
onboarding.demo_sentence|Она сказала "Привет"... и ушла -- очень быстро.
""")
        case .it:
            uiMap("""
onboarding.welcome.title|Ogni glifo è un indizio
onboarding.welcome.subtitle|Typpo scova gli scivoloni tipografici che il correttore non vede.
onboarding.welcome.cta|Inizia il controllo
onboarding.role.title|Cosa ti porta su Typpo?
onboarding.role.subtitle|Ci aiuta a rendere l’esperienza più adatta a te.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Curo il layout fino al dettaglio
onboarding.role.writer|Autore
onboarding.role.writer.sub|Mi interessa come suona il testo
onboarding.role.developer|Sviluppatore
onboarding.role.developer.sub|Spedisco prodotti pieni di testo
onboarding.role.student|Studente
onboarding.role.student.sub|Sto ancora imparando il mestiere
onboarding.role.other|Altro
onboarding.role.other.sub|Sono solo curioso di tipografia
onboarding.crimes.title|Quali errori ti danno più fastidio?
onboarding.crimes.subtitle|Puoi selezionarne più di uno. Poi puoi cambiare idea.
onboarding.crimes.skip|Controlla tutto
onboarding.social.title|Sei in buona compagnia
onboarding.social.subtitle|Designer, editor e maniaci della tipografia usano Typpo ogni giorno.
onboarding.social.quote1|Finalmente uno strumento che intercetta gli errori con le virgolette prima della mia editor.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Faccio passare ogni consegna per i clienti dentro Typpo prima di inviarla. Mi ha evitato figuracce più di una volta.
onboarding.social.author2|Marcus T., brand designer
onboarding.strictness.title|Quanto dobbiamo essere severi?
onboarding.strictness.subtitle|Potrai sempre cambiarlo più tardi nelle Impostazioni.
onboarding.strictness.lenient.tag|Solo le cose più evidenti
onboarding.strictness.standard.tag|Il giusto equilibrio
onboarding.strictness.strict.tag|Non lasciar passare nulla
onboarding.strictness.recommended|Consigliato
onboarding.theme.title|Scegli il tuo look
onboarding.demo.title|Provalo subito
onboarding.demo.subtitle|Incolla un testo qualsiasi e guarda come Typpo trova i punti critici.
onboarding.demo.placeholder|Incolla o scrivi qui il testo…
onboarding.demo.use_sample|Usa un testo di esempio
onboarding.demo.analyze|Analizza il testo
onboarding.demo.results_title|Preso.
onboarding.demo.results_body|È così che lavora Typpo ogni volta che incolli un testo.
onboarding.demo.preview|Ha detto[["Ciao"...]] e se n’è andato [[--]] in fretta.
onboarding.ready.title|È tutto pronto
onboarding.ready.subtitle|Ci siamo. È il momento di rimettere in riga la tipografia.
onboarding.ready.cta|Inizia il controllo
onboarding.choice.straight_quotes.wrong|"Ciao"
onboarding.choice.straight_quotes.right|«Ciao»
onboarding.choice.double_space.wrong|testo  testo
onboarding.choice.double_space.right|testo testo
onboarding.choice.comic_sans.right|Scegli un font più adatto
onboarding.welcome.artwork.line1|Ha detto[["Ciao"...]]
onboarding.welcome.artwork.line2|e se n’è andato [[--]] in fretta.
onboarding.demo_sentence|Ha detto "Ciao"... e se n’è andato -- in fretta.
""")
        case .nl:
            uiMap("""
onboarding.welcome.title|Elke glyph is een aanwijzing
onboarding.welcome.subtitle|Typpo vindt typografische missers die spellcheck laat liggen.
onboarding.welcome.cta|Controle starten
onboarding.role.title|Wat brengt je naar Typpo?
onboarding.role.subtitle|Zo kunnen we de ervaring beter op je afstemmen.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Ik let op elk detail in de layout
onboarding.role.writer|Schrijver
onboarding.role.writer.sub|Ik geef om hoe tekst leest
onboarding.role.developer|Developer
onboarding.role.developer.sub|Ik ship producten met veel tekst
onboarding.role.student|Student
onboarding.role.student.sub|Ik leer het vak nog
onboarding.role.other|Anders
onboarding.role.other.sub|Ik ben gewoon typografisch nieuwsgierig
onboarding.crimes.title|Welke fouten storen je het meest?
onboarding.crimes.subtitle|Je kunt meerdere kiezen. Later pas je dit zo aan.
onboarding.crimes.skip|Alles controleren
onboarding.social.title|Je bent in goed gezelschap
onboarding.social.subtitle|Designers, redacteuren en typofans gebruiken Typpo elke dag.
onboarding.social.quote1|Eindelijk een tool die de kromme-aanhalingstekensfouten vangt voordat mijn redacteur dat doet.
onboarding.social.author1|Sarah K., copy-editor
onboarding.social.quote2|Ik haal elke klantoplevering door Typpo voor ik die verstuur. Het heeft me meer dan eens uit de problemen gehouden.
onboarding.social.author2|Marcus T., merkdesigner
onboarding.strictness.title|Hoe streng moeten we zijn?
onboarding.strictness.subtitle|Je kunt dit later altijd aanpassen in Instellingen.
onboarding.strictness.lenient.tag|Alleen het overduidelijke
onboarding.strictness.standard.tag|Precies in balans
onboarding.strictness.strict.tag|Laat niets ontsnappen
onboarding.strictness.recommended|Aanbevolen
onboarding.theme.title|Kies je look
onboarding.demo.title|Probeer het nu
onboarding.demo.subtitle|Plak willekeurige tekst en kijk hoe Typpo de missers eruit pikt.
onboarding.demo.placeholder|Plak of typ hier tekst…
onboarding.demo.use_sample|Voorbeeldtekst gebruiken
onboarding.demo.analyze|Tekst analyseren
onboarding.demo.results_title|Gevonden.
onboarding.demo.results_body|Zo werkt Typpo elke keer dat je tekst plakt.
onboarding.demo.preview|Ze zei[["Hallo"...]] en liep [[--]] snel weg.
onboarding.ready.title|Je bent klaar om te beginnen
onboarding.ready.subtitle|Alles staat klaar. Tijd om die typografie op orde te brengen.
onboarding.ready.cta|Controle starten
onboarding.choice.straight_quotes.wrong|"Hallo"
onboarding.choice.straight_quotes.right|“Hallo”
onboarding.choice.double_space.wrong|tekst  tekst
onboarding.choice.double_space.right|tekst tekst
onboarding.choice.comic_sans.right|Kies een passender lettertype
onboarding.welcome.artwork.line1|Ze zei[["Hallo"...]]
onboarding.welcome.artwork.line2|en liep [[--]] snel weg.
onboarding.demo_sentence|Ze zei "Hallo"... en liep -- snel weg.
""")
        case .tr:
            uiMap("""
onboarding.welcome.title|Her glif bir ipucu
onboarding.welcome.subtitle|Typpo, yazım denetiminin kaçırdığı tipografik hataları yakalar.
onboarding.welcome.cta|İncelemeyi başlat
onboarding.role.title|Seni Typpo’ya getiren ne?
onboarding.role.subtitle|Böylece deneyimi sana daha iyi uyarlayabiliriz.
onboarding.role.designer|Tasarımcı
onboarding.role.designer.sub|Yerleşimdeki en küçük detayı bile önemserim
onboarding.role.writer|Yazar
onboarding.role.writer.sub|Metnin kulağa nasıl geldiği benim için önemli
onboarding.role.developer|Geliştirici
onboarding.role.developer.sub|Bol metinli ürünler çıkarıyorum
onboarding.role.student|Öğrenci
onboarding.role.student.sub|Bu işi hâlâ öğreniyorum
onboarding.role.other|Diğer
onboarding.role.other.sub|Sadece tipografiye meraklıyım
onboarding.crimes.title|En çok hangi hatalar canını sıkıyor?
onboarding.crimes.subtitle|Birden fazlasını seçebilirsin. Sonra da değiştirebilirsin.
onboarding.crimes.skip|Her şeyi tara
onboarding.social.title|İyi bir topluluğun içindesin
onboarding.social.subtitle|Tasarımcılar, editörler ve tipografi meraklıları Typpo’yu her gün kullanıyor.
onboarding.social.quote1|Nihayet editörüm fark etmeden önce tırnak işareti hatalarını yakalayan bir araç.
onboarding.social.author1|Sarah K., metin editörü
onboarding.social.quote2|Müşteriye gidecek her işi göndermeden önce Typpo’dan geçiriyorum. Beni birden fazla kez mahcubiyetten kurtardı.
onboarding.social.author2|Marcus T., marka tasarımcısı
onboarding.strictness.title|Ne kadar sıkı olalım?
onboarding.strictness.subtitle|Bunu daha sonra Ayarlar’dan her zaman değiştirebilirsin.
onboarding.strictness.lenient.tag|Sadece göze çarpanlar
onboarding.strictness.standard.tag|Tam kararında
onboarding.strictness.strict.tag|Hiçbir detayı kaçırma
onboarding.strictness.recommended|Önerilen
onboarding.theme.title|Görünümünü seç
onboarding.demo.title|Hemen dene
onboarding.demo.subtitle|Bir metin yapıştır ve Typpo’nun sorunları nasıl bulduğunu izle.
onboarding.demo.placeholder|Buraya metin yapıştır veya yaz…
onboarding.demo.use_sample|Örnek metni kullan
onboarding.demo.analyze|Metni analiz et
onboarding.demo.results_title|Yakalandı.
onboarding.demo.results_body|Typpo her yapıştırmada tam olarak böyle çalışır.
onboarding.demo.preview|O[["Merhaba"...]] dedi ve [[--]] hızla çıktı.
onboarding.ready.title|Hazırsın
onboarding.ready.subtitle|Her şey tamam. Şimdi tipografiyi toparlama zamanı.
onboarding.ready.cta|İncelemeyi başlat
onboarding.choice.straight_quotes.wrong|"Merhaba"
onboarding.choice.straight_quotes.right|“Merhaba”
onboarding.choice.double_space.wrong|metin  metin
onboarding.choice.double_space.right|metin metin
onboarding.choice.comic_sans.right|Daha uygun bir yazı tipi seç
onboarding.welcome.artwork.line1|O[["Merhaba"...]] dedi.
onboarding.welcome.artwork.line2|Sonra [[--]] hızla çıktı.
onboarding.demo_sentence|O "Merhaba"... dedi ve -- hızla çıktı.
""")
        case .th:
            uiMap("""
onboarding.welcome.title|ทุกตัวอักษรมีเบาะแส
onboarding.welcome.subtitle|Typpo จับปัญหางานตัวพิมพ์ที่ตัวตรวจสะกดมองไม่เห็น
onboarding.welcome.cta|เริ่มตรวจ
onboarding.role.title|อะไรพาคุณมาที่ Typpo?
onboarding.role.subtitle|คำตอบนี้ช่วยให้เราปรับประสบการณ์ให้เหมาะขึ้น
onboarding.role.designer|ดีไซเนอร์
onboarding.role.designer.sub|ฉันใส่ใจกับเลย์เอาต์ทุกจุด
onboarding.role.writer|นักเขียน
onboarding.role.writer.sub|ฉันสนใจจังหวะการอ่านของข้อความ
onboarding.role.developer|นักพัฒนา
onboarding.role.developer.sub|ฉันทำโปรดักต์ที่มีข้อความเยอะ
onboarding.role.student|นักเรียน
onboarding.role.student.sub|ฉันยังเรียนรู้งานนี้อยู่
onboarding.role.other|อื่นๆ
onboarding.role.other.sub|ฉันแค่สนใจเรื่องไทโป
onboarding.crimes.title|ปัญหาแบบไหนกวนใจคุณที่สุด?
onboarding.crimes.subtitle|เลือกได้หลายข้อ และค่อยเปลี่ยนทีหลังก็ได้
onboarding.crimes.skip|ตรวจทุกอย่าง
onboarding.social.title|คุณไม่ได้อยู่คนเดียว
onboarding.social.subtitle|ดีไซเนอร์ บรรณาธิการ และคนรักตัวอักษรใช้ Typpo ทุกวัน
onboarding.social.quote1|ในที่สุดก็มีเครื่องมือที่จับพลาดเรื่องเครื่องหมายคำพูดได้ก่อนที่บรรณาธิการจะทัก
onboarding.social.author1|Sarah K., บรรณาธิการต้นฉบับ
onboarding.social.quote2|ฉันเช็กงานทุกชิ้นก่อนส่งลูกค้าด้วย Typpo มันช่วยฉันจากความเฟลมาหลายครั้งแล้ว
onboarding.social.author2|Marcus T., ดีไซเนอร์แบรนด์
onboarding.strictness.title|อยากให้เราตรวจละเอียดแค่ไหน?
onboarding.strictness.subtitle|คุณปรับภายหลังได้เสมอใน Settings
onboarding.strictness.lenient.tag|เฉพาะจุดที่ชัดๆ
onboarding.strictness.standard.tag|พอดีที่สุด
onboarding.strictness.strict.tag|เก็บทุกจุด
onboarding.strictness.recommended|แนะนำ
onboarding.theme.title|เลือกหน้าตาที่ชอบ
onboarding.demo.title|ลองเลยตอนนี้
onboarding.demo.subtitle|วางข้อความอะไรก็ได้ แล้วดูว่า Typpo หาอะไรเจอบ้าง
onboarding.demo.placeholder|วางหรือพิมพ์ข้อความที่นี่…
onboarding.demo.use_sample|ใช้ข้อความตัวอย่าง
onboarding.demo.analyze|วิเคราะห์ข้อความ
onboarding.demo.results_title|เจอแล้ว
onboarding.demo.results_body|Typpo ทำงานแบบนี้ทุกครั้งที่คุณวางข้อความ
onboarding.demo.preview|เขาพูดว่า[["สวัสดี"...]] แล้วก็เดินออกไป[[--]]เร็วมาก
onboarding.ready.title|พร้อมแล้ว
onboarding.ready.subtitle|ตั้งค่าเรียบร้อย ได้เวลาจัดระเบียบงานตัวพิมพ์แล้ว
onboarding.ready.cta|เริ่มตรวจ
onboarding.choice.straight_quotes.wrong|"สวัสดี"
onboarding.choice.straight_quotes.right|“สวัสดี”
onboarding.choice.double_space.wrong|ข้อความ  ข้อความ
onboarding.choice.double_space.right|ข้อความ ข้อความ
onboarding.choice.comic_sans.right|เปลี่ยนเป็นฟอนต์ที่เหมาะกว่า
onboarding.welcome.artwork.line1|เขาพูดว่า[["สวัสดี"...]]
onboarding.welcome.artwork.line2|แล้วก็เดินออกไป[[--]]เร็วมาก
onboarding.demo_sentence|เขาพูดว่า "สวัสดี"... แล้วก็เดินออกไป -- เร็วมาก
""")
        case .vi:
            uiMap("""
onboarding.welcome.title|Mỗi glyph đều là một manh mối
onboarding.welcome.subtitle|Typpo bắt được những lỗi typography mà kiểm tra chính tả bỏ sót.
onboarding.welcome.cta|Bắt đầu rà soát
onboarding.role.title|Điều gì đưa bạn đến với Typpo?
onboarding.role.subtitle|Câu trả lời này giúp chúng tôi điều chỉnh trải nghiệm phù hợp hơn.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Tôi để ý bố cục đến từng chi tiết
onboarding.role.writer|Người viết
onboarding.role.writer.sub|Tôi quan tâm cảm giác khi câu chữ được đọc lên
onboarding.role.developer|Developer
onboarding.role.developer.sub|Tôi làm sản phẩm có nhiều chữ
onboarding.role.student|Sinh viên
onboarding.role.student.sub|Tôi vẫn đang học nghề
onboarding.role.other|Khác
onboarding.role.other.sub|Tôi chỉ đơn giản là mê typography
onboarding.crimes.title|Những lỗi nào làm bạn khó chịu nhất?
onboarding.crimes.subtitle|Bạn có thể chọn nhiều mục và đổi lại sau.
onboarding.crimes.skip|Kiểm tra tất cả
onboarding.social.title|Bạn đang ở đúng hội rồi
onboarding.social.subtitle|Designer, editor và người mê chữ dùng Typpo mỗi ngày.
onboarding.social.quote1|Cuối cùng cũng có công cụ bắt lỗi dấu ngoặc kép trước cả khi biên tập viên của tôi kịp chỉ ra.
onboarding.social.author1|Sarah K., biên tập nội dung
onboarding.social.quote2|Tôi cho mọi bản giao khách hàng chạy qua Typpo trước khi gửi. Nó đã cứu tôi khỏi vài pha rất ngượng.
onboarding.social.author2|Marcus T., designer thương hiệu
onboarding.strictness.title|Bạn muốn chúng tôi soi kỹ đến mức nào?
onboarding.strictness.subtitle|Bạn luôn có thể đổi lại trong Settings.
onboarding.strictness.lenient.tag|Chỉ bắt lỗi rõ nhất
onboarding.strictness.standard.tag|Vừa đẹp
onboarding.strictness.strict.tag|Không bỏ sót chi tiết nào
onboarding.strictness.recommended|Đề xuất
onboarding.theme.title|Chọn giao diện bạn thích
onboarding.demo.title|Thử ngay
onboarding.demo.subtitle|Dán một đoạn bất kỳ và xem Typpo tìm ra vấn đề thế nào.
onboarding.demo.placeholder|Dán hoặc nhập văn bản tại đây…
onboarding.demo.use_sample|Dùng văn bản mẫu
onboarding.demo.analyze|Phân tích văn bản
onboarding.demo.results_title|Bắt được rồi.
onboarding.demo.results_body|Typpo hoạt động đúng như vậy mỗi khi bạn dán văn bản vào.
onboarding.demo.preview|Anh ấy nói[["Xin chào"...]] rồi bước đi [[--]] rất nhanh.
onboarding.ready.title|Bạn đã sẵn sàng
onboarding.ready.subtitle|Mọi thứ đã ổn. Giờ thì dọn dẹp lại phần typography thôi.
onboarding.ready.cta|Bắt đầu rà soát
onboarding.choice.straight_quotes.wrong|"Xin chào"
onboarding.choice.straight_quotes.right|“Xin chào”
onboarding.choice.double_space.wrong|chữ  chữ
onboarding.choice.double_space.right|chữ chữ
onboarding.choice.comic_sans.right|Chọn font hợp hơn
onboarding.welcome.artwork.line1|Anh ấy nói[["Xin chào"...]]
onboarding.welcome.artwork.line2|rồi bước đi [[--]] rất nhanh.
onboarding.demo_sentence|Anh ấy nói "Xin chào"... rồi bước đi -- rất nhanh.
""")
        case .id:
            uiMap("""
onboarding.welcome.title|Setiap glif punya petunjuk
onboarding.welcome.subtitle|Typpo menangkap salah tipografi yang lolos dari spellcheck.
onboarding.welcome.cta|Mulai cek
onboarding.role.title|Apa yang membawa kamu ke Typpo?
onboarding.role.subtitle|Jawaban ini membantu kami menyesuaikan pengalamanmu.
onboarding.role.designer|Desainer
onboarding.role.designer.sub|Aku peduli pada layout sampai detail kecil
onboarding.role.writer|Penulis
onboarding.role.writer.sub|Aku peduli pada rasa baca sebuah teks
onboarding.role.developer|Developer
onboarding.role.developer.sub|Aku membangun produk yang penuh teks
onboarding.role.student|Pelajar
onboarding.role.student.sub|Aku masih belajar soal ini
onboarding.role.other|Lainnya
onboarding.role.other.sub|Aku cuma penasaran soal tipografi
onboarding.crimes.title|Masalah mana yang paling bikin kamu terganggu?
onboarding.crimes.subtitle|Pilih beberapa kalau perlu. Nanti bisa diubah lagi.
onboarding.crimes.skip|Periksa semuanya
onboarding.social.title|Kamu ada di tempat yang tepat
onboarding.social.subtitle|Desainer, editor, dan pencinta tipografi memakai Typpo setiap hari.
onboarding.social.quote1|Akhirnya ada alat yang menangkap kesalahan tanda kutip sebelum editorku menemukannya.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Setiap materi klien selalu aku lewatkan ke Typpo sebelum dikirim. Sudah beberapa kali menyelamatkanku dari momen memalukan.
onboarding.social.author2|Marcus T., desainer brand
onboarding.strictness.title|Seberapa ketat kita harus memeriksa?
onboarding.strictness.subtitle|Nanti kamu bisa ubah kapan saja di Settings.
onboarding.strictness.lenient.tag|Yang jelas-jelas saja
onboarding.strictness.standard.tag|Pas
onboarding.strictness.strict.tag|Jangan biarkan detail lolos
onboarding.strictness.recommended|Rekomendasi
onboarding.theme.title|Pilih tampilanmu
onboarding.demo.title|Coba sekarang
onboarding.demo.subtitle|Tempel teks apa saja dan lihat bagaimana Typpo menemukan yang janggal.
onboarding.demo.placeholder|Tempel atau ketik teks di sini…
onboarding.demo.use_sample|Gunakan teks contoh
onboarding.demo.analyze|Analisis teks
onboarding.demo.results_title|Ketemu.
onboarding.demo.results_body|Begitulah Typpo bekerja setiap kali kamu menempelkan teks.
onboarding.demo.preview|Dia bilang[["Halo"...]] lalu pergi [[--]] cepat sekali.
onboarding.ready.title|Semuanya siap
onboarding.ready.subtitle|Sudah beres. Saatnya merapikan tipografinya.
onboarding.ready.cta|Mulai cek
onboarding.choice.straight_quotes.wrong|"Halo"
onboarding.choice.straight_quotes.right|“Halo”
onboarding.choice.double_space.wrong|teks  teks
onboarding.choice.double_space.right|teks teks
onboarding.choice.comic_sans.right|Pilih font yang lebih pas
onboarding.welcome.artwork.line1|Dia bilang[["Halo"...]]
onboarding.welcome.artwork.line2|lalu pergi [[--]] cepat sekali.
onboarding.demo_sentence|Dia bilang "Halo"... lalu pergi -- cepat sekali.
""")
        case .pl:
            uiMap("""
onboarding.welcome.title|Każdy glif to trop
onboarding.welcome.subtitle|Typpo wyłapuje typograficzne potknięcia, których nie widzi sprawdzanie pisowni.
onboarding.welcome.cta|Zacznij sprawdzanie
onboarding.role.title|Co sprowadza Cię do Typpo?
onboarding.role.subtitle|To pomoże nam lepiej dopasować aplikację do Ciebie.
onboarding.role.designer|Projektant
onboarding.role.designer.sub|Zwracam uwagę na układ co do piksela
onboarding.role.writer|Autor
onboarding.role.writer.sub|Dbam o to, jak tekst się czyta
onboarding.role.developer|Programista
onboarding.role.developer.sub|Tworzę produkty pełne tekstu
onboarding.role.student|Student
onboarding.role.student.sub|Wciąż uczę się tego rzemiosła
onboarding.role.other|Inne
onboarding.role.other.sub|Po prostu ciekawi mnie typografia
onboarding.crimes.title|Które błędy drażnią Cię najbardziej?
onboarding.crimes.subtitle|Możesz zaznaczyć kilka. Później łatwo to zmienisz.
onboarding.crimes.skip|Sprawdzaj wszystko
onboarding.social.title|Jesteś w dobrym towarzystwie
onboarding.social.subtitle|Projektanci, redaktorzy i typograficzne świry używają Typpo codziennie.
onboarding.social.quote1|Wreszcie narzędzie, które wyłapuje błędy w cudzysłowach, zanim zrobi to moja redaktorka.
onboarding.social.author1|Sarah K., redaktorka tekstu
onboarding.social.quote2|Przepuszczam przez Typpo każdy materiał dla klienta przed wysyłką. Niejeden raz uratowało mnie to przed wpadką.
onboarding.social.author2|Marcus T., projektant marki
onboarding.strictness.title|Jak dokładnie mamy sprawdzać?
onboarding.strictness.subtitle|Później zawsze zmienisz to w Ustawieniach.
onboarding.strictness.lenient.tag|Tylko najbardziej oczywiste
onboarding.strictness.standard.tag|Złoty środek
onboarding.strictness.strict.tag|Nie przepuszczaj niczego
onboarding.strictness.recommended|Polecane
onboarding.theme.title|Wybierz swój styl
onboarding.demo.title|Wypróbuj teraz
onboarding.demo.subtitle|Wklej dowolny tekst i zobacz, jak Typpo znajduje problematyczne miejsca.
onboarding.demo.placeholder|Wklej lub wpisz tekst tutaj…
onboarding.demo.use_sample|Użyj tekstu przykładowego
onboarding.demo.analyze|Przeanalizuj tekst
onboarding.demo.results_title|Mamy to.
onboarding.demo.results_body|Tak właśnie Typpo działa przy każdym wklejeniu tekstu.
onboarding.demo.preview|Powiedziała[["Cześć"...]] i wyszła [[--]] bardzo szybko.
onboarding.ready.title|Wszystko gotowe
onboarding.ready.subtitle|Możesz zaczynać. Czas doprowadzić typografię do porządku.
onboarding.ready.cta|Zacznij sprawdzanie
onboarding.choice.straight_quotes.wrong|"Cześć"
onboarding.choice.straight_quotes.right|„Cześć”
onboarding.choice.double_space.wrong|tekst  tekst
onboarding.choice.double_space.right|tekst tekst
onboarding.choice.comic_sans.right|Wybierz lepiej dopasowany krój
onboarding.welcome.artwork.line1|Powiedziała[["Cześć"...]]
onboarding.welcome.artwork.line2|i wyszła [[--]] bardzo szybko.
onboarding.demo_sentence|Powiedziała "Cześć"... i wyszła -- bardzo szybko.
""")
        case .uk:
            uiMap("""
onboarding.welcome.title|Кожен гліф — це підказка
onboarding.welcome.subtitle|Typpo знаходить типографічні огріхи, які пропускає перевірка правопису.
onboarding.welcome.cta|Почати перевірку
onboarding.role.title|Що привело вас у Typpo?
onboarding.role.subtitle|Це допоможе нам краще підлаштувати досвід під вас.
onboarding.role.designer|Дизайнер
onboarding.role.designer.sub|Я уважний до макета до дрібниць
onboarding.role.writer|Автор
onboarding.role.writer.sub|Мені важливо, як читається текст
onboarding.role.developer|Розробник
onboarding.role.developer.sub|Я створюю продукти, де багато тексту
onboarding.role.student|Студент
onboarding.role.student.sub|Я ще вчуся ремесла
onboarding.role.other|Інше
onboarding.role.other.sub|Мені просто небайдужа типографіка
onboarding.crimes.title|Які помилки дратують вас найбільше?
onboarding.crimes.subtitle|Можна вибрати кілька пунктів. Згодом це легко змінити.
onboarding.crimes.skip|Перевіряти все
onboarding.social.title|Ви в хорошій компанії
onboarding.social.subtitle|Дизайнери, редактори й фанати типографіки користуються Typpo щодня.
onboarding.social.quote1|Нарешті інструмент, який ловить помилки з лапками раніше за мого редактора.
onboarding.social.author1|Sarah K., редакторка тексту
onboarding.social.quote2|Я проганяю через Typpo кожен клієнтський матеріал перед відправкою. Це вже не раз рятувало мене від незручностей.
onboarding.social.author2|Marcus T., бренд-дизайнер
onboarding.strictness.title|Наскільки прискіпливо перевіряти?
onboarding.strictness.subtitle|Пізніше це завжди можна змінити в налаштуваннях.
onboarding.strictness.lenient.tag|Лише очевидне
onboarding.strictness.standard.tag|Золота середина
onboarding.strictness.strict.tag|Не пропускати деталей
onboarding.strictness.recommended|Рекомендуємо
onboarding.theme.title|Оберіть оформлення
onboarding.demo.title|Спробувати зараз
onboarding.demo.subtitle|Вставте будь-який текст і подивіться, як Typpo знаходить слабкі місця.
onboarding.demo.placeholder|Вставте текст сюди або почніть друкувати…
onboarding.demo.use_sample|Використати приклад
onboarding.demo.analyze|Перевірити текст
onboarding.demo.results_title|Знайшли.
onboarding.demo.results_body|Саме так Typpo працює щоразу, коли ви вставляєте текст.
onboarding.demo.preview|Вона сказала[["Привіт"...]] і пішла [[--]] дуже швидко.
onboarding.ready.title|Усе готово
onboarding.ready.subtitle|Можна починати. Час навести лад у типографіці.
onboarding.ready.cta|Почати перевірку
onboarding.choice.straight_quotes.wrong|"Привіт"
onboarding.choice.straight_quotes.right|«Привіт»
onboarding.choice.double_space.wrong|текст  текст
onboarding.choice.double_space.right|текст текст
onboarding.choice.comic_sans.right|Обрати доречніший шрифт
onboarding.welcome.artwork.line1|Вона сказала[["Привіт"...]]
onboarding.welcome.artwork.line2|і пішла [[--]] дуже швидко.
onboarding.demo_sentence|Вона сказала "Привіт"... і пішла -- дуже швидко.
""")
        case .hi:
            uiMap("""
onboarding.welcome.title|हर glyph एक सुराग है
onboarding.welcome.subtitle|Typpo उन टाइपोग्राफी गलतियों को पकड़ता है जिन्हें spellcheck छोड़ देता है।
onboarding.welcome.cta|जांच शुरू करें
onboarding.role.title|आप Typpo पर किस वजह से आए हैं?
onboarding.role.subtitle|इससे हम अनुभव को थोड़ा बेहतर ढंग से ढाल सकते हैं।
onboarding.role.designer|डिज़ाइनर
onboarding.role.designer.sub|मैं लेआउट की बारीकियों पर ध्यान देता हूँ
onboarding.role.writer|लेखक
onboarding.role.writer.sub|मुझे फर्क पड़ता है कि टेक्स्ट कैसा पढ़ता है
onboarding.role.developer|डेवलपर
onboarding.role.developer.sub|मैं ऐसे प्रोडक्ट बनाता हूँ जिनमें बहुत टेक्स्ट होता है
onboarding.role.student|छात्र
onboarding.role.student.sub|मैं अभी सीख रहा हूँ
onboarding.role.other|अन्य
onboarding.role.other.sub|मुझे बस टाइपोग्राफी में दिलचस्पी है
onboarding.crimes.title|कौन सी गलतियाँ आपको सबसे ज़्यादा खटकती हैं?
onboarding.crimes.subtitle|एक से ज़्यादा चुन सकते हैं। बाद में बदलना आसान है।
onboarding.crimes.skip|सब कुछ जांचो
onboarding.social.title|आप अच्छी संगत में हैं
onboarding.social.subtitle|डिज़ाइनर, एडिटर और टाइपोग्राफी के शौकीन रोज़ Typpo इस्तेमाल करते हैं।
onboarding.social.quote1|आख़िरकार ऐसा टूल मिला जो curly quotes की गलती मेरे एडिटर से पहले पकड़ लेता है।
onboarding.social.author1|Sarah K., कॉपी एडिटर
onboarding.social.quote2|मैं हर client deliverable भेजने से पहले Typpo से गुज़ारता हूँ। इसने मुझे कई बार शर्मिंदगी से बचाया है।
onboarding.social.author2|Marcus T., ब्रांड डिज़ाइनर
onboarding.strictness.title|हम कितनी सख्ती से जांचें?
onboarding.strictness.subtitle|आप इसे बाद में Settings में कभी भी बदल सकते हैं।
onboarding.strictness.lenient.tag|सिर्फ़ साफ़ दिखने वाली बातें
onboarding.strictness.standard.tag|बिलकुल संतुलित
onboarding.strictness.strict.tag|कोई बारीकी न छूटे
onboarding.strictness.recommended|सुझाव
onboarding.theme.title|अपना लुक चुनें
onboarding.demo.title|अभी आज़माएँ
onboarding.demo.subtitle|कोई भी टेक्स्ट पेस्ट करें और देखें Typpo कहाँ गड़बड़ पकड़ता है।
onboarding.demo.placeholder|यहाँ टेक्स्ट पेस्ट करें या टाइप करें…
onboarding.demo.use_sample|नमूना टेक्स्ट इस्तेमाल करें
onboarding.demo.analyze|टेक्स्ट जाँचें
onboarding.demo.results_title|पकड़ लिया।
onboarding.demo.results_body|हर बार जब आप टेक्स्ट पेस्ट करते हैं, Typpo इसी तरह काम करता है।
onboarding.demo.preview|उसने कहा[["नमस्ते"...]] और फिर [[--]] जल्दी से चला गया।
onboarding.ready.title|आप तैयार हैं
onboarding.ready.subtitle|सब सेट है। अब टाइपोग्राफी को थोड़ा संवारने का समय है।
onboarding.ready.cta|जांच शुरू करें
onboarding.choice.straight_quotes.wrong|"नमस्ते"
onboarding.choice.straight_quotes.right|“नमस्ते”
onboarding.choice.double_space.wrong|शब्द  शब्द
onboarding.choice.double_space.right|शब्द शब्द
onboarding.choice.comic_sans.right|ज़्यादा उपयुक्त फ़ॉन्ट चुनें
onboarding.welcome.artwork.line1|उसने कहा[["नमस्ते"...]]
onboarding.welcome.artwork.line2|और फिर [[--]] जल्दी से चला गया।
onboarding.demo_sentence|उसने कहा "नमस्ते"... और फिर -- जल्दी से चला गया।
""")
        case .he:
            uiMap("""
onboarding.welcome.title|כל גליף הוא רמז
onboarding.welcome.subtitle|Typpo תופס טעויות טיפוגרפיות שבדיקת האיות מפספסת.
onboarding.welcome.cta|התחל בדיקה
onboarding.role.title|מה מביא אותך ל-Typpo?
onboarding.role.subtitle|זה עוזר לנו להתאים לך חוויה מדויקת יותר.
onboarding.role.designer|מעצב
onboarding.role.designer.sub|אני שם לב לפריסה עד לפרט האחרון
onboarding.role.writer|כותב
onboarding.role.writer.sub|חשוב לי איך הטקסט נקרא
onboarding.role.developer|מפתח
onboarding.role.developer.sub|אני בונה מוצרים עם הרבה טקסט
onboarding.role.student|סטודנט
onboarding.role.student.sub|אני עדיין לומד את המלאכה
onboarding.role.other|אחר
onboarding.role.other.sub|אני פשוט סקרן לגבי טיפוגרפיה
onboarding.crimes.title|אילו טעויות הכי מציקות לך?
onboarding.crimes.subtitle|אפשר לבחור כמה, ותמיד לשנות אחר כך.
onboarding.crimes.skip|בדוק הכול
onboarding.social.title|אתה בחברה טובה
onboarding.social.subtitle|מעצבים, עורכים וחובבי טיפוגרפיה משתמשים ב-Typpo בכל יום.
onboarding.social.quote1|סוף סוף כלי שתופס את טעויות המרכאות לפני שהעורכת שלי מצביעה עליהן.
onboarding.social.author1|Sarah K., עורכת קופי
onboarding.social.quote2|אני מעביר כל חומרים ללקוח דרך Typpo לפני שליחה. זה כבר הציל אותי מכמה רגעים מביכים.
onboarding.social.author2|Marcus T., מעצב מותג
onboarding.strictness.title|כמה קפדניים נהיה?
onboarding.strictness.subtitle|תמיד אפשר לשנות את זה אחר כך ב-Settings.
onboarding.strictness.lenient.tag|רק מה שבולט לעין
onboarding.strictness.standard.tag|בדיוק במידה
onboarding.strictness.strict.tag|לא לתת לשום פרט לחמוק
onboarding.strictness.recommended|מומלץ
onboarding.theme.title|בחר את המראה שלך
onboarding.demo.title|נסה עכשיו
onboarding.demo.subtitle|הדבק כל טקסט וראה איך Typpo מוצא את מה שלא יושב נכון.
onboarding.demo.placeholder|הדבק או הקלד כאן טקסט…
onboarding.demo.use_sample|השתמש בטקסט לדוגמה
onboarding.demo.analyze|נתח טקסט
onboarding.demo.results_title|נתפס.
onboarding.demo.results_body|ככה Typpo עובד בכל פעם שמדביקים טקסט.
onboarding.demo.preview|היא אמרה[["שלום"...]] ואז הלכה [[--]] מהר.
onboarding.ready.title|הכול מוכן
onboarding.ready.subtitle|אפשר להתחיל. הגיע הזמן לסדר את הטיפוגרפיה.
onboarding.ready.cta|התחל בדיקה
onboarding.choice.straight_quotes.wrong|"שלום"
onboarding.choice.straight_quotes.right|„שלום”
onboarding.choice.double_space.wrong|טקסט  טקסט
onboarding.choice.double_space.right|טקסט טקסט
onboarding.choice.comic_sans.right|בחר פונט שמתאים יותר
onboarding.welcome.artwork.line1|היא אמרה[["שלום"...]]
onboarding.welcome.artwork.line2|ואז הלכה [[--]] מהר.
onboarding.demo_sentence|היא אמרה "שלום"... ואז הלכה -- מהר.
""")
        case .sv:
            uiMap("""
onboarding.welcome.title|Varje glyf är en ledtråd
onboarding.welcome.subtitle|Typpo hittar typografiska missar som stavningskontrollen inte ser.
onboarding.welcome.cta|Starta granskning
onboarding.role.title|Vad tar dig till Typpo?
onboarding.role.subtitle|Det hjälper oss att anpassa upplevelsen bättre.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Jag bryr mig om layout ner på detaljnivå
onboarding.role.writer|Skribent
onboarding.role.writer.sub|Jag bryr mig om hur texten läses
onboarding.role.developer|Utvecklare
onboarding.role.developer.sub|Jag bygger produkter med mycket text
onboarding.role.student|Student
onboarding.role.student.sub|Jag lär mig fortfarande hantverket
onboarding.role.other|Annat
onboarding.role.other.sub|Jag är bara typografinyfiken
onboarding.crimes.title|Vilka fel stör dig mest?
onboarding.crimes.subtitle|Du kan välja flera och ändra senare.
onboarding.crimes.skip|Granska allt
onboarding.social.title|Du är i gott sällskap
onboarding.social.subtitle|Designers, redaktörer och typo-nördar använder Typpo varje dag.
onboarding.social.quote1|Äntligen ett verktyg som fångar citatteckenmissarna innan min redaktör gör det.
onboarding.social.author1|Sarah K., copyeditor
onboarding.social.quote2|Jag kör varje kundleverans genom Typpo innan jag skickar den. Det har räddat mig från pinsamma missar mer än en gång.
onboarding.social.author2|Marcus T., varumärkesdesigner
onboarding.strictness.title|Hur strikta ska vi vara?
onboarding.strictness.subtitle|Du kan alltid ändra det senare i Inställningar.
onboarding.strictness.lenient.tag|Bara det mest uppenbara
onboarding.strictness.standard.tag|Precis lagom
onboarding.strictness.strict.tag|Låt inget slinka igenom
onboarding.strictness.recommended|Rekommenderat
onboarding.theme.title|Välj ditt uttryck
onboarding.demo.title|Testa nu
onboarding.demo.subtitle|Klistra in vilken text som helst och se hur Typpo hittar det som skaver.
onboarding.demo.placeholder|Klistra in eller skriv text här…
onboarding.demo.use_sample|Använd exempeltext
onboarding.demo.analyze|Analysera text
onboarding.demo.results_title|Träff.
onboarding.demo.results_body|Det är så här Typpo jobbar varje gång du klistrar in text.
onboarding.demo.preview|Hon sa[["Hej"...]] och gick [[--]] snabbt därifrån.
onboarding.ready.title|Allt är klart
onboarding.ready.subtitle|Nu kör vi. Dags att städa upp typografin.
onboarding.ready.cta|Starta granskning
onboarding.choice.straight_quotes.wrong|"Hej"
onboarding.choice.straight_quotes.right|”Hej”
onboarding.choice.double_space.wrong|text  text
onboarding.choice.double_space.right|text text
onboarding.choice.comic_sans.right|Välj ett mer passande typsnitt
onboarding.welcome.artwork.line1|Hon sa[["Hej"...]]
onboarding.welcome.artwork.line2|och gick [[--]] snabbt därifrån.
onboarding.demo_sentence|Hon sa "Hej"... och gick -- snabbt därifrån.
""")
        case .no:
            uiMap("""
onboarding.welcome.title|Hver glyf er et spor
onboarding.welcome.subtitle|Typpo fanger typografiske feil som stavekontrollen overser.
onboarding.welcome.cta|Start gjennomgang
onboarding.role.title|Hva bringer deg til Typpo?
onboarding.role.subtitle|Det hjelper oss å tilpasse opplevelsen litt bedre.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Jeg bryr meg om layout helt ned i detaljene
onboarding.role.writer|Skribent
onboarding.role.writer.sub|Jeg bryr meg om hvordan teksten leses
onboarding.role.developer|Utvikler
onboarding.role.developer.sub|Jeg lager produkter med mye tekst
onboarding.role.student|Student
onboarding.role.student.sub|Jeg lærer fortsatt håndverket
onboarding.role.other|Annet
onboarding.role.other.sub|Jeg er bare nysgjerrig på typografi
onboarding.crimes.title|Hvilke feil irriterer deg mest?
onboarding.crimes.subtitle|Du kan velge flere og endre senere.
onboarding.crimes.skip|Sjekk alt
onboarding.social.title|Du er i godt selskap
onboarding.social.subtitle|Designere, redaktører og typografinerder bruker Typpo hver dag.
onboarding.social.quote1|Endelig et verktøy som tar anførselstegnfeilene før redaktøren min gjør det.
onboarding.social.author1|Sarah K., tekstredaktør
onboarding.social.quote2|Jeg kjører alt som skal til kunder gjennom Typpo før jeg sender det. Det har spart meg for flere flaue øyeblikk.
onboarding.social.author2|Marcus T., merkedesigner
onboarding.strictness.title|Hvor strenge skal vi være?
onboarding.strictness.subtitle|Du kan alltid justere dette senere i Innstillinger.
onboarding.strictness.lenient.tag|Bare det mest åpenbare
onboarding.strictness.standard.tag|Midt i blinken
onboarding.strictness.strict.tag|Ikke la noe slippe unna
onboarding.strictness.recommended|Anbefalt
onboarding.theme.title|Velg uttrykket ditt
onboarding.demo.title|Prøv nå
onboarding.demo.subtitle|Lim inn hvilken som helst tekst og se hvordan Typpo finner det som skurrer.
onboarding.demo.placeholder|Lim inn eller skriv tekst her…
onboarding.demo.use_sample|Bruk eksempeltekst
onboarding.demo.analyze|Analyser tekst
onboarding.demo.results_title|Der satt den.
onboarding.demo.results_body|Slik jobber Typpo hver gang du limer inn tekst.
onboarding.demo.preview|Hun sa[["Hei"...]] og gikk [[--]] raskt videre.
onboarding.ready.title|Du er klar
onboarding.ready.subtitle|Alt er satt opp. Nå er det på tide å rydde opp i typografien.
onboarding.ready.cta|Start gjennomgang
onboarding.choice.straight_quotes.wrong|"Hei"
onboarding.choice.straight_quotes.right|«Hei»
onboarding.choice.double_space.wrong|tekst  tekst
onboarding.choice.double_space.right|tekst tekst
onboarding.choice.comic_sans.right|Velg en mer passende skrifttype
onboarding.welcome.artwork.line1|Hun sa[["Hei"...]]
onboarding.welcome.artwork.line2|og gikk [[--]] raskt videre.
onboarding.demo_sentence|Hun sa "Hei"... og gikk -- raskt videre.
""")
        case .da:
            uiMap("""
onboarding.welcome.title|Hver glyf er et spor
onboarding.welcome.subtitle|Typpo fanger typografiske fejl, som stavekontrollen overser.
onboarding.welcome.cta|Start gennemgang
onboarding.role.title|Hvad bringer dig til Typpo?
onboarding.role.subtitle|Det hjælper os med at tilpasse oplevelsen bedre.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Jeg går op i layout helt ned i detaljen
onboarding.role.writer|Skribent
onboarding.role.writer.sub|Jeg går op i, hvordan teksten læses
onboarding.role.developer|Udvikler
onboarding.role.developer.sub|Jeg bygger produkter med masser af tekst
onboarding.role.student|Studerende
onboarding.role.student.sub|Jeg er stadig ved at lære håndværket
onboarding.role.other|Andet
onboarding.role.other.sub|Jeg er bare nysgerrig på typografi
onboarding.crimes.title|Hvilke fejl irriterer dig mest?
onboarding.crimes.subtitle|Du kan vælge flere og ændre det senere.
onboarding.crimes.skip|Tjek det hele
onboarding.social.title|Du er i godt selskab
onboarding.social.subtitle|Designere, redaktører og typografi-nørder bruger Typpo hver dag.
onboarding.social.quote1|Endelig et værktøj, der fanger citationstegnsfejlene, før min redaktør gør.
onboarding.social.author1|Sarah K., copyeditor
onboarding.social.quote2|Jeg sender altid kundeleverancer gennem Typpo, før de ryger afsted. Det har reddet mig fra pinlige fejl mere end én gang.
onboarding.social.author2|Marcus T., branddesigner
onboarding.strictness.title|Hvor strenge skal vi være?
onboarding.strictness.subtitle|Du kan altid justere det senere i Indstillinger.
onboarding.strictness.lenient.tag|Kun det mest tydelige
onboarding.strictness.standard.tag|Lige i øjet
onboarding.strictness.strict.tag|Lad ingen detaljer slippe
onboarding.strictness.recommended|Anbefalet
onboarding.theme.title|Vælg dit udtryk
onboarding.demo.title|Prøv det nu
onboarding.demo.subtitle|Indsæt en vilkårlig tekst og se, hvordan Typpo finder det, der skurrer.
onboarding.demo.placeholder|Indsæt eller skriv tekst her…
onboarding.demo.use_sample|Brug eksempeltekst
onboarding.demo.analyze|Analyser tekst
onboarding.demo.results_title|Fundet.
onboarding.demo.results_body|Sådan arbejder Typpo hver gang, du indsætter tekst.
onboarding.demo.preview|Hun sagde[["Hej"...]] og gik [[--]] hurtigt videre.
onboarding.ready.title|Du er klar
onboarding.ready.subtitle|Alt er sat op. Tid til at få styr på typografien.
onboarding.ready.cta|Start gennemgang
onboarding.choice.straight_quotes.wrong|"Hej"
onboarding.choice.straight_quotes.right|»Hej«
onboarding.choice.double_space.wrong|tekst  tekst
onboarding.choice.double_space.right|tekst tekst
onboarding.choice.comic_sans.right|Vælg en mere passende skrifttype
onboarding.welcome.artwork.line1|Hun sagde[["Hej"...]]
onboarding.welcome.artwork.line2|og gik [[--]] hurtigt videre.
onboarding.demo_sentence|Hun sagde "Hej"... og gik -- hurtigt videre.
""")
        case .fi:
            uiMap("""
onboarding.welcome.title|Jokainen glyfi on vihje
onboarding.welcome.subtitle|Typpo löytää typografiset kömmähdykset, jotka oikoluku ohittaa.
onboarding.welcome.cta|Aloita tarkistus
onboarding.role.title|Mikä toi sinut Typpoon?
onboarding.role.subtitle|Näin voimme sovittaa kokemuksen paremmin sinulle.
onboarding.role.designer|Suunnittelija
onboarding.role.designer.sub|Välitän asettelusta yksityiskohtia myöten
onboarding.role.writer|Kirjoittaja
onboarding.role.writer.sub|Minulle on tärkeää, miltä teksti tuntuu lukea
onboarding.role.developer|Kehittäjä
onboarding.role.developer.sub|Teen tuotteita, joissa on paljon tekstiä
onboarding.role.student|Opiskelija
onboarding.role.student.sub|Opettelen vielä tätä työtä
onboarding.role.other|Muu
onboarding.role.other.sub|Olen vain utelias typografiasta
onboarding.crimes.title|Mitkä virheet ärsyttävät sinua eniten?
onboarding.crimes.subtitle|Voit valita useita ja muuttaa myöhemmin.
onboarding.crimes.skip|Tarkista kaikki
onboarding.social.title|Olet hyvässä seurassa
onboarding.social.subtitle|Suunnittelijat, editoijat ja typografian ystävät käyttävät Typpoa joka päivä.
onboarding.social.quote1|Vihdoin työkalu, joka nappaa lainausmerkkivirheet ennen kuin editorini ehtii niihin.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Ajan jokaisen asiakkaalle lähtevän tekstin Typpon läpi ennen lähettämistä. Se on pelastanut minut nololta tilanteelta useammin kuin kerran.
onboarding.social.author2|Marcus T., brändisuunnittelija
onboarding.strictness.title|Kuinka tarkkoja meidän pitäisi olla?
onboarding.strictness.subtitle|Voit muuttaa tätä myöhemmin asetuksista.
onboarding.strictness.lenient.tag|Vain selvät jutut
onboarding.strictness.standard.tag|Sopivan napakka
onboarding.strictness.strict.tag|Älä päästä mitään läpi
onboarding.strictness.recommended|Suositus
onboarding.theme.title|Valitse oma tyyli
onboarding.demo.title|Kokeile heti
onboarding.demo.subtitle|Liitä mikä tahansa teksti ja katso, miten Typpo löytää epäkohdat.
onboarding.demo.placeholder|Liitä tai kirjoita teksti tähän…
onboarding.demo.use_sample|Käytä esimerkkitekstiä
onboarding.demo.analyze|Analysoi teksti
onboarding.demo.results_title|Kiinni jäi.
onboarding.demo.results_body|Juuri näin Typpo toimii aina, kun liität tekstiä.
onboarding.demo.preview|Hän sanoi[["Hei"...]] ja lähti [[--]] nopeasti.
onboarding.ready.title|Kaikki on valmista
onboarding.ready.subtitle|Voit aloittaa. Nyt pistetään typografia kuntoon.
onboarding.ready.cta|Aloita tarkistus
onboarding.choice.straight_quotes.wrong|"Hei"
onboarding.choice.straight_quotes.right|”Hei”
onboarding.choice.double_space.wrong|teksti  teksti
onboarding.choice.double_space.right|teksti teksti
onboarding.choice.comic_sans.right|Valitse sopivampi kirjasin
onboarding.welcome.artwork.line1|Hän sanoi[["Hei"...]]
onboarding.welcome.artwork.line2|ja lähti [[--]] nopeasti.
onboarding.demo_sentence|Hän sanoi "Hei"... ja lähti -- nopeasti.
""")
        case .cs:
            uiMap("""
onboarding.welcome.title|Každý glyf je stopa
onboarding.welcome.subtitle|Typpo odhalí typografické přešlapy, které kontrola pravopisu nevidí.
onboarding.welcome.cta|Spustit kontrolu
onboarding.role.title|Co vás přivádí do Typpa?
onboarding.role.subtitle|Pomůže nám to lépe přizpůsobit celý zážitek.
onboarding.role.designer|Designér
onboarding.role.designer.sub|Záleží mi na rozvržení do posledního detailu
onboarding.role.writer|Autor
onboarding.role.writer.sub|Záleží mi na tom, jak se text čte
onboarding.role.developer|Vývojář
onboarding.role.developer.sub|Stavím produkty plné textu
onboarding.role.student|Student
onboarding.role.student.sub|Pořád se to učím
onboarding.role.other|Jiné
onboarding.role.other.sub|Typografie mě prostě baví
onboarding.crimes.title|Které chyby vás štvou nejvíc?
onboarding.crimes.subtitle|Můžete vybrat víc možností a později je změnit.
onboarding.crimes.skip|Kontrolovat všechno
onboarding.social.title|Jste ve správné společnosti
onboarding.social.subtitle|Designéři, editoři i typografičtí nadšenci používají Typpo každý den.
onboarding.social.quote1|Konečně nástroj, který chytí chyby v uvozovkách dřív než moje editorka.
onboarding.social.author1|Sarah K., copy editorka
onboarding.social.quote2|Každý klientský výstup před odesláním proženu Typpem. Už několikrát mě to zachránilo před trapasem.
onboarding.social.author2|Marcus T., brand designér
onboarding.strictness.title|Jak přísní máme být?
onboarding.strictness.subtitle|Později to můžete kdykoli změnit v Nastavení.
onboarding.strictness.lenient.tag|Jen to nejzjevnější
onboarding.strictness.standard.tag|Tak akorát
onboarding.strictness.strict.tag|Nepřehlédnout žádný detail
onboarding.strictness.recommended|Doporučeno
onboarding.theme.title|Vyberte si vzhled
onboarding.demo.title|Vyzkoušejte to hned
onboarding.demo.subtitle|Vložte libovolný text a podívejte se, jak Typpo najde slabá místa.
onboarding.demo.placeholder|Sem vložte nebo napište text…
onboarding.demo.use_sample|Použít ukázkový text
onboarding.demo.analyze|Analyzovat text
onboarding.demo.results_title|Máme to.
onboarding.demo.results_body|Přesně takhle Typpo funguje pokaždé, když vložíte text.
onboarding.demo.preview|Řekla[["Ahoj"...]] a odešla [[--]] rychle pryč.
onboarding.ready.title|Jste připraveni
onboarding.ready.subtitle|Všechno je nachystané. Je čas dát typografii do pořádku.
onboarding.ready.cta|Spustit kontrolu
onboarding.choice.straight_quotes.wrong|"Ahoj"
onboarding.choice.straight_quotes.right|„Ahoj“
onboarding.choice.double_space.wrong|text  text
onboarding.choice.double_space.right|text text
onboarding.choice.comic_sans.right|Zvolit vhodnější písmo
onboarding.welcome.artwork.line1|Řekla[["Ahoj"...]]
onboarding.welcome.artwork.line2|a odešla [[--]] rychle pryč.
onboarding.demo_sentence|Řekla "Ahoj"... a odešla -- rychle pryč.
""")
        case .hu:
            uiMap("""
onboarding.welcome.title|Minden glif egy nyom
onboarding.welcome.subtitle|A Typpo kiszúrja azokat a tipográfiai hibákat, amelyeket a helyesírás-ellenőrzés nem vesz észre.
onboarding.welcome.cta|Ellenőrzés indítása
onboarding.role.title|Mi hozott a Typpóhoz?
onboarding.role.subtitle|Ez segít abban, hogy jobban rád szabjuk az élményt.
onboarding.role.designer|Tervező
onboarding.role.designer.sub|A legkisebb részletig figyelek a layoutre
onboarding.role.writer|Szerző
onboarding.role.writer.sub|Nekem számít, hogyan olvasható a szöveg
onboarding.role.developer|Fejlesztő
onboarding.role.developer.sub|Sok szöveget tartalmazó termékeket készítek
onboarding.role.student|Diák
onboarding.role.student.sub|Még tanulom ezt a szakmát
onboarding.role.other|Más
onboarding.role.other.sub|Egyszerűen érdekel a tipográfia
onboarding.crimes.title|Mely hibák idegesítenek leginkább?
onboarding.crimes.subtitle|Többet is választhatsz, később bármikor módosíthatod.
onboarding.crimes.skip|Mindent figyeljen
onboarding.social.title|Jó társaságban vagy
onboarding.social.subtitle|Tervezők, szerkesztők és tipográfiamániások használják nap mint nap a Typpót.
onboarding.social.quote1|Végre egy eszköz, ami még a szerkesztőm előtt kiszúrja az idézőjelhibákat.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Minden ügyfélanyag átmegy a Typpón, mielőtt kiküldöm. Többször is megkímélt kínos helyzetektől.
onboarding.social.author2|Marcus T., márkadesigner
onboarding.strictness.title|Mennyire legyünk szigorúak?
onboarding.strictness.subtitle|Később bármikor átállíthatod a Beállításokban.
onboarding.strictness.lenient.tag|Csak a legfeltűnőbbek
onboarding.strictness.standard.tag|Pont jó
onboarding.strictness.strict.tag|Egy részlet se maradjon ki
onboarding.strictness.recommended|Ajánlott
onboarding.theme.title|Válaszd ki a megjelenést
onboarding.demo.title|Próbáld ki most
onboarding.demo.subtitle|Illessz be bármilyen szöveget, és nézd meg, hogyan találja meg a Typpo a hibákat.
onboarding.demo.placeholder|Illessz be vagy írj ide szöveget…
onboarding.demo.use_sample|Mintaszöveg használata
onboarding.demo.analyze|Szöveg elemzése
onboarding.demo.results_title|Megvan.
onboarding.demo.results_body|Pont így dolgozik a Typpo minden egyes beillesztésnél.
onboarding.demo.preview|Azt mondta[["Szia"...]] aztán [[--]] gyorsan elment.
onboarding.ready.title|Minden készen áll
onboarding.ready.subtitle|Mehetünk is. Ideje rendbe tenni a tipográfiát.
onboarding.ready.cta|Ellenőrzés indítása
onboarding.choice.straight_quotes.wrong|"Szia"
onboarding.choice.straight_quotes.right|„Szia”
onboarding.choice.double_space.wrong|szöveg  szöveg
onboarding.choice.double_space.right|szöveg szöveg
onboarding.choice.comic_sans.right|Válassz jobban illő betűtípust
onboarding.welcome.artwork.line1|Azt mondta[["Szia"...]]
onboarding.welcome.artwork.line2|aztán [[--]] gyorsan elment.
onboarding.demo_sentence|Azt mondta "Szia"... aztán -- gyorsan elment.
""")
        case .ro:
            uiMap("""
onboarding.welcome.title|Fiecare glif e un indiciu
onboarding.welcome.subtitle|Typpo găsește scăpările tipografice pe care corectorul ortografic nu le vede.
onboarding.welcome.cta|Pornește verificarea
onboarding.role.title|Ce te aduce în Typpo?
onboarding.role.subtitle|Asta ne ajută să potrivim mai bine experiența.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Țin la layout până la ultimul detaliu
onboarding.role.writer|Autor
onboarding.role.writer.sub|Îmi pasă cum se citește textul
onboarding.role.developer|Developer
onboarding.role.developer.sub|Construiesc produse pline de text
onboarding.role.student|Student
onboarding.role.student.sub|Încă învăț meseria
onboarding.role.other|Altceva
onboarding.role.other.sub|Sunt doar curios de tipografie
onboarding.crimes.title|Ce greșeli te enervează cel mai tare?
onboarding.crimes.subtitle|Poți alege mai multe. Le schimbi ușor mai târziu.
onboarding.crimes.skip|Verifică tot
onboarding.social.title|Ești în companie bună
onboarding.social.subtitle|Designeri, editori și pasionați de tipografie folosesc Typpo în fiecare zi.
onboarding.social.quote1|În sfârșit, un instrument care prinde greșelile de ghilimele înainte să le vadă editorul meu.
onboarding.social.author1|Sarah K., editor de text
onboarding.social.quote2|Trec fiecare livrabil pentru client prin Typpo înainte de trimitere. M-a scăpat de mai mult de un moment stânjenitor.
onboarding.social.author2|Marcus T., designer de brand
onboarding.strictness.title|Cât de stricți să fim?
onboarding.strictness.subtitle|Poți schimba asta oricând mai târziu din Settings.
onboarding.strictness.lenient.tag|Doar ce sare în ochi
onboarding.strictness.standard.tag|Exact cât trebuie
onboarding.strictness.strict.tag|Să nu scape niciun detaliu
onboarding.strictness.recommended|Recomandat
onboarding.theme.title|Alege-ți stilul
onboarding.demo.title|Încearcă acum
onboarding.demo.subtitle|Lipește orice text și vezi cum găsește Typpo ce nu e în regulă.
onboarding.demo.placeholder|Lipește sau scrie text aici…
onboarding.demo.use_sample|Folosește textul exemplu
onboarding.demo.analyze|Analizează textul
onboarding.demo.results_title|Prins.
onboarding.demo.results_body|Așa lucrează Typpo de fiecare dată când lipești un text.
onboarding.demo.preview|A spus[["Salut"...]] și a plecat [[--]] repede.
onboarding.ready.title|Totul e pregătit
onboarding.ready.subtitle|Poți începe. E timpul să punem tipografia în ordine.
onboarding.ready.cta|Pornește verificarea
onboarding.choice.straight_quotes.wrong|"Salut"
onboarding.choice.straight_quotes.right|„Salut”
onboarding.choice.double_space.wrong|text  text
onboarding.choice.double_space.right|text text
onboarding.choice.comic_sans.right|Alege un font mai potrivit
onboarding.welcome.artwork.line1|A spus[["Salut"...]]
onboarding.welcome.artwork.line2|și a plecat [[--]] repede.
onboarding.demo_sentence|A spus "Salut"... și a plecat -- repede.
""")
        case .el:
            uiMap("""
onboarding.welcome.title|Κάθε γλύφος είναι στοιχείο
onboarding.welcome.subtitle|Το Typpo βρίσκει τυπογραφικά λάθη που δεν πιάνει ο ορθογραφικός έλεγχος.
onboarding.welcome.cta|Ξεκίνα έλεγχο
onboarding.role.title|Τι σε φέρνει στο Typpo;
onboarding.role.subtitle|Αυτό μας βοηθά να προσαρμόσουμε καλύτερα την εμπειρία σου.
onboarding.role.designer|Designer
onboarding.role.designer.sub|Προσέχω το layout μέχρι την τελευταία λεπτομέρεια
onboarding.role.writer|Writer
onboarding.role.writer.sub|Με νοιάζει πώς διαβάζεται το κείμενο
onboarding.role.developer|Developer
onboarding.role.developer.sub|Φτιάχνω προϊόντα με πολύ κείμενο
onboarding.role.student|Φοιτητής
onboarding.role.student.sub|Ακόμα μαθαίνω τη δουλειά
onboarding.role.other|Άλλο
onboarding.role.other.sub|Απλώς με ενδιαφέρει η τυπογραφία
onboarding.crimes.title|Ποια λάθη σε ενοχλούν περισσότερο;
onboarding.crimes.subtitle|Μπορείς να επιλέξεις πολλά και να το αλλάξεις αργότερα.
onboarding.crimes.skip|Έλεγξε τα πάντα
onboarding.social.title|Είσαι σε καλή παρέα
onboarding.social.subtitle|Designers, editors και λάτρεις της τυπογραφίας χρησιμοποιούν το Typpo κάθε μέρα.
onboarding.social.quote1|Επιτέλους ένα εργαλείο που πιάνει τα λάθη στα εισαγωγικά πριν τα βρει η επιμελήτριά μου.
onboarding.social.author1|Sarah K., copy editor
onboarding.social.quote2|Περνάω κάθε παραδοτέο πελάτη από το Typpo πριν το στείλω. Με έχει γλιτώσει από αμήχανες στιγμές περισσότερες από μία φορές.
onboarding.social.author2|Marcus T., brand designer
onboarding.strictness.title|Πόσο αυστηροί να είμαστε;
onboarding.strictness.subtitle|Μπορείς πάντα να το αλλάξεις αργότερα από τα Settings.
onboarding.strictness.lenient.tag|Μόνο τα προφανή
onboarding.strictness.standard.tag|Ακριβώς όσο πρέπει
onboarding.strictness.strict.tag|Να μη χαθεί καμία λεπτομέρεια
onboarding.strictness.recommended|Προτεινόμενο
onboarding.theme.title|Διάλεξε το ύφος σου
onboarding.demo.title|Δοκίμασέ το τώρα
onboarding.demo.subtitle|Κάνε επικόλληση οποιουδήποτε κειμένου και δες πώς το Typpo βρίσκει τι δεν στέκει σωστά.
onboarding.demo.placeholder|Κάνε επικόλληση ή γράψε κείμενο εδώ…
onboarding.demo.use_sample|Χρήση δείγματος
onboarding.demo.analyze|Ανάλυση κειμένου
onboarding.demo.results_title|Βρέθηκε.
onboarding.demo.results_body|Έτσι ακριβώς δουλεύει το Typpo κάθε φορά που κάνεις επικόλληση κειμένου.
onboarding.demo.preview|Είπε[["Γεια"...]] και έφυγε [[--]] γρήγορα.
onboarding.ready.title|Είσαι έτοιμος
onboarding.ready.subtitle|Όλα είναι στημένα. Ώρα να βάλουμε την τυπογραφία σε τάξη.
onboarding.ready.cta|Ξεκίνα έλεγχο
onboarding.choice.straight_quotes.wrong|"Γεια"
onboarding.choice.straight_quotes.right|«Γεια»
onboarding.choice.double_space.wrong|κείμενο  κείμενο
onboarding.choice.double_space.right|κείμενο κείμενο
onboarding.choice.comic_sans.right|Διάλεξε μια πιο ταιριαστή γραμματοσειρά
onboarding.welcome.artwork.line1|Είπε[["Γεια"...]]
onboarding.welcome.artwork.line2|και έφυγε [[--]] γρήγορα.
onboarding.demo_sentence|Είπε "Γεια"... και έφυγε -- γρήγορα.
""")
        case .ms:
            uiMap("""
onboarding.welcome.title|Setiap glif ialah petunjuk
onboarding.welcome.subtitle|Typpo menangkap kesilapan tipografi yang terlepas daripada semakan ejaan.
onboarding.welcome.cta|Mula semakan
onboarding.role.title|Apa yang membawa anda ke Typpo?
onboarding.role.subtitle|Ini membantu kami menyesuaikan pengalaman anda dengan lebih baik.
onboarding.role.designer|Pereka
onboarding.role.designer.sub|Saya peka terhadap susun atur sampai ke perincian kecil
onboarding.role.writer|Penulis
onboarding.role.writer.sub|Saya peduli bagaimana teks itu dibaca
onboarding.role.developer|Pembangun
onboarding.role.developer.sub|Saya membina produk yang sarat dengan teks
onboarding.role.student|Pelajar
onboarding.role.student.sub|Saya masih belajar tentang bidang ini
onboarding.role.other|Lain-lain
onboarding.role.other.sub|Saya cuma ingin tahu tentang tipografi
onboarding.crimes.title|Masalah mana yang paling mengganggu anda?
onboarding.crimes.subtitle|Anda boleh pilih lebih daripada satu dan ubah kemudian.
onboarding.crimes.skip|Periksa semuanya
onboarding.social.title|Anda berada dalam kalangan yang tepat
onboarding.social.subtitle|Pereka, editor dan peminat tipografi menggunakan Typpo setiap hari.
onboarding.social.quote1|Akhirnya ada alat yang menangkap kesilapan tanda petik sebelum editor saya menegurnya.
onboarding.social.author1|Sarah K., editor salinan
onboarding.social.quote2|Saya lalukan setiap bahan klien melalui Typpo sebelum dihantar. Ia sudah beberapa kali menyelamatkan saya daripada situasi memalukan.
onboarding.social.author2|Marcus T., pereka jenama
onboarding.strictness.title|Sejauh mana ketatnya semakan ini?
onboarding.strictness.subtitle|Anda sentiasa boleh ubah semula nanti dalam Settings.
onboarding.strictness.lenient.tag|Hanya yang jelas kelihatan
onboarding.strictness.standard.tag|Cukup seimbang
onboarding.strictness.strict.tag|Jangan lepaskan satu pun
onboarding.strictness.recommended|Disyorkan
onboarding.theme.title|Pilih gaya anda
onboarding.demo.title|Cuba sekarang
onboarding.demo.subtitle|Tampal apa-apa teks dan lihat bagaimana Typpo mencari yang janggal.
onboarding.demo.placeholder|Tampal atau taip teks di sini…
onboarding.demo.use_sample|Guna teks contoh
onboarding.demo.analyze|Analisis teks
onboarding.demo.results_title|Kena.
onboarding.demo.results_body|Begitulah cara Typpo bekerja setiap kali anda menampal teks.
onboarding.demo.preview|Dia berkata[["Helo"...]] kemudian pergi [[--]] dengan cepat.
onboarding.ready.title|Semuanya sudah sedia
onboarding.ready.subtitle|Boleh mula sekarang. Masa untuk kemaskan tipografi itu.
onboarding.ready.cta|Mula semakan
onboarding.choice.straight_quotes.wrong|"Helo"
onboarding.choice.straight_quotes.right|“Helo”
onboarding.choice.double_space.wrong|teks  teks
onboarding.choice.double_space.right|teks teks
onboarding.choice.comic_sans.right|Pilih fon yang lebih sesuai
onboarding.welcome.artwork.line1|Dia berkata[["Helo"...]]
onboarding.welcome.artwork.line2|kemudian pergi [[--]] dengan cepat.
onboarding.demo_sentence|Dia berkata "Helo"... kemudian pergi -- dengan cepat.
""")
        }
    }

    private static func parseStringMap(_ source: String) -> [String: String] {
        Dictionary(
            uniqueKeysWithValues: source
                .split(whereSeparator: \.isNewline)
                .map(String.init)
                .compactMap { line in
                    guard
                        let separator = line.firstIndex(of: "|")
                    else {
                        return nil
                    }

                    let key = String(line[..<separator]).trimmingCharacters(in: .whitespaces)
                    let valueStart = line.index(after: separator)
                    let value = String(line[valueStart...])

                    guard !key.isEmpty else { return nil }
                    return (key, value)
                }
        )
    }
}

private extension LocalizedArticleCopy {
    static let fallback = LocalizedArticleCopy(
        overview: "Good typography is a system of thoughtful details.",
        whyItMatters: "Consistent details make text easier to trust and easier to read.",
        history: nil,
        wrongExample: nil,
        rightExample: nil,
        fixSteps: ["Use the correct character and keep the document consistent."]
    )
}
