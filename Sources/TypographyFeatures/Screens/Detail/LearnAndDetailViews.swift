import SwiftUI
import TypographyDesignSystem
import TypographyDomain

private enum LearnRoute: Hashable {
    case crime(CrimeType)
}

public struct LawLibraryContainer: View {
    @State private var path = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            LawLibraryView(openCrime: { crimeType in
                path.append(LearnRoute.crime(crimeType))
            })
            .navigationDestination(for: LearnRoute.self) { route in
                switch route {
                case let .crime(type):
                    CrimeDetailView(crimeType: type)
                }
            }
        }
    }
}

public struct LawLibraryView: View {
    @State private var query = ""
    public let openCrime: (CrimeType) -> Void

    public init(openCrime: @escaping (CrimeType) -> Void) {
        self.openCrime = openCrime
    }

    public var body: some View {
        List {
            ForEach(CrimeCategory.allCases, id: \.self) { category in
                let items = filteredCrimes.filter { $0.category == category }
                if !items.isEmpty {
                    Section(category.title.uppercased()) {
                        ForEach(items, id: \.self) { crime in
                            Button {
                                openCrime(crime)
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: crime.symbolName)
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundStyle(AppColors.textSecondary)
                                        .frame(width: 28)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(crime.displayName)
                                            .appTextStyle(.titleMedium)
                                        Text(crime.shortDescription)
                                            .appTextStyle(.bodySmall, color: AppColors.textSecondary)
                                            .lineLimit(2)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(AppColors.textTertiary)
                                }
                                .padding(.vertical, 6)
                            }
                        }
                    }
                }
            }
        }
        .appInsetGroupedList()
        .navigationTitle(L10n.text("learn.title"))
        .searchable(text: $query, prompt: L10n.text("learn.search_prompt"))
        .overlay {
            if filteredCrimes.isEmpty {
                EmptyStateView(symbolName: "magnifyingglass", title: L10n.text("learn.empty_title"), subtitle: L10n.text("learn.empty_subtitle"))
            }
        }
    }

    private var filteredCrimes: [CrimeType] {
        guard !query.isEmpty else { return CrimeType.allCases }
        return CrimeType.allCases.filter {
            $0.displayName.localizedCaseInsensitiveContains(query) ||
            $0.shortDescription.localizedCaseInsensitiveContains(query)
        }
    }
}

public struct CrimeDetailView: View {
    let crimeType: CrimeType

    public init(crimeType: CrimeType) {
        self.crimeType = crimeType
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                hero
                section(title: L10n.text("learn.what_is_this"), body: article.overview)
                wrongRight
                section(title: L10n.text("learn.why_it_matters"), body: article.whyItMatters)
                if let history = article.history {
                    section(title: L10n.text("learn.history_origin"), body: history, secondary: true)
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(L10n.text("learn.how_to_fix"))
                        .appTextStyle(.titleSmall)
                    ForEach(Array(article.fixSteps.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top, spacing: 10) {
                            Text("\(index + 1).")
                                .appTextStyle(.labelMedium, color: AppColors.accentCrimson)
                            Text(step)
                                .appTextStyle(.bodyLarge)
                        }
                    }
                }
            }
            .padding(AppSpacing.lg)
        }
        .background(AppColors.surfaceBase.ignoresSafeArea())
        .navigationTitle(crimeType.displayName)
        .appInlineNavigationTitle()
    }

    private var article: CrimeEducationalArticle {
        CrimeEducationalContent.byType[crimeType] ?? CrimeEducationalArticle(
            crimeType: crimeType,
            title: crimeType.displayName,
            overview: crimeType.shortDescription,
            whyItMatters: L10n.text("learn.default_why"),
            wrongExample: L10n.text("general.wrong"),
            rightExample: L10n.text("general.right"),
            fixSteps: [L10n.text("learn.default_fix")]
        )
    }

    private var hero: some View {
        VStack(spacing: 12) {
            Image(systemName: crimeType.symbolName)
                .font(.system(size: 56, weight: .medium))
                .foregroundStyle(AppColors.accentCrimson)
            Text(article.title)
                .appTextStyle(.titleLarge)
            SeverityBadgeView(severity: crimeType.defaultSeverity)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(AppColors.surfaceSecondary, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private var wrongRight: some View {
        HStack(spacing: 12) {
            comparisonCard(title: L10n.text("general.wrong"), text: article.wrongExample, color: AppColors.accentCrimson, isCorrect: false)
            comparisonCard(title: L10n.text("general.right"), text: article.rightExample, color: AppColors.accentTeal, isCorrect: true)
        }
    }

    private func comparisonCard(title: String, text: String, color: Color, isCorrect: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .appTextStyle(.labelMedium, color: color)
            Text(text)
                .appTextStyle(.monoBody)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }

    private func section(title: String, body: String, secondary: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .appTextStyle(.titleSmall)
            Text(body)
                .appTextStyle(secondary ? .bodyMedium : .bodyLarge, color: secondary ? AppColors.textSecondary : AppColors.textPrimary)
        }
    }
}
