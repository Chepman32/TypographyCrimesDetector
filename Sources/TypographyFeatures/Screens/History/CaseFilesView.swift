import SwiftUI
import TypographyDesignSystem
import TypographyDomain

private enum HistoryRoute: Hashable {
    case report(CrimeReport)
}

public struct CaseFilesContainer: View {
    @Environment(TypographyAppState.self) private var appState
    @State private var path = NavigationPath()
    #if os(iOS)
    @State private var editMode: EditMode = .inactive
    #endif
    @State private var selection: Set<UUID> = []
    @State private var shareReport: CrimeReport?

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            List(selection: selectionBinding) {
                if appState.reports.isEmpty {
                    EmptyStateView(symbolName: "clock.arrow.circlepath", title: "No cases yet", subtitle: "Run a scan and your case files will appear here.")
                        .listRowBackground(Color.clear)
                } else {
                    ForEach(groupedSections, id: \.title) { section in
                        Section(section.title) {
                            ForEach(section.reports, id: \.id) { report in
                                NavigationLink(value: HistoryRoute.report(report)) {
                                    CrimeReportCardView(report: report)
                                }
                                .swipeActions {
                                    Button {
                                        shareReport = report
                                    } label: {
                                        Label("Share", systemImage: "square.and.arrow.up")
                                    }
                                    .tint(AppColors.accentSlate)

                                    Button(role: .destructive) {
                                        appState.delete(reportIDs: [report.id])
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Case Files")
            .modifier(CaseFilesEditingModifier(selection: $selection, appState: appState))
            .navigationDestination(for: HistoryRoute.self) { route in
                switch route {
                case let .report(report):
                    CrimeReportScreen(report: report, allowsNewScan: false)
                }
            }
            .sheet(item: $shareReport) { report in
                ReportShareSheet(report: report)
                    .environment(appState)
            }
        }
    }

    private var selectionBinding: Binding<Set<UUID>>? {
        #if os(iOS)
        $selection
        #else
        nil
        #endif
    }

    private var groupedSections: [HistorySection] {
        let calendar = Calendar.current
        let now = Date()
        let grouped = Dictionary(grouping: appState.reports) { report -> String in
            if calendar.isDateInToday(report.createdAt) { return "TODAY" }
            if calendar.isDateInYesterday(report.createdAt) { return "YESTERDAY" }
            if let weekAgo = calendar.date(byAdding: .day, value: -7, to: now), report.createdAt >= weekAgo { return "THIS WEEK" }
            if let monthAgo = calendar.date(byAdding: .month, value: -1, to: now), report.createdAt >= monthAgo { return "THIS MONTH" }
            return report.createdAt.formatted(.dateTime.month(.wide).year())
        }

        return grouped.map { HistorySection(title: $0.key, reports: $0.value.sorted { $0.createdAt > $1.createdAt }) }
            .sorted { $0.reports.first?.createdAt ?? .distantPast > $1.reports.first?.createdAt ?? .distantPast }
    }
}

private struct HistorySection {
    let title: String
    let reports: [CrimeReport]
}

private struct CaseFilesEditingModifier: ViewModifier {
    @Binding var selection: Set<UUID>
    let appState: TypographyAppState
    #if os(iOS)
    @State private var editMode: EditMode = .inactive
    #endif

    func body(content: Content) -> some View {
        #if os(iOS)
        content
            .toolbar {
                ToolbarItem(placement: .appPrimaryAction) {
                    EditButton()
                }
                if editMode.isEditing {
                    ToolbarItemGroup(placement: .appBottomAction) {
                        Button("Select All") {
                            selection = Set(appState.reports.map(\.id))
                        }
                        Spacer()
                        Button("Delete Selected", role: .destructive) {
                            appState.delete(reportIDs: Array(selection))
                            selection.removeAll()
                        }
                    }
                }
            }
            .environment(\.editMode, $editMode)
        #else
        content
        #endif
    }
}
