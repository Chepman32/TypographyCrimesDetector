import Foundation

public enum AppLanguage: String, CaseIterable, Sendable {
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

    public static func text(_ key: String) -> String {
        let pack = pack(for: currentLanguage)
        return pack.ui[key] ?? englishPack.ui[key] ?? key
    }

    public static func format(_ key: String, _ arguments: CVarArg...) -> String {
        let template = text(key)
        return withVaList(arguments) { pointer in
            NSString(format: template, locale: Locale.autoupdatingCurrent, arguments: pointer) as String
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
        value.formatted(.number.locale(Locale.autoupdatingCurrent))
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

    static let englishPack = LocalizationPack(
        ui: [
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
            "onboarding.ready.title": "Your badge\nis ready",
            "onboarding.ready.subtitle": "You\u{2019}re all set, Detective. Time to clean up some typography.",
            "onboarding.ready.cta": "Start Investigating",
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
        ],
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
        localizedUIKeys: [
            "app.tab.crime_lab",
            "app.tab.case_files",
            "app.tab.learn",
            "app.tab.settings",
            "counts.crimes_categories",
            "counts.detected_issues",
            "counts.entries",
            "counts.characters",
            "counts.line_column",
            "counts.crimes_verdict",
            "share.offense_line",
            "general.done",
            "general.cancel",
            "general.retry",
            "general.next",
            "general.skip",
            "general.got_it",
            "general.coming_soon",
            "general.wrong",
            "general.right",
            "history.empty_title",
            "history.empty_subtitle",
            "history.share",
            "history.delete",
            "history.title",
            "history.today",
            "history.yesterday",
            "history.this_week",
            "history.this_month",
            "history.select_all",
            "history.delete_selected",
            "learn.title",
            "learn.search_prompt",
            "learn.empty_title",
            "learn.empty_subtitle",
            "learn.what_is_this",
            "learn.why_it_matters",
            "learn.history_origin",
            "learn.how_to_fix",
            "learn.default_why",
            "learn.default_fix",
            "input.method",
            "input.method.paste",
            "input.method.camera",
            "input.placeholder",
            "input.paste_from_clipboard",
            "input.title",
            "input.analyze",
            "input.analyze_evidence",
            "input.camera_message",
            "input.trimmed_warning",
            "input.clipboard_empty",
            "input.no_text",
            "home.new_investigation",
            "home.new_investigation_subtitle",
            "home.new_investigation_badge",
            "home.recent_cases",
            "home.see_all",
            "home.empty_title",
            "home.empty_subtitle",
            "home.begin_investigation",
            "home.stat.scans",
            "home.stat.crimes",
            "home.stat.avg",
            "onboarding.splash_tagline",
            "onboarding.page1.title",
            "onboarding.page1.body",
            "onboarding.page2.title",
            "onboarding.page2.body",
            "onboarding.page3.title",
            "onboarding.page3.body",
            "onboarding.page4.title",
            "onboarding.page4.body",
            "onboarding.start",
            "onboarding.sample.not_em_dash",
            "onboarding.library.investigate",
            "onboarding.library.study",
            "analysis.failed_title",
            "analysis.failed_body",
            "analysis.status.scan",
            "analysis.status.quotes",
            "analysis.status.dashes",
            "analysis.status.ellipsis",
            "analysis.status.spacing",
            "analysis.status.layout",
            "analysis.status.comic_sans",
            "analysis.status.compiling",
            "mugshot.title",
            "mugshot.body",
            "mugshot.continue",
            "report.breakdown",
            "report.share",
            "report.new_scan",
            "report.close",
            "report.copy_fixed",
            "report.copy_fixed_hint",
            "report.clean_title",
            "report.clean_body",
            "report.replace_single_space",
            "report.fixed_text_copied",
            "report.manual_rewrite",
            "report.apply_failed",
            "report.issue_fixed",
            "report.learn_more",
            "settings.detection_rules",
            "settings.scoring",
            "settings.strictness",
            "settings.dash_style",
            "settings.appearance",
            "settings.theme",
            "settings.haptics",
            "settings.sounds",
            "settings.data",
            "settings.clear_all",
            "settings.export_all",
            "settings.about",
            "settings.version",
            "settings.typpo",
            "settings.rate_app",
            "settings.send_feedback",
            "settings.privacy",
            "settings.footer",
            "settings.title",
            "settings.clear_confirm_title",
            "settings.clear_confirm_message",
            "settings.delete_all",
            "settings.about_body",
            "settings.about_placeholder",
            "settings.about_website",
            "share.title",
            "share.copy_report_image",
            "share.save_to_photos",
            "share.copy_report_text",
            "share.photos_needed",
            "share.open_settings",
            "share.photos_message",
            "share.primary.share_text",
            "share.primary.copy_link",
            "share.primary.share",
            "share.copied_clipboard",
            "share.deep_link_copied",
            "share.render_failed",
            "share.saved_photos",
            "share.save_failed",
            "share.swipe_up",
            "share.report_heading",
            "share.score_prefix",
            "share.top_issues",
            "brand.wordmark",
            "brand.scene_tape",
            "brand.scene_tape_full",
            "onboarding.demo_sentence",
            "engine.whitespace_only",
            "engine.non_latin_warning",
            "engine.short_text_note",
            "engine.fix.single_space",
            "engine.fix.replace_with",
            "engine.fix.normalize_spacing",
            "engine.fix.rewrite_widow",
            "engine.fix.rewrite_orphan",
            "engine.fix.change_font",
            "engine.explain.double_space",
            "engine.explain.straight_quotes",
            "engine.explain.hyphen_dash",
            "engine.explain.fake_ellipsis",
            "engine.explain.inconsistent_spacing",
            "engine.explain.widow",
            "engine.explain.orphan",
            "engine.explain.comic_sans",
            "engine.explain.prime_marks",
            "engine.explain.multiplication_sign",
            "engine.explain.trademark_symbol",
            "category.punctuation",
            "category.spacing",
            "category.layout",
            "category.font",
            "category.symbol",
            "severity.infraction",
            "severity.misdemeanor",
            "severity.felony",
            "verdict.clean",
            "verdict.infraction",
            "verdict.misdemeanor",
            "verdict.felony",
            "verdict.capital",
            "strictness.lenient",
            "strictness.standard",
            "strictness.strict",
            "theme.system",
            "theme.light",
            "theme.dark",
            "dash.spaced",
            "dash.closed",
            "share_format.image",
            "share_format.story",
            "share_format.landscape",
            "share_format.text",
            "share_format.link",
            "share_format_desc.image",
            "share_format_desc.story",
            "share_format_desc.landscape",
            "share_format_desc.text",
            "share_format_desc.link",
            "evidence_source.typed",
            "evidence_source.pasted",
            "evidence_source.pasted_rich",
            "toast.load_failed",
            "toast.save_failed",
            "toast.delete_failed",
            "toast.cleared",
            "toast.clear_failed",
            "toast.export_failed"
        ],
        localizedVerdictKeys: Set(Verdict.allCases),
        localizedCategoryKeys: Set(CrimeCategory.allCases),
        localizedCrimeTypeTitleKeys: Set(CrimeType.allCases),
        localizedCrimeTypeDescriptionKeys: Set(CrimeType.allCases),
        localizedArticleKeys: Set(CrimeType.allCases)
    )

    static func makePack(
        ui: [String: String],
        verdictShortLabels: [Verdict: String],
        crimeCategoryTitles: [CrimeCategory: String],
        crimeTypeTitles: [CrimeType: String],
        crimeTypeDescriptions: [CrimeType: String],
        articles: [CrimeType: LocalizedArticleCopy] = [:]
    ) -> LocalizationPack {
        LocalizationPack(
            ui: englishPack.ui.merging(ui) { _, new in new },
            verdictShortLabels: englishPack.verdictShortLabels.merging(verdictShortLabels) { _, new in new },
            crimeCategoryTitles: englishPack.crimeCategoryTitles.merging(crimeCategoryTitles) { _, new in new },
            crimeTypeTitles: englishPack.crimeTypeTitles.merging(crimeTypeTitles) { _, new in new },
            crimeTypeDescriptions: englishPack.crimeTypeDescriptions.merging(crimeTypeDescriptions) { _, new in new },
            articles: articles,
            localizedUIKeys: Set(ui.keys),
            localizedVerdictKeys: Set(verdictShortLabels.keys),
            localizedCategoryKeys: Set(crimeCategoryTitles.keys),
            localizedCrimeTypeTitleKeys: Set(crimeTypeTitles.keys),
            localizedCrimeTypeDescriptionKeys: Set(crimeTypeDescriptions.keys),
            localizedArticleKeys: Set(articles.keys)
        )
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
