import Foundation

extension L10n {
    static let germanPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Kriminallabor
app.tab.case_files|Falldateien
app.tab.learn|Lernen
app.tab.settings|Einstellungen
counts.crimes_categories|Verbrechen: %@ · Kategorien: %@
counts.detected_issues|Erkannte Probleme: %@
counts.entries|Einträge: %@
counts.characters|Zeichen: %@
counts.line_column|Zeile %@ · Spalte %@
counts.crimes_verdict|Verbrechen: %@ · %@
share.offense_line|• %@: %@
general.done|Fertig
general.cancel|Abbrechen
general.retry|Wiederholen
general.next|Weiter
general.skip|Überspringen
general.got_it|Verstanden
general.coming_soon|In Kürze erhältlich
general.wrong|Falsch
general.right|Richtig
history.empty_title|Noch keine Fälle
history.empty_subtitle|Führen Sie einen Scan durch und Ihre Falldateien werden hier angezeigt.
history.share|Teilen
history.delete|Löschen
history.title|Falldateien
history.today|HEUTE
history.yesterday|GESTERN
history.this_week|diese Woche
history.this_month|DIESEN MONAT
history.select_all|Alles auswählen
history.delete_selected|Auswahl löschen
learn.title|Die Rechtsbibliothek
learn.search_prompt|Verbrechensarten suchen
learn.empty_title|Keine passenden Straftaten gefunden
learn.empty_subtitle|Versuchen Sie es mit einem anderen Suchbegriff.
learn.what_is_this|Was ist das für ein Problem?
learn.why_it_matters|Warum es wichtig ist
learn.history_origin|Geschichte und Kontext
learn.how_to_fix|So beheben Sie das Problem
learn.default_why|Gute Typografie ist ein System durchdachter Details.
learn.default_fix|Verwenden Sie das richtige Zeichen und sorgen Sie dafür, dass das Dokument konsistent ist.
input.method|Eingabemethode
input.method.paste|Einfügen/Typ
input.method.camera|Kamera (OCR)
input.placeholder|Fügen Sie Ihren Text hier ein oder geben Sie ihn ein…
input.paste_from_clipboard|Aus Zwischenablage einfügen
input.title|Beweise einreichen
input.analyze|Analysieren
input.analyze_evidence|Beweise analysieren
input.camera_message|Kamerabasierte Texterkennung wird in einem zukünftigen Update verfügbar sein. Fügen Sie zunächst Ihren zu analysierenden Text ein oder fügen Sie ihn ein.
input.trimmed_warning|Der Text wurde auf 100.000 Zeichen gekürzt.
input.clipboard_empty|Zwischenablage ist leer. Kopieren Sie zuerst etwas Text.
input.no_text|Kein Text zum Analysieren. Fügen Sie zuerst Text ein oder geben Sie ihn ein.
home.new_investigation|Neue Untersuchung
home.new_investigation_subtitle|Fügen Sie Text ein oder geben Sie ihn ein, um mit der forensischen Typografieanalyse zu beginnen
home.new_investigation_badge|EINFÜGEN · TYP · ANALYSE
home.recent_cases|Neueste Fälle
home.see_all|Alle anzeigen →
home.empty_title|Noch keine Fälle
home.empty_subtitle|Starten Sie Ihre erste Untersuchung.
home.begin_investigation|Untersuchung beginnen
home.stat.scans|Scans
home.stat.crimes|Verbrechen
home.stat.avg|Durchschn.
onboarding.splash_tagline|Jede Glyphe ist ein Beweis.
onboarding.page1.title|Einfügen. Analysieren. Rezension.
onboarding.page1.body|Fügen Sie einen beliebigen Text ein und die App markiert typografische Probleme, die offensichtlich verborgen bleiben.
onboarding.page2.title|Wir erkennen, was die Rechtschreibprüfung übersieht
onboarding.page2.body|Gerade Anführungszeichen, falsche Ellipsen, Bindestriche, die vorgeben, Geviertstriche zu sein, und inkonsistente Abstände werden hier angezeigt.
onboarding.page3.title|Erhalten Sie Ihren Kriminalitätswert
onboarding.page3.body|Sehen Sie, wie sauber Ihre Typografie ist, und teilen Sie dann Ihr Urteil mit.
onboarding.page4.title|Lernen Sie unterwegs
onboarding.page4.body|Öffnen Sie ein beliebiges Problem, um zu sehen, warum es wichtig ist und wie Sie es beheben können.
onboarding.start|Beginnen Sie mit der Untersuchung
onboarding.sample.not_em_dash|Kein Geviertstrich
onboarding.library.investigate|Untersuchen
onboarding.library.study|Studieren Sie die Regeln
analysis.failed_title|Analyse fehlgeschlagen
analysis.failed_body|Während des Scans ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut.
analysis.status.scan|Scannen nach typografischen Beweisen…
analysis.status.quotes|Anführungszeichen werden überprüft…
analysis.status.dashes|Dash-Nutzung wird überprüft…
analysis.status.ellipsis|Ellipsen prüfen…
analysis.status.spacing|Abstandskonsistenz prüfen…
analysis.status.layout|Überprüfung von Witwen und Waisen…
analysis.status.comic_sans|Schriftart-Metadaten werden überprüft…
analysis.status.compiling|Bericht erstellen…
mugshot.title|Wegen typografischem Fehlverhalten gemeldet
mugshot.body|Comic Sans wurde in den eingereichten Beweisen gefunden. In spielerischen Kontexten kann es funktionieren, aber in den meisten Produkt- und Redaktionskontexten wird es als Missverhältnis interpretiert.
mugshot.continue|Vollständigen Bericht öffnen →
report.breakdown|Aufschlüsselung der Kriminalität
report.share|Bericht teilen
report.new_scan|Neuer Scan
report.close|Bericht schließen
report.copy_fixed|Festen Text kopieren
report.copy_fixed_hint|Kopiert den aktuell korrigierten Text.
report.clean_title|Makellos
report.clean_body|Es wurden keine typografischen Probleme festgestellt. Dieser Text ist ein Musterbürger.
report.replace_single_space|Durch ein einzelnes Leerzeichen ersetzen
report.fixed_text_copied|Korrigierter Text kopiert ✓
report.manual_rewrite|Dieses Problem muss manuell neu geschrieben werden.
report.apply_failed|Dieser Fix konnte nicht angewendet werden.
report.issue_fixed|Problem behoben und Bericht aktualisiert ✓
report.learn_more|Weitere Informationen zu diesem Problem →
settings.detection_rules|Erkennungsregeln
settings.scoring|Wertung
settings.strictness|Strikte Bewertung
settings.dash_style|Geviertstrich-Stil
settings.appearance|Aussehen
settings.theme|Thema
settings.haptics|Haptisches Feedback
settings.sounds|Soundeffekte
settings.data|Daten
settings.clear_all|Alle Falldateien löschen
settings.export_all|Alle Berichte exportieren
settings.about|Über
settings.version|Version
settings.typpo|Typpo
settings.rate_app|Bewerten Sie auf App Store
settings.send_feedback|Feedback senden
settings.privacy|Datenschutzerklärung
settings.footer|Mit Sorgfalt und den richtigen geschwungenen Anführungszeichen erstellt.
settings.title|Einstellungen
settings.clear_confirm_title|Alle Falldateien löschen?
settings.clear_confirm_message|Diese Aktion kann nicht rückgängig gemacht werden.
settings.delete_all|Alle löschen
settings.about_body|Forensische Analyse Ihres Textes. Fügen Sie einen beliebigen Text ein, erhalten Sie Ihre Punktzahl und teilen Sie das Urteil mit.
settings.about_placeholder|Dieser Build ist vollständig offline und verwendet weiterhin Platzhalter-Release-Links für die Website, die Datenschutzrichtlinie und das App Store-Ziel.
settings.about_website|Website: %@
share.title|Bericht teilen
share.copy_report_image|Berichtsbild kopieren
share.save_to_photos|In Fotos speichern
share.copy_report_text|Berichtstext kopieren
share.photos_needed|Zugriff auf Fotos erforderlich
share.open_settings|Einstellungen öffnen
share.photos_message|Zur Speicherung des Berichtsbildes ist Zugriff auf Fotos erforderlich. Öffnen Sie die Einstellungen, um den Zugriff zu gewähren.
share.primary.share_text|Text teilen
share.primary.copy_link|Link kopieren
share.primary.share|Teilen
share.copied_clipboard|In die Zwischenablage kopiert ✓
share.deep_link_copied|Deep-Link kopiert ✓
share.render_failed|Das Berichtsbild konnte nicht gerendert werden.
share.saved_photos|In Fotos gespeichert ✓
share.save_failed|Das Berichtsbild konnte nicht gespeichert werden.
share.swipe_up|ÖFFNEN SIE DIE APP, UM IHREN EIGENEN TEXT ZU ANALYSIEREN
share.report_heading|Typografiebericht
share.score_prefix|Ergebnis
share.top_issues|Top-Probleme
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Ihr Text enthält nur Leerzeichen. Es ist nicht kriminell, aber es ist verdächtig.
engine.non_latin_warning|Die Analyse ist auf Typografie in lateinischer Schrift abgestimmt. Einige Abstands- und Zeichensetzungsregeln gelten möglicherweise nicht für dieses Schriftsystem.
engine.short_text_note|Witwen- und Waisenerkennung ist auf sehr kurzen Passagen weniger zuverlässig.
engine.fix.single_space|Verwenden Sie ein einzelnes Leerzeichen nach Satzende-Interpunktion.
engine.fix.replace_with|Durch %@ ersetzen
engine.fix.normalize_spacing|Normalisieren Sie den Satzabstand im gesamten Text.
engine.fix.rewrite_widow|Schreiben Sie den Absatz neu oder ändern Sie ihn um, um eine letzte Zeile mit einem Wort zu vermeiden.
engine.fix.rewrite_orphan|Passen Sie die Kopie in der Nähe an, um eine winzige Übertragungslinie zu vermeiden.
engine.fix.change_font|Verwenden Sie eine geeignetere Schriftart.
engine.explain.double_space|Dieser Satz endet mit mehreren Leerzeichen, einer Konvention aus der Zeit der Schreibmaschine, die nicht zur proportionalen Typografie gehört.
engine.explain.straight_quotes|Dieses Anführungszeichen verwendet die gerade ASCII-Form anstelle von gerichteten geschweiften Anführungszeichen.
engine.explain.hyphen_dash|Diese Unterbrechung verwendet Bindestrich-Minus-Zeichen anstelle eines richtigen Bindestrichs.
engine.explain.fake_ellipsis|Dieser Satz von Punkten sollte durch das Auslassungszeichen ersetzt werden.
engine.explain.inconsistent_spacing|Dieser Satzabstand weicht vom vorherrschenden Muster im Text ab.
engine.explain.widow|Der Absatz endet mit einem isolierten Schlusszeilenwort, wodurch eine sichtbare Witwe entsteht.
engine.explain.orphan|Dieser Absatz beginnt mit einer sehr kurzen Zeile nach einem langen vorhergehenden Absatz, der sich wahrscheinlich als verwaist liest.
engine.explain.comic_sans|Comic Sans-Metadaten wurden im übermittelten Rich-Text gefunden.
engine.explain.prime_marks|Diese Messmarke verwendet ein ASCII-Anführungszeichen anstelle eines richtigen Primsymbols.
engine.explain.multiplication_sign|Diese Dimension verwendet den Buchstaben x an der Stelle, an der das Multiplikationszeichen erscheinen soll.
engine.explain.trademark_symbol|Diese Fallback-Notation sollte durch das richtige Symbol ersetzt werden.
category.punctuation|Interpunktionsprobleme
category.spacing|Abstandsprobleme
category.layout|Layoutprobleme
category.font|Schriftartenprobleme
category.symbol|Symbolprobleme
severity.infraction|VERLETZUNG
severity.misdemeanor|VERLETZUNG
severity.felony|VERBRECHEN
verdict.clean|REINIGEN
verdict.infraction|VERLETZUNG
verdict.misdemeanor|VERLETZUNG
verdict.felony|VERBRECHEN
verdict.capital|Todesverbrechen
strictness.lenient|Nachsichtig
strictness.standard|Standard
strictness.strict|Streng
theme.system|System
theme.light|Licht
theme.dark|Dunkel
dash.spaced|Abstand
dash.closed|Geschlossen
share_format.image|Bild
share_format.story|Geschichte
share_format.landscape|Landschaft
share_format.text|Nur-Text
share_format.link|Link kopieren
share_format_desc.image|PNG-Bild, optimiert für soziale Feeds.
share_format_desc.story|1080×1920 Story-Ready-Bericht.
share_format_desc.landscape|Breite Karte für Artikel- und Social-Previews.
share_format_desc.text|Formatierte Textzusammenfassung.
share_format_desc.link|Platzhalter-Deep-Link-Kopie.
evidence_source.typed|Getippt
evidence_source.pasted|Eingefügt
evidence_source.pasted_rich|Rich-Text eingefügt
toast.load_failed|Gespeicherte Falldateien konnten nicht geladen werden.
toast.save_failed|Die Falldatei konnte nicht gespeichert werden.
toast.delete_failed|Löschen fehlgeschlagen.
toast.cleared|Alle Falldateien gelöscht.
toast.clear_failed|Falldateien konnten nicht gelöscht werden.
toast.export_failed|Export fehlgeschlagen.
"""),
        verdictShortLabels: verdictMap("""
clean|REINIGEN
infraction|VERLETZUNG
misdemeanor|VERLETZUNG
felony|VERBRECHEN
capitalOffense|Todesverbrechen
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Interpunktionsprobleme
spacing|Abstandsprobleme
layout|Layout-Probleme
font|Schriftartenprobleme
symbol|Symbolprobleme
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Doppelte Leerzeichen
straightQuotes|Einfache Anführungszeichen
hyphenAsDash|Bindestrich als Bindestrich
fakeEllipsis|Gefälschte Ellipse
widow|Witwen
orphan|Waisen
inconsistentSpacing|Inkonsistenter Abstand
comicSans|Comic Sans
primeMarks|Prime Marks
multiplicationSign|Falsches Multiplikationszeichen
trademarkSymbol|Missbrauch von Markensymbolen
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Zusätzliche Leerzeichen nach Satzende-Interpunktion.
straightQuotes|ASCII-Anführungszeichen werden dort verwendet, wo geschweifte Anführungszeichen hingehören.
hyphenAsDash|Bindestriche ersetzen einen echten Bindestrich.
fakeEllipsis|Drei Punkte werden anstelle des Auslassungszeichens verwendet.
widow|Eine letzte Zeile mit nur einem kurzen Wort.
orphan|Eine kleine Überbleibselzeile am Anfang eines Absatzes.
inconsistentSpacing|Gemischte Satzabstände in einem Text.
comicSans|Comic Sans in den eingereichten Beweisen gefunden.
primeMarks|ASCII-Anführungszeichen werden dort verwendet, wo Primzeichen hingehören.
multiplicationSign|Der Buchstabe x wird anstelle von × verwendet.
trademarkSymbol|Fallback-Notation wird anstelle von ©, ® oder ™ verwendet.
"""),
        articles: articleMap([
            (.doubleSpace, "Doppelte Leerzeichen nach einem Satz sind auf Schreibgewohnheiten zurückzuführen. In der modernen Proportionalschrift ist ein Leerzeichen die sauberere Standardeinstellung.", "Zusätzliche Leerzeichen erzeugen einen ungleichmäßigen Rhythmus und sichtbare Lücken in einem Absatz.", "Schreibmaschinen verwendeten Zeichen mit fester Breite, daher halfen zusätzliche Abstände früher den Lesern, Satzumbrüche zu erkennen.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Suchen Sie nach wiederholten Leerzeichen nach Satzzeichen.", "Führen Sie vor dem Teilen einen kurzen Aufräumvorgang durch.", "Wenn doppelte Leerzeichen beabsichtigt sind, achten Sie darauf, dass sie konsistent bleiben."]),
            (.straightQuotes, "Gerade Anführungszeichen sind einfache ASCII-Zeichen. Fertiger Text liest sich normalerweise besser, wenn Sie richtungsgebundene Anführungszeichen verwenden.", "Geschwungene Anführungszeichen wirken eleganter und verbessern den visuellen Rhythmus eines Satzes.", "Frühe Tastaturen und Zeichensätze enthielten nur ein einfaches Anführungszeichen für beide Richtungen.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Aktivieren Sie die intelligente Zeichensetzung, sofern verfügbar.", "Bereinigen Sie aus Nur-Text-Quellen eingefügten Text.", "Überprüfen Sie die Maße, damit die Hauptmarkierungen korrekt bleiben."]),
            (.hyphenAsDash, "Bindestriche verbinden Wörter, sind aber kein Ersatz für Gedankenstriche oder Gedankenstriche.", "Der richtige Bindestrich verbessert Ton, Abstand und Lesbarkeit.", "Doppelte Bindestriche waren eine Problemumgehung in Systemen, die nicht ohne weiteres eine reichhaltige Interpunktion erzeugen konnten.", "He paused -- dramatically.", "He paused — dramatically.", ["Verwenden Sie den echten Bindestrich, den Ihr Stil erfordert.", "Behalten Sie Bindestriche für zusammengesetzte Wörter bei, nicht für Satzumbrüche.", "Bleiben Sie im gesamten Dokument konsistent."]),
            (.fakeEllipsis, "Drei Punkte können Auslassungspunkte nachahmen, sind aber nicht dasselbe Zeichen.", "Eine echte Ellipse hat einen ausgeglichenen Abstand und verhält sich in einer Textzeile besser.", "Viele gelegentliche Schreibabläufe verwenden immer noch standardmäßig die Eingabe von drei Punkten.", "Wait...", "Wait…", ["Ersetzen Sie drei Punkte durch das Auslassungszeichen.", "Verwenden Sie Textersetzung, wenn Sie ihn häufig eingeben.", "Überprüfen Sie die importierte Kopie vor der Veröffentlichung."]),
            (.widow, "Eine Witwe lässt ein kurzes Wort in der letzten Zeile eines Absatzes hängen.", "Dieses schwache Ende stört die Form und den Rhythmus des Absatzes.", "Redakteure und Designer haben seit langem Zeilenumbrüche angepasst, um Witwen im Druck zu vermeiden.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Sprengen Sie den Satz oder schreiben Sie ihn leicht um.", "Passen Sie die Zeilenlänge an, wenn Layout-Tools verfügbar sind.", "Behandeln Sie dies als sanfte Stilempfehlung."]),
            (.orphan, "Eine verwaiste Zeile ist eine winzige Überbleibselzeile, die einen neuen Absatz oder Textblock umständlich beginnt.", "Es unterbricht den Lesefluss und lässt das Layout weniger durchdacht wirken.", "Redaktionelle Arbeitsabläufe beheben traditionell Waisen vor der Veröffentlichung.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Schreiben Sie eine nahegelegene Phrase neu, um die Pause wieder ins Gleichgewicht zu bringen.", "Öffnen Sie den Takt leicht, wenn Sie das Layout steuern möchten.", "Verwenden Sie es als Warnung, nicht als starren Fehler."]),
            (.inconsistentSpacing, "Durch das Mischen einzelner und doppelter Satzabstände wirkt der Text wie aus verschiedenen Quellen zusammengesetzt.", "Leser bemerken Inkonsistenzen schnell, auch wenn sie nicht erklären können, warum.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Wählen Sie einen Satzabstandsstil.", "Normalisieren Sie den eingefügten Text, bevor Sie ihn teilen.", "Halten Sie die Auswahl von Anfang bis Ende konsistent."]),
            (.comicSans, "Comic Sans ist nicht verboten, aber es hat einen starken kulturellen Ton, der oft mit seriöser Kopie kollidiert.", "Schriftarten kommunizieren die Stimmung, bevor ein Leser die Wörter überhaupt verarbeitet.", "Comic Sans wurde 1994 für eine Softwareschnittstelle für Kinder entwickelt und verbreitete sich später weit über diesen Kontext hinaus.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Wählen Sie eine Schriftart, die zur Nachricht passt.", "Reservieren Sie verspielte Displayflächen für eindeutig spielerische Arbeiten.", "Deaktivieren Sie diesen Detektor, wenn die Auswahl beabsichtigt ist."]),
            (.primeMarks, "Maßeinheiten wie Fuß, Zoll, Minuten und Sekunden erfordern häufig Apostrophe anstelle von Anführungszeichen.", "Die richtige Markierung verhindert Mehrdeutigkeiten und lässt technischen Text bewusster wirken.", nil, "5'11\"", "5′11″", ["Verwenden Sie nach Ziffern Primzahlen und Doppeltprimzahlen.", "Achten Sie auf die automatische Smart-Quote-Konvertierung.", "Überprüfen Sie die Spezifikationen, Menüs und Produktabmessungen sorgfältig."]),
            (.multiplicationSign, "Der Buchstabe x und das Multiplikationszeichen sind in ihren Abmessungen nicht austauschbar.", "Die Verwendung von × verleiht technischen Texten und Produkttexten ein saubereres typografisches Finish.", nil, "1920x1080", "1920×1080", ["Ersetzen Sie x zwischen Zahlen durch ×.", "Textersetzung für gängige Größenformate verwenden.", "Überprüfen Sie Spezifikationen und Marketingressourcen auf Konsistenz."]),
            (.trademarkSymbol, "Formulare wie (c), (r) und (tm) sind Fallback-Notationen, keine polierte endgültige Kopie.", "Die richtigen Symbole sparen Platz und sorgen dafür, dass Rechts- oder Markentexte fertig aussehen.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Ersetzen Sie die Fallback-Notation durch ©, ® und ™.", "Überprüfen Sie vor der Veröffentlichung die rechtlichen und Marketingtexte.", "Halten Sie den Abstand um diese Symbole konsistent."])
        ])
    )

    static let frenchPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratoire criminel
app.tab.case_files|Dossiers
app.tab.learn|Apprendre
app.tab.settings|Paramètres
counts.crimes_categories|Crimes : %@ · Catégories : %@
counts.detected_issues|Problèmes détectés : %@
counts.entries|Entrées : %@
counts.characters|Personnages : %@
counts.line_column|Ligne %@ · Col %@
counts.crimes_verdict|Délits : %@ · %@
share.offense_line|• %@ : %@
general.done|Terminé
general.cancel|Annuler
general.retry|Réessayer
general.next|Suivant
general.skip|Sauter
general.got_it|Compris
general.coming_soon|Bientôt
general.wrong|Faux
general.right|Droite
history.empty_title|Aucun cas pour l'instant
history.empty_subtitle|Exécutez une analyse et vos dossiers apparaîtront ici.
history.share|Partager
history.delete|Supprimer
history.title|Dossiers
history.today|AUJOURD'HUI
history.yesterday|HIER
history.this_week|CETTE SEMAINE
history.this_month|CE MOIS
history.select_all|Sélectionner tout
history.delete_selected|Supprimer la sélection
learn.title|La bibliothèque de droit
learn.search_prompt|Rechercher des types de crimes
learn.empty_title|Aucun crime correspondant trouvé
learn.empty_subtitle|Essayez un autre terme de recherche.
learn.what_is_this|Quel est ce problème ?
learn.why_it_matters|Pourquoi c'est important
learn.history_origin|Historique et contexte
learn.how_to_fix|Comment résoudre ce problème
learn.default_why|Une bonne typographie est un système de détails réfléchis.
learn.default_fix|Utilisez le caractère correct et gardez le document cohérent.
input.method|Méthode de saisie
input.method.paste|Coller / Taper
input.method.camera|Caméra (OCR)
input.placeholder|Collez ou tapez votre texte ici…
input.paste_from_clipboard|Coller depuis le Presse-papiers
input.title|Soumettre des preuves
input.analyze|Analyser
input.analyze_evidence|Analyser les preuves
input.camera_message|La reconnaissance de texte basée sur une caméra sera disponible dans une prochaine mise à jour. Pour l'instant, collez ou tapez votre texte à analyser.
input.trimmed_warning|Le texte a été réduit à 100 000 caractères.
input.clipboard_empty|Le Presse-papiers est vide. Copiez d'abord du texte.
input.no_text|Aucun texte à analyser. Collez ou tapez d'abord du texte.
home.new_investigation|Nouvelle enquête
home.new_investigation_subtitle|Coller ou saisir du texte pour commencer l'analyse typographique médico-légale
home.new_investigation_badge|PÂTER · TYPE · ANALYSER
home.recent_cases|Cas récents
home.see_all|Voir tout →
home.empty_title|Aucun cas pour l'instant
home.empty_subtitle|Démarrez votre première enquête.
home.begin_investigation|Commencer l'enquête
home.stat.scans|Analyses
home.stat.crimes|Crimes
home.stat.avg|Moyenne
onboarding.splash_tagline|Chaque glyphe est une preuve.
onboarding.page1.title|Coller. Analyser. Révision.
onboarding.page1.body|Insérez n'importe quel texte et l'application signalera les problèmes typographiques cachés à la vue de tous.
onboarding.page2.title|Nous attrapons ce qui manque à la vérification orthographique
onboarding.page2.body|Des guillemets droits, de fausses ellipses, des traits d'union se faisant passer pour des tirets cadratins et des espacements incohérents apparaissent tous ici.
onboarding.page3.title|Obtenez votre score de criminalité
onboarding.page3.body|Voyez à quel point votre typographie est soignée, puis partagez votre verdict.
onboarding.page4.title|Apprenez au fur et à mesure
onboarding.page4.body|Ouvrez n'importe quel problème pour voir pourquoi il est important et comment le résoudre.
onboarding.start|Commencer à enquêter
onboarding.sample.not_em_dash|Pas un tiret cadratin
onboarding.library.investigate|Enquêter
onboarding.library.study|Etudiez les règles
analysis.failed_title|Échec de l'analyse
analysis.failed_body|Quelque chose s’est mal passé lors de l’analyse. Veuillez réessayer.
analysis.status.scan|Analyse des preuves typographiques…
analysis.status.quotes|Vérification des guillemets…
analysis.status.dashes|Vérification de l'utilisation du tableau de bord…
analysis.status.ellipsis|Vérification des ellipses…
analysis.status.spacing|Vérification de la cohérence des espacements…
analysis.status.layout|Vérification des veuves et des orphelins…
analysis.status.comic_sans|Vérification des métadonnées des polices…
analysis.status.compiling|Compilation du rapport…
mugshot.title|Marqué pour mauvaise conduite typographique
mugshot.body|Comic Sans a été trouvé dans les preuves soumises. Dans des contextes ludiques, cela peut fonctionner, mais dans la plupart des contextes produits et éditoriaux, cela se lit comme une inadéquation.
mugshot.continue|Ouvrir le rapport complet →
report.breakdown|Répartition de la criminalité
report.share|Partager le rapport
report.new_scan|Nouvelle analyse
report.close|Fermer le rapport
report.copy_fixed|Copier le texte fixe
report.copy_fixed_hint|Copie le texte corrigé actuel.
report.clean_title|impeccable
report.clean_body|Aucun problème typographique n’a été détecté. Ce texte est un citoyen modèle.
report.replace_single_space|Remplacer par un seul espace
report.fixed_text_copied|Texte corrigé copié ✓
report.manual_rewrite|Ce problème nécessite une réécriture manuelle.
report.apply_failed|Impossible d'appliquer ce correctif.
report.issue_fixed|Problème résolu et rapport mis à jour ✓
report.learn_more|En savoir plus sur ce problème →
settings.detection_rules|Règles de détection
settings.scoring|Notation
settings.strictness|Rigueur de notation
settings.dash_style|Style tiret
settings.appearance|Apparence
settings.theme|Thème
settings.haptics|Retour haptique
settings.sounds|Effets sonores
settings.data|Données
settings.clear_all|Effacer tous les dossiers
settings.export_all|Exporter tous les rapports
settings.about|À propos
settings.version|Version
settings.typpo|Typpo
settings.rate_app|Tarif sur App Store
settings.send_feedback|Envoyer des commentaires
settings.privacy|Politique de confidentialité
settings.footer|Fabriqué avec soin et avec des citations frisées appropriées.
settings.title|Paramètres
settings.clear_confirm_title|Effacer tous les dossiers ?
settings.clear_confirm_message|Cette action ne peut pas être annulée.
settings.delete_all|Supprimer tout
settings.about_body|Analyse médico-légale de votre texte. Collez n'importe quel texte, obtenez votre score et partagez le verdict.
settings.about_placeholder|Cette version est entièrement hors ligne et utilise toujours des liens de version réservés pour le site Web, la politique de confidentialité et la destination App Store.
settings.about_website|Site Web : %@
share.title|Partager le rapport
share.copy_report_image|Copier l'image du rapport
share.save_to_photos|Enregistrer dans Photos
share.copy_report_text|Copier le texte du rapport
share.photos_needed|Accès aux photos requis
share.open_settings|Ouvrir les paramètres
share.photos_message|L'accès aux photos est nécessaire pour enregistrer l'image du rapport. Ouvrez les paramètres pour accorder l'accès.
share.primary.share_text|Partager du texte
share.primary.copy_link|Copier le lien
share.primary.share|Partager
share.copied_clipboard|Copié dans le presse-papier ✓
share.deep_link_copied|Lien profond copié ✓
share.render_failed|Impossible de restituer l'image du rapport.
share.saved_photos|Enregistré dans les photos ✓
share.save_failed|Impossible d'enregistrer l'image du rapport.
share.swipe_up|OUVREZ L'APPLICATION POUR ANALYSER VOTRE PROPRE TEXTE
share.report_heading|Rapport de typographie
share.score_prefix|Partition
share.top_issues|Principaux problèmes
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Votre texte ne contient que des espaces. Ce n'est pas criminel, mais c'est suspect.
engine.non_latin_warning|L'analyse est adaptée à la typographie en écriture latine. Certaines règles d'espacement et de ponctuation peuvent ne pas s'appliquer à ce système d'écriture.
engine.short_text_note|La détection des veuves et des orphelins est moins fiable sur les passages très courts.
engine.fix.single_space|Utilisez un seul espace après la ponctuation de fin de phrase.
engine.fix.replace_with|Remplacer par %@
engine.fix.normalize_spacing|Normaliser l'espacement des phrases dans tout le texte.
engine.fix.rewrite_widow|Réécrivez ou redistribuez le paragraphe pour éviter une dernière ligne d'un seul mot.
engine.fix.rewrite_orphan|Ajustez la copie à proximité pour éviter une petite ligne de report.
engine.fix.change_font|Utilisez une police plus adaptée.
engine.explain.double_space|Cette phrase se termine par plusieurs espaces, une convention de l'ère des machines à écrire qui n'appartient pas à la typographie proportionnelle.
engine.explain.straight_quotes|Ce guillemet utilise la forme droite ASCII au lieu de guillemets directionnels bouclés.
engine.explain.hyphen_dash|Cette interruption utilise des traits d'union moins au lieu d'un tiret approprié.
engine.explain.fake_ellipsis|Cette séquence de points doit être remplacée par le caractère points de suspension.
engine.explain.inconsistent_spacing|Cet espacement des phrases diffère du modèle dominant dans le texte.
engine.explain.widow|Le paragraphe se termine par un mot de dernière ligne isolé, créant une veuve visible.
engine.explain.orphan|Ce paragraphe commence par une ligne très courte après un long paragraphe précédent, qui se lit probablement comme orphelin.
engine.explain.comic_sans|Les métadonnées Comic Sans ont été trouvées dans le texte enrichi soumis.
engine.explain.prime_marks|Cette marque de mesure utilise un guillemet ASCII au lieu d'un symbole premier approprié.
engine.explain.multiplication_sign|Cette dimension utilise la lettre x à l'endroit où le signe de multiplication doit apparaître.
engine.explain.trademark_symbol|Cette notation de secours doit être remplacée par le symbole approprié.
category.punctuation|Problèmes de ponctuation
category.spacing|Problèmes d'espacement
category.layout|Problèmes de mise en page
category.font|Problèmes de police
category.symbol|Problèmes de symboles
severity.infraction|INFRACTION
severity.misdemeanor|MÉLIT
severity.felony|FELONY
verdict.clean|NETTOYER
verdict.infraction|INFRACTION
verdict.misdemeanor|MÉLIT
verdict.felony|FELONY
verdict.capital|INFRACTION CAPITALE
strictness.lenient|Indulgent
strictness.standard|Standard
strictness.strict|Strict
theme.system|Système
theme.light|Lumière
theme.dark|Sombre
dash.spaced|Espaceé
dash.closed|Fermé
share_format.image|Image
share_format.story|Histoire
share_format.landscape|Paysage
share_format.text|Texte brut
share_format.link|Copier le lien
share_format_desc.image|Image PNG optimisée pour les flux sociaux.
share_format_desc.story|Rapport 1 080 × 1 920 prêt pour l'histoire.
share_format_desc.landscape|Carte large pour les aperçus d'articles et de réseaux sociaux.
share_format_desc.text|Résumé textuel formaté.
share_format_desc.link|Copie du lien profond avec espace réservé.
evidence_source.typed|Saisi
evidence_source.pasted|Collé
evidence_source.pasted_rich|Texte enrichi collé
toast.load_failed|Impossible de charger les fichiers de cas enregistrés.
toast.save_failed|Impossible d'enregistrer le dossier.
toast.delete_failed|La suppression a échoué.
toast.cleared|Tous les dossiers ont été effacés.
toast.clear_failed|Impossible d'effacer les dossiers.
toast.export_failed|Échec de l'exportation.
"""),
        verdictShortLabels: verdictMap("""
clean|NETTOYER
infraction|INFRACTION
misdemeanor|MÉLIT
felony|FELONY
capitalOffense|INFRACTION CAPITALE
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problèmes de ponctuation
spacing|Problèmes d'espacement
layout|Problèmes de mise en page
font|Problèmes de police
symbol|Problèmes de symboles
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Espaces doubles
straightQuotes|Citations directes
hyphenAsDash|Trait d'union en tiret
fakeEllipsis|Fausses points de suspension
widow|Veuves
orphan|Orphelins
inconsistentSpacing|Espacement incohérent
comicSans|Comic Sans
primeMarks|Marques principales
multiplicationSign|Mauvais signe de multiplication
trademarkSymbol|Utilisation abusive du symbole de marque
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Espaces supplémentaires après la ponctuation de fin de phrase.
straightQuotes|Les guillemets ASCII sont utilisés à la place des guillemets bouclés.
hyphenAsDash|Des traits d'union remplacent un vrai tiret.
fakeEllipsis|Trois points utilisés à la place du caractère points de suspension.
widow|Une dernière ligne avec un seul mot court.
orphan|Une petite ligne de report au début d'un paragraphe.
inconsistentSpacing|Styles d'espacement des phrases mixtes dans un seul texte.
comicSans|Comic Sans détecté dans les preuves soumises.
primeMarks|Guillemets ASCII utilisés là où appartiennent les symboles premiers.
multiplicationSign|La lettre x utilisée à la place de ×.
trademarkSymbol|Notation de secours utilisée à la place de ©, ® ou ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Les doubles espaces après une phrase proviennent des habitudes de la machine à écrire. Dans les caractères proportionnels modernes, un espace est la valeur par défaut la plus propre.", "Les espaces supplémentaires créent un rythme irrégulier et des espaces visibles dans un paragraphe.", "Les machines à écrire utilisaient des caractères à largeur fixe, donc un espacement supplémentaire aidait autrefois les lecteurs à voir les sauts de phrase.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Recherchez les espaces répétés après la ponctuation.", "Effectuez un nettoyage rapide avant de partager.", "Si les doubles espaces sont intentionnels, veillez à ce qu'ils soient cohérents."]),
            (.straightQuotes, "Les guillemets droits sont de simples marques ASCII. Le texte final se lit généralement mieux avec des guillemets directionnels bouclés.", "Les guillemets bouclés semblent plus soignés et améliorent le rythme visuel d'une phrase.", "Les premiers claviers et jeux de caractères ne conservaient qu'un simple guillemet dans les deux sens.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Activez la ponctuation intelligente lorsqu'elle est disponible.", "Nettoyer le texte collé à partir de sources de texte brut.", "Vérifiez les mesures pour que les repères restent corrects."]),
            (.hyphenAsDash, "Les traits d'union joignent les mots, mais ils ne remplacent pas les tirets em ou les tirets en.", "Le tiret correct améliore le ton, l'espacement et la lisibilité.", "Les doubles traits d'union constituaient une solution de contournement dans les systèmes qui ne pouvaient pas facilement produire une ponctuation riche.", "He paused -- dramatically.", "He paused — dramatically.", ["Utilisez le vrai caractère de tiret requis par votre style.", "Conservez les traits d'union pour les composés, pas les sauts de phrase.", "Restez cohérent dans l'ensemble du document."]),
            (.fakeEllipsis, "Trois points peuvent imiter des points de suspension, mais ce ne sont pas le même caractère.", "Les véritables points de suspension ont un espacement équilibré et se comportent mieux dans une ligne de texte.", "De nombreux flux de travail d'écriture occasionnels utilisent toujours par défaut la saisie de trois points.", "Wait...", "Wait…", ["Remplacez trois points par des points de suspension.", "Utilisez le remplacement de texte si vous le saisissez souvent.", "Vérifiez la copie importée avant de la publier."]),
            (.widow, "Une veuve laisse un mot court bloqué sur la dernière ligne d'un paragraphe.", "Cette fin faible perturbe la forme et le rythme du paragraphe.", "Les éditeurs et les concepteurs ont depuis longtemps ajusté les sauts de ligne pour éviter les veuves lors de l'impression.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Rendez ou réécrivez légèrement la phrase.", "Ajustez la longueur de la ligne si des outils de mise en page sont disponibles.", "Considérez ceci comme une recommandation de style doux."]),
            (.orphan, "Un orphelin est une petite ligne reportée qui commence maladroitement un nouveau paragraphe ou un nouveau bloc de texte.", "Cela interrompt le flux de lecture et donne l'impression que la mise en page est moins prise en compte.", "Les workflows éditoriaux corrigent traditionnellement les orphelins avant la publication.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Réécrivez une phrase proche pour rééquilibrer la pause.", "Ouvrez légèrement la mesure si vous contrôlez la disposition.", "Utilisez-le comme un avertissement, pas comme une erreur rigide."]),
            (.inconsistentSpacing, "Le mélange d'espacements de phrases simples et doubles donne l'impression que le texte provient de différentes sources.", "Les lecteurs remarquent rapidement les incohérences, même s'ils ne peuvent pas expliquer pourquoi.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Choisissez un style d'espacement des phrases.", "Normalisez le texte collé avant de le partager.", "Garder le choix cohérent du début à la fin."]),
            (.comicSans, "Comic Sans n'est pas interdit, mais il véhicule un ton culturel fort qui entre souvent en conflit avec une copie sérieuse.", "Les polices communiquent l'ambiance avant même que le lecteur ne traite les mots.", "Comic Sans a été conçu en 1994 pour une interface logicielle pour enfants et s'est ensuite répandu bien au-delà de ce contexte.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Choisissez une police de caractères qui correspond au message.", "Réservez des faces d'affichage ludiques pour un travail clairement ludique.", "Désactivez ce détecteur si le choix est intentionnel."]),
            (.primeMarks, "Les mesures telles que les pieds, les pouces, les minutes et les secondes nécessitent souvent des symboles premiers plutôt que des guillemets.", "La marque correcte évite toute ambiguïté et donne au texte technique un aspect plus délibéré.", nil, "5'11\"", "5′11″", ["Utilisez des symboles prime et double prime après les chiffres.", "Surveillez la conversion automatique des devis intelligents.", "Vérifiez attentivement les spécifications, les menus et les dimensions du produit."]),
            (.multiplicationSign, "La lettre x et le signe de multiplication ne sont pas interchangeables en dimensions.", "L'utilisation de × donne à la copie technique et au produit une finition typographique plus nette.", nil, "1920x1080", "1920×1080", ["Remplacez x entre les nombres par ×.", "Utiliser le remplacement de texte pour les formats de taille courants.", "Vérifiez la cohérence des spécifications et des éléments marketing."]),
            (.trademarkSymbol, "Les formulaires tels que (c), (r) et (tm) sont des notations de secours et non une copie finale raffinée.", "Les symboles appropriés permettent d'économiser de l'espace et donnent un aspect fini au texte légal ou à la marque.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Remplacez la notation de secours par ©, ® et ™.", "Vérifiez les textes juridiques et marketing avant la publication.", "Maintenez un espacement cohérent autour de ces symboles."])
        ])
    )

    static let spanishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratorio criminalístico
app.tab.case_files|Archivos de casos
app.tab.learn|Aprender
app.tab.settings|Configuración
counts.crimes_categories|Delitos: %@ · Categorías: %@
counts.detected_issues|Problemas detectados: %@
counts.entries|Entradas: %@
counts.characters|Personajes: %@
counts.line_column|Línea %@ · Col %@
counts.crimes_verdict|Delitos: %@ · %@
share.offense_line|• %@: %@
general.done|Listo
general.cancel|Cancelar
general.retry|Reintentar
general.next|Siguiente
general.skip|Saltar
general.got_it|Entendido
general.coming_soon|Próximamente
general.wrong|Incorrecto
general.right|Correcto
history.empty_title|Aún no hay casos
history.empty_subtitle|Ejecute un análisis y los archivos de su caso aparecerán aquí.
history.share|Compartir
history.delete|Eliminar
history.title|Archivos de casos
history.today|HOY
history.yesterday|AYER
history.this_week|ESTA SEMANA
history.this_month|ESTE MES
history.select_all|Seleccionar todo
history.delete_selected|Eliminar seleccionados
learn.title|La Biblioteca de Derecho
learn.search_prompt|Buscar tipos de delitos
learn.empty_title|No se encontraron delitos coincidentes
learn.empty_subtitle|Pruebe con un término de búsqueda diferente.
learn.what_is_this|¿Cuál es este problema?
learn.why_it_matters|Por qué es importante
learn.history_origin|Historia y contexto
learn.how_to_fix|Cómo solucionarlo
learn.default_why|La buena tipografía es un sistema de detalles bien pensados.
learn.default_fix|Utilice el carácter correcto y mantenga la coherencia del documento.
input.method|Método de entrada
input.method.paste|Pegar/Escribir
input.method.camera|Cámara (OCR)
input.placeholder|Pegue o escriba su texto aquí…
input.paste_from_clipboard|Pegar desde el Portapapeles
input.title|Enviar pruebas
input.analyze|Analizar
input.analyze_evidence|Analizar evidencia
input.camera_message|El reconocimiento de texto basado en cámara llegará en una actualización futura. Por ahora, pega o escribe tu texto para analizarlo.
input.trimmed_warning|El texto se redujo a 100.000 caracteres.
input.clipboard_empty|El portapapeles está vacío. Primero copia algo de texto.
input.no_text|No hay texto para analizar. Pega o escribe algún texto primero.
home.new_investigation|Nueva investigación
home.new_investigation_subtitle|Pegue o escriba texto para comenzar el análisis de tipografía forense
home.new_investigation_badge|PEGAR · TIPO · ANALIZAR
home.recent_cases|Casos recientes
home.see_all|Ver todo →
home.empty_title|Aún no hay casos
home.empty_subtitle|Inicie su primera investigación.
home.begin_investigation|Comenzar la investigación
home.stat.scans|Escaneos
home.stat.crimes|Crímenes
home.stat.avg|Promedio
onboarding.splash_tagline|Cada glifo es evidencia.
onboarding.page1.title|Pegar. Analizar. Revisar.
onboarding.page1.body|Introduzca cualquier texto y la aplicación señalará los problemas tipográficos que se oculten a simple vista.
onboarding.page2.title|Captamos lo que falla en el corrector ortográfico
onboarding.page2.body|Aquí aparecen comillas rectas, elipses falsas, guiones que simulan ser guiones y espacios inconsistentes.
onboarding.page3.title|Obtenga su puntaje de criminalidad
onboarding.page3.body|Vea qué tan limpia es su tipografía y luego comparta el veredicto.
onboarding.page4.title|Aprende sobre la marcha
onboarding.page4.body|Abra cualquier problema para ver por qué es importante y cómo solucionarlo.
onboarding.start|Comience a investigar
onboarding.sample.not_em_dash|No es un guión largo
onboarding.library.investigate|Investigar
onboarding.library.study|Estudia las reglas
analysis.failed_title|Análisis fallido
analysis.failed_body|Algo salió mal durante el escaneo. Inténtalo de nuevo.
analysis.status.scan|Escaneo en busca de evidencia tipográfica…
analysis.status.quotes|Revisando las comillas…
analysis.status.dashes|Comprobando el uso del tablero…
analysis.status.ellipsis|Comprobando elipses…
analysis.status.spacing|Comprobando la coherencia del espaciado…
analysis.status.layout|Controlando a viudas y huérfanos…
analysis.status.comic_sans|Comprobando metadatos de fuente…
analysis.status.compiling|Compilando informe…
mugshot.title|Marcado por mala conducta tipográfica
mugshot.body|Comic Sans se encontró en la evidencia presentada. En contextos lúdicos puede funcionar, pero en la mayoría de entornos editoriales y de productos se interpreta como una discrepancia.
mugshot.continue|Abrir informe completo →
report.breakdown|Desglose de delitos
report.share|Compartir informe
report.new_scan|Nuevo escaneo
report.close|Cerrar informe
report.copy_fixed|Copiar texto fijo
report.copy_fixed_hint|Copia el texto corregido actual.
report.clean_title|Impecable
report.clean_body|No se detectaron problemas tipográficos. Este texto es un ciudadano modelo.
report.replace_single_space|Reemplazar con un solo espacio
report.fixed_text_copied|Texto fijo copiado ✓
report.manual_rewrite|Este número necesita una reescritura manual.
report.apply_failed|No se pudo aplicar esta solución.
report.issue_fixed|Problema solucionado e informe actualizado ✓
report.learn_more|Más información sobre este problema →
settings.detection_rules|Reglas de detección
settings.scoring|Puntuación
settings.strictness|Stricción de la puntuación
settings.dash_style|Estilo Em-dash
settings.appearance|Apariencia
settings.theme|Tema
settings.haptics|Retroalimentación háptica
settings.sounds|Efectos de sonido
settings.data|Datos
settings.clear_all|Borrar todos los archivos de casos
settings.export_all|Exportar todos los informes
settings.about|Acerca de
settings.version|Versión
settings.typpo|Typpo
settings.rate_app|Califica en App Store
settings.send_feedback|Enviar comentarios
settings.privacy|Política de Privacidad
settings.footer|Hecho con cuidado y con citas rizadas adecuadas.
settings.title|Configuración
settings.clear_confirm_title|¿Borrar todos los archivos del caso?
settings.clear_confirm_message|Esta acción no se puede deshacer.
settings.delete_all|Eliminar todo
settings.about_body|Análisis forense de su texto. Pega cualquier texto, obtén tu puntuación y comparte el veredicto.
settings.about_placeholder|Esta compilación está completamente fuera de línea y todavía utiliza enlaces de lanzamiento de marcador de posición para el sitio web, la política de privacidad y el destino App Store.
settings.about_website|Sitio web: %@
share.title|Compartir informe
share.copy_report_image|Copiar imagen de informe
share.save_to_photos|Guardar en Fotos
share.copy_report_text|Copiar texto del informe
share.photos_needed|Se necesita acceso a las fotos
share.open_settings|Abrir configuración
share.photos_message|Se necesita acceso a fotos para guardar la imagen del informe. Abre Configuración para otorgar acceso.
share.primary.share_text|Compartir texto
share.primary.copy_link|Copiar enlace
share.primary.share|Compartir
share.copied_clipboard|Copiado al portapapeles ✓
share.deep_link_copied|Enlace profundo copiado ✓
share.render_failed|No se pudo representar la imagen del informe.
share.saved_photos|Guardado en Fotos ✓
share.save_failed|No se pudo guardar la imagen del informe.
share.swipe_up|ABRE LA APLICACIÓN PARA ANALIZAR TU PROPIO TEXTO
share.report_heading|Informe tipográfico
share.score_prefix|Puntuación
share.top_issues|Problemas principales
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Su texto contiene sólo espacios en blanco. No es criminal, pero sí sospechoso.
engine.non_latin_warning|El análisis está ajustado a la tipografía de escritura latina. Es posible que algunas reglas de espaciado y puntuación no se apliquen a este sistema de escritura.
engine.short_text_note|La detección de viudas y huérfanos es menos fiable en pasajes muy cortos.
engine.fix.single_space|Utilice un solo espacio después de la puntuación al final de la oración.
engine.fix.replace_with|Reemplazar con %@
engine.fix.normalize_spacing|Normalizar el espaciado entre oraciones en todo el texto.
engine.fix.rewrite_widow|Reescribe o redistribuye el párrafo para evitar una línea final de una sola palabra.
engine.fix.rewrite_orphan|Ajusta el texto cercano para evitar una pequeña línea remanente.
engine.fix.change_font|Utilice una fuente más adecuada.
engine.explain.double_space|Esta oración termina con múltiples espacios, una convención de la era de las máquinas de escribir que no pertenece a la tipografía proporcional.
engine.explain.straight_quotes|Estas comillas utilizan la forma recta ASCII en lugar de comillas direccionales.
engine.explain.hyphen_dash|Esta interrupción utiliza guiones menos en lugar de un guión adecuado.
engine.explain.fake_ellipsis|Esta serie de puntos debe reemplazarse con el carácter de puntos suspensivos.
engine.explain.inconsistent_spacing|Este espaciado entre oraciones difiere del patrón dominante en el texto.
engine.explain.widow|El párrafo termina con una palabra aislada en la última línea, creando una viuda visible.
engine.explain.orphan|Este párrafo comienza con una línea muy corta después de un párrafo anterior largo, que probablemente se lea como huérfano.
engine.explain.comic_sans|Se encontraron metadatos de Comic Sans en el texto enriquecido enviado.
engine.explain.prime_marks|Esta marca de medición utiliza una comilla ASCII en lugar de un símbolo primo adecuado.
engine.explain.multiplication_sign|Esta dimensión utiliza la letra x donde debe aparecer el signo de multiplicación.
engine.explain.trademark_symbol|Esta notación alternativa debe reemplazarse con el símbolo adecuado.
category.punctuation|Problemas de puntuación
category.spacing|Problemas de espaciado
category.layout|Problemas de diseño
category.font|Problemas con fuentes
category.symbol|Problemas con los símbolos
severity.infraction|INFRACCIÓN
severity.misdemeanor|DELITO MENOR
severity.felony|DELITO
verdict.clean|LIMPIAR
verdict.infraction|INFRACCIÓN
verdict.misdemeanor|DELITO MENOR
verdict.felony|DELITO
verdict.capital|INFRACCIÓN CAPITAL
strictness.lenient|Indulgente
strictness.standard|Estándar
strictness.strict|Estricto
theme.system|Sistema
theme.light|Luz
theme.dark|Oscuro
dash.spaced|Espaciado
dash.closed|Cerrado
share_format.image|Imagen
share_format.story|Historia
share_format.landscape|Paisaje
share_format.text|Texto sin formato
share_format.link|Copiar enlace
share_format_desc.image|Imagen PNG optimizada para feeds sociales.
share_format_desc.story|Informe listo para historia de 1080×1920.
share_format_desc.landscape|Tarjeta ancha para vistas previas de artículos y redes sociales.
share_format_desc.text|Resumen textual formateado.
share_format_desc.link|Copia del enlace profundo del marcador de posición.
evidence_source.typed|Escrito
evidence_source.pasted|Pegado
evidence_source.pasted_rich|Texto enriquecido pegado
toast.load_failed|No se pudieron cargar los archivos de casos guardados.
toast.save_failed|No se pudo guardar el expediente del caso.
toast.delete_failed|Error al eliminar.
toast.cleared|Todos los expedientes del caso borrados.
toast.clear_failed|No se pudieron borrar los archivos del caso.
toast.export_failed|Error en la exportación.
"""),
        verdictShortLabels: verdictMap("""
clean|LIMPIAR
infraction|INFRACCIÓN
misdemeanor|DELITO MENOR
felony|DELITO
capitalOffense|INFRACCIÓN CAPITAL
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problemas de puntuación
spacing|Problemas de espaciado
layout|Problemas de diseño
font|Problemas con fuentes
symbol|Problemas con los símbolos
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Espacios dobles
straightQuotes|Comillas rectas
hyphenAsDash|Guión como guión
fakeEllipsis|Elipsis falsa
widow|Viudas
orphan|Huérfanos
inconsistentSpacing|Espaciado inconsistente
comicSans|Comic Sans
primeMarks|Marcas principales
multiplicationSign|Signo de multiplicación incorrecto
trademarkSymbol|Uso indebido del símbolo de marca registrada
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Espacios adicionales después de la puntuación al final de la oración.
straightQuotes|Se utilizan comillas ASCII donde pertenecen las comillas.
hyphenAsDash|Los guiones sustituyen a un guión real.
fakeEllipsis|Se utilizan tres puntos en lugar del carácter de puntos suspensivos.
widow|Queda una última línea con solo una palabra corta.
orphan|Una pequeña línea remanente al comienzo de un párrafo.
inconsistentSpacing|Estilos de espaciado de oraciones mixtos en un texto.
comicSans|Comic Sans detectado en la evidencia presentada.
primeMarks|Comillas ASCII utilizadas donde pertenecen los símbolos primos.
multiplicationSign|Se utiliza la letra x en lugar de ×.
trademarkSymbol|Se utiliza notación alternativa en lugar de ©, ® o ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Los espacios dobles después de una oración provienen del hábito de escribir. En tipografía proporcional moderna, un espacio es el valor predeterminado más limpio.", "Los espacios adicionales crean un ritmo desigual y espacios visibles en un párrafo.", "Las máquinas de escribir usaban caracteres de ancho fijo, por lo que el espacio adicional alguna vez ayudó a los lectores a ver los saltos de oración.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Busca espacios repetidos después de la puntuación.", "Realice una pasada de limpieza rápida antes de compartir.", "Si los espacios dobles son intencionales, manténgalos coherentes."]),
            (.straightQuotes, "Las comillas rectas son marcas ASCII simples. El texto terminado generalmente se lee mejor con comillas direccionales.", "Las comillas rizadas se ven más pulidas y mejoran el ritmo visual de una oración.", "Los primeros teclados y juegos de caracteres mantenían solo una comilla simple para ambas direcciones.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Activa la puntuación inteligente cuando esté disponible.", "Limpiar texto pegado de fuentes de texto sin formato.", "Compruebe las medidas para que las marcas principales permanezcan correctas."]),
            (.hyphenAsDash, "Los guiones unen palabras, pero no sustituyen a los guiones largos ni a los guiones cortos.", "El guión correcto mejora el tono, el espaciado y la legibilidad.", "Los guiones dobles eran una solución alternativa en sistemas que no podían producir fácilmente una puntuación rica.", "He paused -- dramatically.", "He paused — dramatically.", ["Utiliza el carácter de guión real que tu estilo requiere.", "Mantenga guiones para compuestos, no saltos de oraciones.", "Mantenga la coherencia en todo el documento."]),
            (.fakeEllipsis, "Tres puntos pueden imitar una elipsis, pero no son el mismo carácter.", "Una elipsis real tiene un espaciado equilibrado y se comporta mejor en una línea de texto.", "Muchos flujos de trabajo de escritura ocasionales todavía escriben de forma predeterminada tres puntos.", "Wait...", "Wait…", ["Reemplace tres puntos con el carácter de puntos suspensivos.", "Utiliza el reemplazo de texto si lo escribes con frecuencia.", "Comprueba la copia importada antes de publicarla."]),
            (.widow, "Una viuda deja una palabra corta en la última línea de un párrafo.", "Ese final débil altera la forma y el ritmo del párrafo.", "Los editores y diseñadores han ajustado los saltos de línea para evitar viudas en la impresión.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Ajusta o reescribe ligeramente la oración.", "Ajusta la longitud de la línea si hay herramientas de diseño disponibles.", "Trate esto como una recomendación de estilo suave."]),
            (.orphan, "Un huérfano es una pequeña línea remanente que comienza un nuevo párrafo o bloque de texto de manera incómoda.", "Interrumpe el flujo de lectura y hace que el diseño parezca menos considerado.", "Los flujos de trabajo editoriales tradicionalmente reparan los huérfanos antes de su publicación.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Reescribe una frase cercana para reequilibrar la pausa.", "Abre ligeramente el compás si controlas el diseño.", "Úselo como una advertencia, no como un error rígido."]),
            (.inconsistentSpacing, "Mezclar espacios entre oraciones simples y dobles hace que el texto parezca unido a partir de diferentes fuentes.", "Los lectores notan la inconsistencia rápidamente, incluso cuando no pueden explicar por qué.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Elija un estilo de espaciado de oraciones.", "Normaliza el texto pegado antes de compartirlo.", "Mantenga la elección constante de principio a fin."]),
            (.comicSans, "Comic Sans no está prohibido, pero conlleva un fuerte tono cultural que a menudo choca con una copia seria.", "Las fuentes comunican el estado de ánimo antes de que el lector procese las palabras.", "Comic Sans fue diseñado en 1994 para una interfaz de software para niños y luego se extendió mucho más allá de ese contexto.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Elija un tipo de letra que se ajuste al mensaje.", "Reserve las caras divertidas para el trabajo claramente divertido.", "Desactive este detector si la elección es intencional."]),
            (.primeMarks, "Medidas como pies, pulgadas, minutos y segundos a menudo necesitan símbolos primos en lugar de comillas.", "La marca correcta evita la ambigüedad y hace que el texto técnico parezca más deliberado.", nil, "5'11\"", "5′11″", ["Utilice símbolos primos y dobles primos después de los números.", "Esté atento a la conversión automática de cotizaciones inteligentes.", "Compruebe cuidadosamente las especificaciones, los menús y las dimensiones del producto."]),
            (.multiplicationSign, "La letra x y el signo de multiplicación no son intercambiables en dimensiones.", "El uso de × proporciona a la copia técnica y del producto un acabado tipográfico más limpio.", nil, "1920x1080", "1920×1080", ["Reemplace x entre números con ×.", "Utilice el reemplazo de texto para formatos de tamaño comunes.", "Revise las especificaciones y los recursos de marketing para garantizar la coherencia."]),
            (.trademarkSymbol, "Formas como (c), (r) y (tm) son notación alternativa, no una copia final pulida.", "Los símbolos adecuados ahorran espacio y hacen que el texto legal o de marca parezca acabado.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Reemplace la notación alternativa con ©, ® y ™.", "Consulte la copia legal y de marketing antes del lanzamiento.", "Mantenga constante el espacio alrededor de esos símbolos."])
        ])
    )

    static let brazilianPortuguesePack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratório Criminal
app.tab.case_files|Arquivos de caso
app.tab.learn|Aprenda
app.tab.settings|Configurações
counts.crimes_categories|Crimes: %@ · Categorias: %@
counts.detected_issues|Problemas detectados: %@
counts.entries|Entradas: %@
counts.characters|Personagens: %@
counts.line_column|Linha %@ · Col %@
counts.crimes_verdict|Crimes: %@ · %@
share.offense_line|• %@: %@
general.done|Concluído
general.cancel|Cancelar
general.retry|Tentar novamente
general.next|Próximo
general.skip|Pular
general.got_it|Entendi
general.coming_soon|Em breve
general.wrong|Errado
general.right|Certo
history.empty_title|Nenhum caso ainda
history.empty_subtitle|Faça uma verificação e os arquivos do seu caso aparecerão aqui.
history.share|Compartilhar
history.delete|Excluir
history.title|Arquivos de caso
history.today|HOJE
history.yesterday|ONTEM
history.this_week|ESTA SEMANA
history.this_month|ESTE MÊS
history.select_all|Selecionar tudo
history.delete_selected|Excluir selecionados
learn.title|Biblioteca Jurídica
learn.search_prompt|Pesquisar tipos de crime
learn.empty_title|Nenhum crime correspondente encontrado
learn.empty_subtitle|Tente um termo de pesquisa diferente.
learn.what_is_this|Qual é esse problema?
learn.why_it_matters|Por que é importante
learn.history_origin|Histórico e contexto
learn.how_to_fix|Como consertar
learn.default_why|Uma boa tipografia é um sistema de detalhes bem pensados.
learn.default_fix|Use o caractere correto e mantenha o documento consistente.
input.method|Método de entrada
input.method.paste|Colar/digitar
input.method.camera|Câmera (OCR)
input.placeholder|Cole ou digite seu texto aqui…
input.paste_from_clipboard|Colar da área de transferência
input.title|Enviar evidências
input.analyze|Analisar
input.analyze_evidence|Analisar evidências
input.camera_message|O reconhecimento de texto baseado em câmera será lançado em uma atualização futura. Por enquanto, cole ou digite seu texto para analisar.
input.trimmed_warning|O texto foi reduzido para 100.000 caracteres.
input.clipboard_empty|A área de transferência está vazia. Copie algum texto primeiro.
input.no_text|Não há texto para analisar. Cole ou digite algum texto primeiro.
home.new_investigation|Nova investigação
home.new_investigation_subtitle|Colar ou digitar texto para iniciar a análise tipográfica forense
home.new_investigation_badge|COLAR · DIGITE · ANALISAR
home.recent_cases|Casos recentes
home.see_all|Ver tudo →
home.empty_title|Ainda não há casos
home.empty_subtitle|Inicie sua primeira investigação.
home.begin_investigation|Iniciar investigação
home.stat.scans|Verificações
home.stat.crimes|Crimes
home.stat.avg|Média
onboarding.splash_tagline|Cada glifo é uma evidência.
onboarding.page1.title|Colar. Analisar. Revisão.
onboarding.page1.body|Insira qualquer texto e o aplicativo sinalizará problemas tipográficos ocultos à vista de todos.
onboarding.page2.title|Identificamos o que falta na verificação ortográfica
onboarding.page2.body|Aspas retas, reticências falsas, hífens fingindo ser travessões e espaçamentos inconsistentes aparecem aqui.
onboarding.page3.title|Obtenha sua pontuação criminal
onboarding.page3.body|Veja se sua tipografia está limpa e compartilhe o veredicto.
onboarding.page4.title|Aprenda à medida que avança
onboarding.page4.body|Abra qualquer problema para ver por que ele é importante e como corrigi-lo.
onboarding.start|Comece a investigar
onboarding.sample.not_em_dash|Não é um travessão
onboarding.library.investigate|Investigar
onboarding.library.study|Estude as regras
analysis.failed_title|Falha na análise
analysis.failed_body|Algo deu errado durante a verificação. Tente novamente.
analysis.status.scan|Procurando evidências tipográficas…
analysis.status.quotes|Verificando aspas…
analysis.status.dashes|Verificando o uso do painel…
analysis.status.ellipsis|Verificando reticências…
analysis.status.spacing|Verificando a consistência do espaçamento…
analysis.status.layout|Verificando viúvas e órfãos…
analysis.status.comic_sans|Verificando metadados de fonte…
analysis.status.compiling|Compilando relatório…
mugshot.title|Sinalizado por má conduta tipográfica
mugshot.body|Comic Sans foi encontrado nas evidências enviadas. Em contextos lúdicos, pode funcionar, mas na maioria dos ambientes editoriais e de produtos, parece uma incompatibilidade.
mugshot.continue|Abrir relatório completo →
report.breakdown|Detalhamento do crime
report.share|Compartilhar relatório
report.new_scan|Nova verificação
report.close|Fechar relatório
report.copy_fixed|Copiar texto fixo
report.copy_fixed_hint|Copia o texto corrigido atual.
report.clean_title|Impecável
report.clean_body|Nenhum problema tipográfico foi detectado. Este texto é um cidadão modelo.
report.replace_single_space|Substitua por um único espaço
report.fixed_text_copied|Corrigido texto copiado ✓
report.manual_rewrite|Este problema precisa ser reescrito manualmente.
report.apply_failed|Não foi possível aplicar esta correção.
report.issue_fixed|Problema corrigido e relatório atualizado ✓
report.learn_more|Saiba mais sobre esse problema →
settings.detection_rules|Regras de detecção
settings.scoring|Pontuação
settings.strictness|Rigoridade da pontuação
settings.dash_style|Estilo travessão
settings.appearance|Aparência
settings.theme|Tema
settings.haptics|Feedback tátil
settings.sounds|Efeitos sonoros
settings.data|Dados
settings.clear_all|Limpar todos os arquivos de caso
settings.export_all|Exportar todos os relatórios
settings.about|Sobre
settings.version|Versão
settings.typpo|Typpo
settings.rate_app|Avalie em App Store
settings.send_feedback|Enviar comentários
settings.privacy|Política de Privacidade
settings.footer|Feito com cuidado e aspas curvas adequadas.
settings.title|Configurações
settings.clear_confirm_title|Limpar todos os arquivos do caso?
settings.clear_confirm_message|Esta ação não pode ser desfeita.
settings.delete_all|Excluir tudo
settings.about_body|Análise forense do seu texto. Cole qualquer texto, obtenha sua pontuação e compartilhe o veredicto.
settings.about_placeholder|Esta versão está totalmente off-line e ainda usa links de lançamento de espaço reservado para o site, a política de privacidade e o destino App Store.
settings.about_website|Site: %@
share.title|Compartilhar relatório
share.copy_report_image|Copiar imagem do relatório
share.save_to_photos|Salvar em fotos
share.copy_report_text|Copiar texto do relatório
share.photos_needed|É necessário acesso às fotos
share.open_settings|Abrir configurações
share.photos_message|O acesso às fotos é necessário para salvar a imagem do relatório. Abra Configurações para conceder acesso.
share.primary.share_text|Compartilhar texto
share.primary.copy_link|Copiar link
share.primary.share|Compartilhar
share.copied_clipboard|Copiado para a área de transferência ✓
share.deep_link_copied|Link direto copiado ✓
share.render_failed|Não foi possível renderizar a imagem do relatório.
share.saved_photos|Salvo em Fotos ✓
share.save_failed|Não foi possível salvar a imagem do relatório.
share.swipe_up|ABRA O APLICATIVO PARA ANALISAR SEU PRÓPRIO TEXTO
share.report_heading|Relatório de tipografia
share.score_prefix|Pontuação
share.top_issues|Principais problemas
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Seu texto contém apenas espaços em branco. Não é criminoso, mas é suspeito.
engine.non_latin_warning|A análise é ajustada para tipografia de escrita latina. Algumas regras de espaçamento e pontuação podem não se aplicar a este sistema de escrita.
engine.short_text_note|A detecção de viúvas e órfãos é menos confiável em passagens muito curtas.
engine.fix.single_space|Use um único espaço após a pontuação no final da frase.
engine.fix.replace_with|Substitua por %@
engine.fix.normalize_spacing|Normalize o espaçamento entre frases em todo o texto.
engine.fix.rewrite_widow|Reescreva ou refaça o parágrafo para evitar uma linha final de uma palavra.
engine.fix.rewrite_orphan|Ajuste a cópia próxima para evitar uma pequena linha de transferência.
engine.fix.change_font|Use uma fonte mais adequada.
engine.explain.double_space|Esta frase termina com vários espaços, uma convenção da era da máquina de escrever que não pertence à tipografia proporcional.
engine.explain.straight_quotes|Estas aspas usam a forma ASCII direta em vez de aspas curvas direcionais.
engine.explain.hyphen_dash|Essa interrupção usa caracteres de hífen-menos em vez de um travessão adequado.
engine.explain.fake_ellipsis|Essa série de pontos deve ser substituída pelo caractere de reticências.
engine.explain.inconsistent_spacing|Este espaçamento entre frases difere do padrão dominante no texto.
engine.explain.widow|O parágrafo termina com uma palavra isolada na linha final, criando uma viúva visível.
engine.explain.orphan|Este parágrafo começa com uma linha muito curta após um longo parágrafo anterior, que provavelmente parece órfão.
engine.explain.comic_sans|Os metadados de Comic Sans foram encontrados no rich text enviado.
engine.explain.prime_marks|Esta marca de medida usa uma aspa ASCII em vez de um símbolo primo adequado.
engine.explain.multiplication_sign|Esta dimensão usa a letra x onde o sinal de multiplicação deve aparecer.
engine.explain.trademark_symbol|Esta notação alternativa deve ser substituída pelo símbolo adequado.
category.punctuation|Problemas de pontuação
category.spacing|Problemas de espaçamento
category.layout|Problemas de layout
category.font|Problemas de fonte
category.symbol|Problemas de símbolos
severity.infraction|INFRAÇÃO
severity.misdemeanor|contravenção
severity.felony|CRIME
verdict.clean|LIMPAR
verdict.infraction|INFRAÇÃO
verdict.misdemeanor|contravenção
verdict.felony|CRIME
verdict.capital|OFENSA CAPITAL
strictness.lenient|leniente
strictness.standard|Padrão
strictness.strict|Estrito
theme.system|Sistema
theme.light|Luz
theme.dark|Escuro
dash.spaced|Espaçado
dash.closed|Fechado
share_format.image|Imagem
share_format.story|História
share_format.landscape|Paisagem
share_format.text|Texto Simples
share_format.link|Copiar link
share_format_desc.image|Imagem PNG otimizada para feeds sociais.
share_format_desc.story|Relatório pronto para história em 1080x1920.
share_format_desc.landscape|Cartão amplo para visualizações de artigos e redes sociais.
share_format_desc.text|Resumo textual formatado.
share_format_desc.link|Cópia do link direto do espaço reservado.
evidence_source.typed|Digitado
evidence_source.pasted|Colado
evidence_source.pasted_rich|Rich Text colado
toast.load_failed|Não foi possível carregar os arquivos de caso salvos.
toast.save_failed|Não foi possível salvar o arquivo do caso.
toast.delete_failed|Falha na exclusão.
toast.cleared|Todos os arquivos do caso foram apagados.
toast.clear_failed|Não foi possível limpar os arquivos do caso.
toast.export_failed|Falha na exportação.
"""),
        verdictShortLabels: verdictMap("""
clean|LIMPAR
infraction|INFRAÇÃO
misdemeanor|contravenção
felony|CRIME
capitalOffense|OFENSA CAPITAL
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problemas de pontuação
spacing|Problemas de espaçamento
layout|Problemas de layout
font|Problemas de fonte
symbol|Problemas de símbolos
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Espaços duplos
straightQuotes|Citações diretas
hyphenAsDash|Hífen como traço
fakeEllipsis|Reticências falsas
widow|Viúvas
orphan|Órfãos
inconsistentSpacing|Espaçamento inconsistente
comicSans|Comic Sans
primeMarks|Notas principais
multiplicationSign|Sinal de multiplicação errado
trademarkSymbol|Uso indevido de símbolo de marca registrada
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Espaços extras após a pontuação no final da frase.
straightQuotes|Aspas ASCII usadas onde as aspas curvas pertencem.
hyphenAsDash|Hífens substituindo um verdadeiro travessão.
fakeEllipsis|Três pontos usados em vez do caractere de reticências.
widow|Uma linha final deixada com apenas uma palavra curta.
orphan|Uma pequena linha de transição no início de um parágrafo.
inconsistentSpacing|Estilos mistos de espaçamento entre frases em um texto.
comicSans|Comic Sans detectado nas evidências enviadas.
primeMarks|Aspas ASCII usadas onde os símbolos primos pertencem.
multiplicationSign|A letra x usada em vez de ×.
trademarkSymbol|Notação substituta usada em vez de ©, ® ou ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Espaços duplos após uma frase vêm dos hábitos de máquina de escrever. No tipo proporcional moderno, um espaço é o padrão mais limpo.", "Espaços extras criam ritmo irregular e lacunas visíveis em um parágrafo.", "As máquinas de escrever usavam caracteres de largura fixa, então o espaçamento extra ajudava os leitores a ver as quebras de frase.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Pesquise espaços repetidos após a pontuação.", "Faça uma limpeza rápida antes de compartilhar.", "Se os espaços duplos forem intencionais, mantenha-os consistentes."]),
            (.straightQuotes, "Aspas retas são marcas ASCII simples. O texto finalizado geralmente fica melhor com aspas curvas direcionais.", "As citações curvas parecem mais refinadas e melhoram o ritmo visual de uma frase.", "Os primeiros teclados e conjuntos de caracteres mantinham apenas uma aspa simples para ambas as direções.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Ative a pontuação inteligente quando disponível.", "Limpe o texto colado de fontes de texto simples.", "Verifique as medidas para que as marcas principais permaneçam corretas."]),
            (.hyphenAsDash, "Os hífens unem as palavras, mas não substituem os travessões ou travessões.", "O traço correto melhora o tom, o espaçamento e a legibilidade.", "Hífens duplos eram uma solução alternativa em sistemas que não conseguiam produzir facilmente pontuação rica.", "He paused -- dramatically.", "He paused — dramatically.", ["Use o traço real que seu estilo exige.", "Mantenha hífens para compostos, não quebras de frase.", "Mantenha a consistência em todo o documento."]),
            (.fakeEllipsis, "Três pontos podem imitar reticências, mas não são o mesmo caractere.", "Uma reticência real tem espaçamento equilibrado e se comporta melhor em uma linha de texto.", "Muitos fluxos de trabalho de escrita casual ainda usam como padrão a digitação de três pontos.", "Wait...", "Wait…", ["Substitua três pontos pelo caractere de reticências.", "Use a substituição de texto se você digitar com frequência.", "Verifique a cópia importada antes de publicar."]),
            (.widow, "Uma viúva deixa uma palavra curta presa na última linha de um parágrafo.", "Esse final fraco perturba a forma e o ritmo do parágrafo.", "Editores e designers ajustaram as quebras de linha para evitar viúvas na impressão.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Aperte ou reescreva ligeiramente a frase.", "Ajuste o comprimento da linha se as ferramentas de layout estiverem disponíveis.", "Trate isso como uma recomendação de estilo suave."]),
            (.orphan, "Um órfão é uma pequena linha que inicia um novo parágrafo ou bloco de texto de maneira estranha.", "Isso quebra o fluxo de leitura e faz com que o layout pareça menos considerado.", "Tradicionalmente, os fluxos de trabalho editoriais corrigem os órfãos antes da publicação.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Reescreva uma frase próxima para reequilibrar a pausa.", "Abra um pouco a medida se você controlar o layout.", "Use-o como um aviso, não como um erro rígido."]),
            (.inconsistentSpacing, "Misturar espaçamento entre frases simples e duplas faz com que o texto pareça costurado a partir de fontes diferentes.", "Os leitores percebem a inconsistência rapidamente, mesmo quando não conseguem explicar o porquê.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Escolha um estilo de espaçamento entre frases.", "Normalize o texto colado antes de compartilhá-lo.", "Mantenha a escolha consistente do início ao fim."]),
            (.comicSans, "Comic Sans não é proibido, mas carrega um forte tom cultural que muitas vezes entra em conflito com textos sérios.", "As fontes comunicam o humor antes mesmo de o leitor processar as palavras.", "Comic Sans foi projetado em 1994 para uma interface de software infantil e mais tarde se espalhou muito além desse contexto.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Escolha um tipo de letra adequado à mensagem.", "Reserve faces de exibição divertidas para trabalhos claramente divertidos.", "Desative este detector se a escolha for intencional."]),
            (.primeMarks, "Medidas como pés, polegadas, minutos e segundos geralmente precisam de símbolos primos em vez de aspas.", "A marca correta evita ambiguidade e faz com que o texto técnico pareça mais deliberado.", nil, "5'11\"", "5′11″", ["Use símbolos primos e primos duplos após os numerais.", "Fique atento à conversão automática de cotações inteligentes.", "Verifique cuidadosamente as especificações, os menus e as dimensões dos produtos."]),
            (.multiplicationSign, "A letra x e o sinal de multiplicação não são intercambiáveis em dimensões.", "Usar × dá às cópias técnicas e do produto um acabamento tipográfico mais limpo.", nil, "1920x1080", "1920×1080", ["Substitua x entre números por ×.", "Use substituição de texto para formatos de tamanho comuns.", "Analise as especificações e os recursos de marketing para manter a consistência."]),
            (.trademarkSymbol, "Formulários como (c), (r) e (tm) são notações substitutas, e não cópias finais refinadas.", "Os símbolos adequados economizam espaço e fazem com que o texto legal ou de marca pareça finalizado.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Substitua a notação substituta por ©, ® e ™.", "Verifique a cópia legal e de marketing antes do lançamento.", "Mantenha o espaçamento em torno desses símbolos consistente."])
        ])
    )

    static let italianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratorio criminale
app.tab.case_files|Documenti
app.tab.learn|Impara
app.tab.settings|Impostazioni
counts.crimes_categories|Crimini: %@ · Categorie: %@
counts.detected_issues|Problemi rilevati: %@
counts.entries|Voci: %@
counts.characters|Caratteri: %@
counts.line_column|Linea %@ · Col %@
counts.crimes_verdict|Crimini: %@ · %@
share.offense_line|• %@: %@
general.done|Fatto
general.cancel|Annulla
general.retry|Riprova
general.next|Avanti
general.skip|Salta
general.got_it|Capito
general.coming_soon|Prossimamente
general.wrong|Sbagliato
general.right|Giusto
history.empty_title|Ancora nessun caso
history.empty_subtitle|Esegui una scansione e i file del tuo caso verranno visualizzati qui.
history.share|Condividi
history.delete|Elimina
history.title|File dei casi
history.today|OGGI
history.yesterday|IERI
history.this_week|QUESTA SETTIMANA
history.this_month|QUESTO MESE
history.select_all|Seleziona tutto
history.delete_selected|Elimina selezionati
learn.title|La Biblioteca giuridica
learn.search_prompt|Cerca tipi di crimine
learn.empty_title|Nessun crimine corrispondente trovato
learn.empty_subtitle|Prova un termine di ricerca diverso.
learn.what_is_this|Qual è questo problema?
learn.why_it_matters|Perché è importante
learn.history_origin|Storia e contesto
learn.how_to_fix|Come risolverlo
learn.default_why|Una buona tipografia è un sistema di dettagli attenti.
learn.default_fix|Utilizza il carattere corretto e mantieni il documento coerente.
input.method|Metodo di immissione
input.method.paste|Incolla/Digita
input.method.camera|Fotocamera (OCR)
input.placeholder|Incolla o digita il testo qui…
input.paste_from_clipboard|Incolla dagli appunti
input.title|Invia prove
input.analyze|Analizza
input.analyze_evidence|Analizza le prove
input.camera_message|Il riconoscimento del testo basato sulla fotocamera sarà disponibile in un aggiornamento futuro. Per ora, incolla o digita il testo da analizzare.
input.trimmed_warning|Il testo è stato ridotto a 100.000 caratteri.
input.clipboard_empty|Gli appunti sono vuoti. Copia prima del testo.
input.no_text|Nessun testo da analizzare. Incolla o digita prima del testo.
home.new_investigation|Nuova indagine
home.new_investigation_subtitle|Incolla o digita il testo per iniziare l'analisi tipografica forense
home.new_investigation_badge|INCOLLA · DIGITA · ANALIZZA
home.recent_cases|Casi recenti
home.see_all|Vedi tutto →
home.empty_title|Ancora nessun caso
home.empty_subtitle|Inizia la tua prima indagine.
home.begin_investigation|Inizia l'indagine
home.stat.scans|Scansioni
home.stat.crimes|Crimini
home.stat.avg|Media
onboarding.splash_tagline|Ogni glifo è una prova.
onboarding.page1.title|Incolla. Analizzare. Revisione.
onboarding.page1.body|Inserisci qualsiasi testo e l'app segnalerà i problemi tipografici nascosti in bella vista.
onboarding.page2.title|Cogliamo ciò che manca al controllo ortografico
onboarding.page2.body|Virgolette semplici, puntini di sospensione falsi, trattini che fingono di essere trattini e spaziatura incoerente vengono tutti visualizzati qui.
onboarding.page3.title|Ottieni il tuo punteggio di criminalità
onboarding.page3.body|Guarda quanto è pulita la tua tipografia, quindi condividi il verdetto.
onboarding.page4.title|Impara mentre procedi
onboarding.page4.body|Apri qualsiasi problema per vedere perché è importante e come risolverlo.
onboarding.start|Inizia a indagare
onboarding.sample.not_em_dash|Neanche un trattino
onboarding.library.investigate|Investiga
onboarding.library.study|Studia le regole
analysis.failed_title|Analisi non riuscita
analysis.failed_body|Qualcosa è andato storto durante la scansione. Riprova.
analysis.status.scan|Scansione per prove tipografiche...
analysis.status.quotes|Controllo delle virgolette…
analysis.status.dashes|Verifica utilizzo del trattino…
analysis.status.ellipsis|Controllo dei puntini di sospensione…
analysis.status.spacing|Controllo della coerenza della spaziatura…
analysis.status.layout|Controllo delle vedove e degli orfani…
analysis.status.comic_sans|Controllo dei metadati dei caratteri…
analysis.status.compiling|Compilazione del rapporto…
mugshot.title|Contrassegnato per cattiva condotta tipografica
mugshot.body|Comic Sans è stato trovato nelle prove presentate. In contesti ludici può funzionare, ma nella maggior parte dei contesti editoriali e di prodotto sembra una mancata corrispondenza.
mugshot.continue|Apri rapporto completo →
report.breakdown|Ripartizione del crimine
report.share|Condividi rapporto
report.new_scan|Nuova scansione
report.close|Chiudi rapporto
report.copy_fixed|Copia testo fisso
report.copy_fixed_hint|Copia il testo correntemente corretto.
report.clean_title|Immacolato
report.clean_body|Non sono stati rilevati problemi tipografici. Questo testo è un cittadino modello.
report.replace_single_space|Sostituisci con un singolo spazio
report.fixed_text_copied|Testo fisso copiato ✓
report.manual_rewrite|Questo problema necessita di una riscrittura manuale.
report.apply_failed|Impossibile applicare questa correzione.
report.issue_fixed|Problema risolto e rapporto aggiornato ✓
report.learn_more|Ulteriori informazioni su questo problema →
settings.detection_rules|Regole di rilevamento
settings.scoring|Punteggio
settings.strictness|Rigore del punteggio
settings.dash_style|Stile trattino
settings.appearance|Aspetto
settings.theme|Tema
settings.haptics|Feedback tattile
settings.sounds|Effetti sonori
settings.data|Dati
settings.clear_all|Cancella tutti i file del caso
settings.export_all|Esporta tutti i report
settings.about|Informazioni
settings.version|Versione
settings.typpo|Typpo
settings.rate_app|Vota su App Store
settings.send_feedback|Invia feedback
settings.privacy|Informativa sulla privacy
settings.footer|Realizzato con cura e virgolette ricci adeguate.
settings.title|Impostazioni
settings.clear_confirm_title|Cancellare tutti i file del caso?
settings.clear_confirm_message|Questa azione non può essere annullata.
settings.delete_all|Elimina tutto
settings.about_body|Analisi forense per il tuo testo. Incolla qualsiasi testo, ottieni il tuo punteggio e condividi il verdetto.
settings.about_placeholder|Questa build è completamente offline e utilizza ancora collegamenti di rilascio segnaposto per il sito Web, l'informativa sulla privacy e la destinazione App Store.
settings.about_website|Sito web: %@
share.title|Condividi rapporto
share.copy_report_image|Copia immagine rapporto
share.save_to_photos|Salva in Foto
share.copy_report_text|Copia testo rapporto
share.photos_needed|Accesso alle foto necessario
share.open_settings|Apri Impostazioni
share.photos_message|Per salvare l'immagine del report è necessario l'accesso alle foto. Apri Impostazioni per concedere l'accesso.
share.primary.share_text|Condividi testo
share.primary.copy_link|Copia collegamento
share.primary.share|Condividi
share.copied_clipboard|Copiato negli appunti ✓
share.deep_link_copied|Link diretto copiato ✓
share.render_failed|Impossibile eseguire il rendering dell'immagine del report.
share.saved_photos|Salvato in Foto ✓
share.save_failed|Impossibile salvare l'immagine del report.
share.swipe_up|APRI L'APP PER ANALIZZARE IL TUO TESTO
share.report_heading|Rapporto sulla tipografia
share.score_prefix|Punteggio
share.top_issues|Problemi principali
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Il tuo testo contiene solo spazi bianchi. Non è un crimine, ma è sospetto.
engine.non_latin_warning|L'analisi è ottimizzata per la tipografia in caratteri latini. Alcune regole di spaziatura e punteggiatura potrebbero non essere applicabili a questo sistema di scrittura.
engine.short_text_note|Il rilevamento di vedove e orfani è meno affidabile su passaggi molto brevi.
engine.fix.single_space|Utilizza uno spazio singolo dopo la punteggiatura di fine frase.
engine.fix.replace_with|Sostituisci con %@
engine.fix.normalize_spacing|Normalizza la spaziatura delle frasi in tutto il testo.
engine.fix.rewrite_widow|Riscrivi o ridisponi il paragrafo per evitare una riga finale di una sola parola.
engine.fix.rewrite_orphan|Regola la copia vicina per evitare una piccola riga di riporto.
engine.fix.change_font|Utilizza un carattere più adatto.
engine.explain.double_space|Questa frase termina con più spazi, una convenzione dell'era delle macchine da scrivere che non appartiene alla tipografia proporzionale.
engine.explain.straight_quotes|Questa virgoletta utilizza la forma semplice ASCII invece delle virgolette inglesi direzionali.
engine.explain.hyphen_dash|Questa interruzione utilizza i caratteri trattino-meno invece del trattino vero e proprio.
engine.explain.fake_ellipsis|Questa serie di punti dovrebbe essere sostituita con i puntini di sospensione.
engine.explain.inconsistent_spacing|Questa spaziatura delle frasi differisce dallo schema dominante nel testo.
engine.explain.widow|Il paragrafo termina con una parola isolata nella riga finale, creando una vedova visibile.
engine.explain.orphan|Questo paragrafo inizia con una riga molto breve dopo un lungo paragrafo precedente, che probabilmente viene letto come orfano.
engine.explain.comic_sans|I metadati Comic Sans sono stati trovati nel rich text inviato.
engine.explain.prime_marks|Questo segno di misurazione utilizza una virgoletta ASCII invece del simbolo primo corretto.
engine.explain.multiplication_sign|Questa dimensione utilizza la lettera x dove dovrebbe apparire il segno di moltiplicazione.
engine.explain.trademark_symbol|Questa notazione di fallback dovrebbe essere sostituita con il simbolo appropriato.
category.punctuation|Problemi di punteggiatura
category.spacing|Problemi di spaziatura
category.layout|Problemi di layout
category.font|Problemi relativi ai caratteri
category.symbol|Problemi relativi ai simboli
severity.infraction|INFRAZIONE
severity.misdemeanor|ILLECITO
severity.felony|FELONE
verdict.clean|PULIRE
verdict.infraction|INFRAZIONE
verdict.misdemeanor|ILLECITO
verdict.felony|FELONE
verdict.capital|REATO PITALE
strictness.lenient|Miniente
strictness.standard|Standard
strictness.strict|Rigoroso
theme.system|Sistema
theme.light|Luce
theme.dark|Scuro
dash.spaced|Spaziato
dash.closed|Chiuso
share_format.image|Immagine
share_format.story|Storia
share_format.landscape|Paesaggio
share_format.text|Testo semplice
share_format.link|Copia collegamento
share_format_desc.image|PNG immagine ottimizzata per i feed social.
share_format_desc.story|Rapporto pronto per la storia 1080×1920.
share_format_desc.landscape|Scheda ampia per anteprime di articoli e social.
share_format_desc.text|Riepilogo testuale formattato.
share_format_desc.link|Copia del link diretto del segnaposto.
evidence_source.typed|Digitato
evidence_source.pasted|Incollato
evidence_source.pasted_rich|Rich Text incollato
toast.load_failed|Impossibile caricare i file del caso salvati.
toast.save_failed|Impossibile salvare il file del caso.
toast.delete_failed|Eliminazione non riuscita.
toast.cleared|Tutti i fascicoli del caso sono stati cancellati.
toast.clear_failed|Impossibile cancellare i file del caso.
toast.export_failed|Esportazione non riuscita.
"""),
        verdictShortLabels: verdictMap("""
clean|PULIRE
infraction|INFRAZIONE
misdemeanor|ILLECITO
felony|FELONE
capitalOffense|REATO PITALE
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problemi di punteggiatura
spacing|Problemi di spaziatura
layout|Problemi di layout
font|Problemi relativi ai caratteri
symbol|Problemi relativi ai simboli
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Spazi doppi
straightQuotes|Virgolette dirette
hyphenAsDash|Trattino come trattino
fakeEllipsis|Ellissi finta
widow|Vedove
orphan|Orfani
inconsistentSpacing|Spaziatura incoerente
comicSans|Comic Sans
primeMarks|Marchi principali
multiplicationSign|Segno di moltiplicazione sbagliato
trademarkSymbol|Uso improprio dei simboli dei marchi
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Spazi extra dopo la punteggiatura di fine frase.
straightQuotes|virgolette ASCII utilizzate al posto delle virgolette graffe.
hyphenAsDash|Trattini che sostituiscono un vero e proprio trattino.
fakeEllipsis|Tre punti utilizzati al posto dei puntini di sospensione.
widow|Un'ultima riga rimasta con una sola parola breve.
orphan|Una piccola riga di riporto all'inizio di un paragrafo.
inconsistentSpacing|Stili misti di spaziatura delle frasi in un unico testo.
comicSans|Comic Sans rilevato nelle prove inviate.
primeMarks|virgolette ASCII utilizzate dove appartengono i simboli primi.
multiplicationSign|La lettera x usata al posto di ×.
trademarkSymbol|Notazione di fallback utilizzata al posto di ©, ® o ™.
"""),
        articles: articleMap([
            (.doubleSpace, "I doppi spazi dopo una frase derivano dalle abitudini della macchina da scrivere. Nel tipo proporzionale moderno, uno spazio è il valore predefinito più pulito.", "Gli spazi aggiuntivi creano ritmo irregolare e spazi visibili in un paragrafo.", "Le macchine da scrivere utilizzavano caratteri a larghezza fissa, quindi una volta la spaziatura extra aiutava i lettori a vedere le interruzioni di frase.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Cerca spazi ripetuti dopo la punteggiatura.", "Esegui un rapido passaggio di pulizia prima della condivisione.", "Se i doppi spazi sono intenzionali, mantienili coerenti."]),
            (.straightQuotes, "Le virgolette semplici sono semplici simboli ASCII. Il testo finito di solito si legge meglio con virgolette inglesi direzionali.", "Le virgolette inglesi appaiono più raffinate e migliorano il ritmo visivo di una frase.", "Le prime tastiere e i primi set di caratteri mantenevano solo una semplice virgoletta per entrambe le direzioni.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Attiva la punteggiatura intelligente, ove disponibile.", "Ripulisci il testo incollato da fonti di testo semplice.", "Controlla le misurazioni in modo che i primi segni rimangano corretti."]),
            (.hyphenAsDash, "I trattini uniscono le parole, ma non sostituiscono i trattini em o en.", "Il trattino corretto migliora il tono, la spaziatura e la leggibilità.", "I trattini doppi erano una soluzione alternativa nei sistemi che non potevano facilmente produrre una punteggiatura ricca.", "He paused -- dramatically.", "He paused — dramatically.", ["Utilizza il vero carattere trattino richiesto dal tuo stile.", "Mantieni i trattini per i composti, non le interruzioni di frase.", "Rimani coerente in tutto il documento."]),
            (.fakeEllipsis, "Tre punti possono imitare i puntini di sospensione, ma non sono lo stesso carattere.", "I puntini di sospensione reali hanno una spaziatura bilanciata e si comportano meglio in una riga di testo.", "Molti flussi di lavoro di scrittura casuale prevedono ancora per impostazione predefinita la digitazione di tre punti.", "Wait...", "Wait…", ["Sostituisci tre punti con i puntini di sospensione.", "Utilizza la sostituzione del testo se lo digiti spesso.", "Controlla la copia importata prima della pubblicazione."]),
            (.widow, "Una vedova lascia una parola breve sull'ultima riga di un paragrafo.", "Quel finale debole sconvolge la forma e il ritmo del paragrafo.", "Editori e designer hanno modificato a lungo le interruzioni di riga per evitare vedove nella stampa.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Restringi o riscrivi leggermente la frase.", "Regola la lunghezza della linea se sono disponibili strumenti di layout.", "Considera questo come un consiglio di stile morbido."]),
            (.orphan, "Un orfano è una piccola riga di riporto che inizia in modo strano un nuovo paragrafo o blocco di testo.", "Interrompe il flusso di lettura e fa sembrare il layout meno considerato.", "I flussi di lavoro editoriali tradizionalmente correggono gli orfani prima della pubblicazione.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Riscrivi una frase vicina per riequilibrare la pausa.", "Apri leggermente la misura se controlli il layout.", "Usalo come avvertimento, non come errore rigido."]),
            (.inconsistentSpacing, "Mischiare la spaziatura della frase singola e doppia fa sì che il testo sembri cucito insieme da fonti diverse.", "I lettori notano rapidamente l'incoerenza, anche quando non riescono a spiegarne il motivo.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Scegli uno stile di spaziatura delle frasi.", "Normalizza il testo incollato prima di condividerlo.", "Mantieni la scelta coerente dall'inizio alla fine."]),
            (.comicSans, "Comic Sans non è proibito, ma ha un forte tono culturale che spesso si scontra con i testi seri.", "I caratteri comunicano l'umore prima ancora che il lettore elabori le parole.", "Comic Sans è stato progettato nel 1994 per un'interfaccia software per bambini e successivamente si è diffuso ben oltre quel contesto.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Scegli un carattere tipografico adatto al messaggio.", "Riserva facce di visualizzazione giocose per un lavoro chiaramente giocoso.", "Disabilita questo rilevatore se la scelta è intenzionale."]),
            (.primeMarks, "Misure come piedi, pollici, minuti e secondi spesso richiedono simboli primi anziché virgolette.", "Il voto corretto previene l'ambiguità e fa sembrare il testo tecnico più intenzionale.", nil, "5'11\"", "5′11″", ["Utilizza i simboli primo e doppio primo dopo i numeri.", "Guarda la conversione automatica del preventivo intelligente.", "Controlla attentamente le specifiche, i menu e le dimensioni del prodotto."]),
            (.multiplicationSign, "La lettera x e il segno di moltiplicazione non sono intercambiabili nelle dimensioni.", "L'utilizzo di × conferisce ai testi tecnici e di prodotto una finitura tipografica più pulita.", nil, "1920x1080", "1920×1080", ["Sostituisci x tra i numeri con ×.", "Utilizza la sostituzione del testo per i formati di dimensioni comuni.", "Rivedi le specifiche e le risorse di marketing per verificarne la coerenza."]),
            (.trademarkSymbol, "Forme come (c), (r) e (tm) sono notazioni di riserva, non copie finali perfezionate.", "I simboli corretti risparmiano spazio e fanno sembrare finito il testo legale o del marchio.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Sostituisci la notazione di fallback con ©, ® e ™.", "Controlla il testo legale e di marketing prima del rilascio.", "Mantieni coerente la spaziatura attorno a questi simboli."])
        ])
    )

    static let dutchPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Misdaadlab
app.tab.case_files|Casebestanden
app.tab.learn|Leer
app.tab.settings|Instellingen
counts.crimes_categories|Misdaden: %@ · Categorieën: %@
counts.detected_issues|Gedetecteerde problemen: %@
counts.entries|Inzendingen: %@
counts.characters|Tekens: %@
counts.line_column|Regel %@ · Kolom %@
counts.crimes_verdict|Misdaden: %@ · %@
share.offense_line|• %@: %@
general.done|Gereed
general.cancel|Annuleren
general.retry|Opnieuw proberen
general.next|Volgende
general.skip|Overslaan
general.got_it|Begrepen
general.coming_soon|Binnenkort beschikbaar
general.wrong|Fout
general.right|Juist
history.empty_title|Nog geen gevallen
history.empty_subtitle|Voer een scan uit en uw dossiers verschijnen hier.
history.share|Deel
history.delete|Verwijderen
history.title|Casedossiers
history.today|VANDAAG
history.yesterday|GISTEREN
history.this_week|DEZE WEEK
history.this_month|DEZE MAAND
history.select_all|Selecteer alles
history.delete_selected|Geselecteerde verwijderen
learn.title|De Juridische Bibliotheek
learn.search_prompt|Zoek misdaadtypes
learn.empty_title|Geen overeenkomende misdaden gevonden
learn.empty_subtitle|Probeer een andere zoekterm.
learn.what_is_this|Wat is dit probleem?
learn.why_it_matters|Waarom het ertoe doet
learn.history_origin|Geschiedenis en context
learn.how_to_fix|Hoe u dit kunt oplossen
learn.default_why|Goede typografie is een systeem van doordachte details.
learn.default_fix|Gebruik het juiste teken en zorg ervoor dat het document consistent is.
input.method|Invoermethode
input.method.paste|Plakken / typen
input.method.camera|Camera (OCR)
input.placeholder|Plaats of typ hier uw tekst…
input.paste_from_clipboard|Plakken vanaf klembord
input.title|Bewijsmateriaal indienen
input.analyze|Analyseren
input.analyze_evidence|Bewijs analyseren
input.camera_message|Cameragebaseerde tekstherkenning komt in een toekomstige update. Plak of typ voorlopig uw tekst om te analyseren.
input.trimmed_warning|Tekst is ingekort tot 100.000 tekens.
input.clipboard_empty|Klembord is leeg. Kopieer eerst wat tekst.
input.no_text|Geen tekst om te analyseren. Plak of typ eerst wat tekst.
home.new_investigation|Nieuw onderzoek
home.new_investigation_subtitle|Plaats of typ tekst om de forensische typografische analyse te starten
home.new_investigation_badge|PASTE · TYPE · ANALYSEER
home.recent_cases|Recente gevallen
home.see_all|Zie alles →
home.empty_title|Nog geen cases
home.empty_subtitle|Start uw eerste onderzoek.
home.begin_investigation|Start onderzoek
home.stat.scans|Scannen
home.stat.crimes|Misdaden
home.stat.avg|Gem.
onboarding.splash_tagline|Elke glyph is bewijs.
onboarding.page1.title|Plakken. Analyseren. Beoordeling.
onboarding.page1.body|Voeg een willekeurige tekst toe en de app zal typografische problemen markeren die in het zicht verborgen zijn.
onboarding.page2.title|We vangen op wat de spellingcontrole mist
onboarding.page2.body|Rechte aanhalingstekens, valse ellipsen, koppeltekens die zich voordoen als em-streepjes en inconsistente spaties komen hier allemaal voor.
onboarding.page3.title|Ontvang uw misdaadscore
onboarding.page3.body|Bekijk hoe helder uw typografie is en deel vervolgens het oordeel.
onboarding.page4.title|Leer gaandeweg
onboarding.page4.body|Open een probleem om te zien waarom het van belang is en hoe u het kunt oplossen.
onboarding.start|Start onderzoek
onboarding.sample.not_em_dash|Geen em-streepje
onboarding.library.investigate|Onderzoek
onboarding.library.study|Bestudeer de regels
analysis.failed_title|Analyse mislukt
analysis.failed_body|Er is iets misgegaan tijdens de scan. Probeer het opnieuw.
analysis.status.scan|Scannen naar typografisch bewijs…
analysis.status.quotes|Aanhalingstekens controleren…
analysis.status.dashes|Dashgebruik controleren...
analysis.status.ellipsis|Ellipsen controleren…
analysis.status.spacing|Consistentie tussen spaties controleren...
analysis.status.layout|Weduwen en wezen controleren…
analysis.status.comic_sans|Metagegevens van lettertypen controleren…
analysis.status.compiling|Rapport samenstellen…
mugshot.title|Gemarkeerd wegens typografisch wangedrag
mugshot.body|Comic Sans is gevonden in het ingediende bewijsmateriaal. In speelse contexten kan het werken, maar in de meeste product- en redactionele contexten leest het als een mismatch.
mugshot.continue|Volledig rapport openen →
report.breakdown|Misdaadverdeling
report.share|Rapport delen
report.new_scan|Nieuwe scan
report.close|Rapport sluiten
report.copy_fixed|Vaste tekst kopiëren
report.copy_fixed_hint|Kopieert de huidige gecorrigeerde tekst.
report.clean_title|Vlekkeloos
report.clean_body|Er zijn geen typografische problemen gedetecteerd. Deze tekst is een modelburger.
report.replace_single_space|Vervangen door een enkele spatie
report.fixed_text_copied|Vaste tekst gekopieerd ✓
report.manual_rewrite|Dit nummer moet handmatig worden herschreven.
report.apply_failed|Kan deze oplossing niet toepassen.
report.issue_fixed|Probleem opgelost en rapport bijgewerkt ✓
report.learn_more|Meer informatie over dit probleem →
settings.detection_rules|Detectieregels
settings.scoring|Scoren
settings.strictness|Striktheid scoren
settings.dash_style|Em-dash-stijl
settings.appearance|Uiterlijk
settings.theme|Thema
settings.haptics|Haptische feedback
settings.sounds|Geluidseffecten
settings.data|Gegevens
settings.clear_all|Alle dossierbestanden wissen
settings.export_all|Alle rapporten exporteren
settings.about|Over
settings.version|Versie
settings.typpo|Typpo
settings.rate_app|Beoordeel op App Store
settings.send_feedback|Feedback verzenden
settings.privacy|Privacybeleid
settings.footer|Met zorg gemaakt en met de juiste gekrulde aanhalingstekens.
settings.title|Instellingen
settings.clear_confirm_title|Alle dossiers wissen?
settings.clear_confirm_message|Deze actie kan niet ongedaan worden gemaakt.
settings.delete_all|Alles verwijderen
settings.about_body|Forensische analyse van uw tekst. Plak een willekeurige tekst, ontvang uw score en deel het oordeel.
settings.about_placeholder|Deze build is volledig offline en gebruikt nog steeds tijdelijke vrijgavelinks voor de website, het privacybeleid en de bestemming App Store.
settings.about_website|Website: %@
share.title|Rapport delen
share.copy_report_image|Kopieer rapportafbeelding
share.save_to_photos|Opslaan in Foto's
share.copy_report_text|Kopieer rapporttekst
share.photos_needed|Toegang tot foto's vereist
share.open_settings|Open Instellingen
share.photos_message|Toegang tot foto's is nodig om de rapportafbeelding op te slaan. Open Instellingen om toegang te verlenen.
share.primary.share_text|Tekst delen
share.primary.copy_link|Kopieer link
share.primary.share|Deel
share.copied_clipboard|Gekopieerd naar klembord ✓
share.deep_link_copied|Deeplink gekopieerd ✓
share.render_failed|Kan de rapportafbeelding niet weergeven.
share.saved_photos|Opgeslagen in Foto's ✓
share.save_failed|Kan de rapportafbeelding niet opslaan.
share.swipe_up|OPEN DE APP OM JE EIGEN TEKST TE ANALYSEREN
share.report_heading|Typografierapport
share.score_prefix|Score
share.top_issues|Belangrijkste problemen
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Je tekst bevat alleen witruimte. Het is niet crimineel, maar wel verdacht.
engine.non_latin_warning|De analyse is afgestemd op typografie in Latijns schrift. Sommige regels voor spatiëring en interpunctie zijn mogelijk niet van toepassing op dit schrijfsysteem.
engine.short_text_note|Detectie van weduwen en wezen is minder betrouwbaar bij zeer korte passages.
engine.fix.single_space|Gebruik één spatie na de interpunctie aan het einde van de zin.
engine.fix.replace_with|Vervangen door %@
engine.fix.normalize_spacing|Normaliseer de zinsafstand in de hele tekst.
engine.fix.rewrite_widow|Herschrijf of herschrijf de alinea om een laatste regel van één woord te vermijden.
engine.fix.rewrite_orphan|Pas de kopie in de buurt aan om een kleine overdrachtslijn te voorkomen.
engine.fix.change_font|Gebruik een geschikter lettertype.
engine.explain.double_space|Deze zin eindigt met meerdere spaties, een conventie uit het typemachinetijdperk die niet thuishoort in proportionele typografie.
engine.explain.straight_quotes|Dit aanhalingsteken gebruikt de rechte ASCII-vorm in plaats van gerichte gekrulde aanhalingstekens.
engine.explain.hyphen_dash|Deze onderbreking gebruikt koppelteken-min-tekens in plaats van een echt streepje.
engine.explain.fake_ellipsis|Deze reeks punten moet worden vervangen door het weglatingsteken.
engine.explain.inconsistent_spacing|Deze zinsafstand wijkt af van het dominante patroon in de tekst.
engine.explain.widow|De alinea eindigt met een geïsoleerd woord in de laatste regel, waardoor een zichtbare weduwe ontstaat.
engine.explain.orphan|Deze paragraaf begint met een zeer korte regel na een lange voorafgaande paragraaf, die waarschijnlijk leest als een wees.
engine.explain.comic_sans|Er zijn Comic Sans metadata gevonden in de ingediende rich text.
engine.explain.prime_marks|Dit meetteken gebruikt een ASCII-aanhalingsteken in plaats van een correct priemgetal.
engine.explain.multiplication_sign|Deze dimensie gebruikt de letter x waar het vermenigvuldigingsteken moet verschijnen.
engine.explain.trademark_symbol|Deze fallback-notatie moet worden vervangen door het juiste symbool.
category.punctuation|Interpunctieproblemen
category.spacing|Problemen met de afstand
category.layout|Problemen met de lay-out
category.font|Lettertypeproblemen
category.symbol|Problemen met symbolen
severity.infraction|INFRACTIE
severity.misdemeanor|MISDEMEANEUR
severity.felony|FELON
verdict.clean|SCHOON
verdict.infraction|INFRACTIE
verdict.misdemeanor|MISBED
verdict.felony|FELON
verdict.capital|DOODSCHADE
strictness.lenient|Toegeeflijk
strictness.standard|Standaard
strictness.strict|Streng
theme.system|Systeem
theme.light|Licht
theme.dark|Donker
dash.spaced|Gespreid
dash.closed|Gesloten
share_format.image|Afbeelding
share_format.story|Verhaal
share_format.landscape|Landschap
share_format.text|Platte tekst
share_format.link|Kopieer link
share_format_desc.image|PNG afbeelding geoptimaliseerd voor sociale feeds.
share_format_desc.story|Verhaalrapport van 1080×1920.
share_format_desc.landscape|Brede kaart voor artikel- en sociale previews.
share_format_desc.text|Opgemaakte tekstuele samenvatting.
share_format_desc.link|Tijdelijke kopie van deep link.
evidence_source.typed|Getypt
evidence_source.pasted|Geplakt
evidence_source.pasted_rich|Rich-text geplakt
toast.load_failed|Kan opgeslagen casusbestanden niet laden.
toast.save_failed|Kan het dossier niet opslaan.
toast.delete_failed|Verwijderen mislukt.
toast.cleared|Alle dossiers gewist.
toast.clear_failed|Kan de dossiers niet wissen.
toast.export_failed|Exporteren mislukt.
"""),
        verdictShortLabels: verdictMap("""
clean|SCHOON
infraction|INFRACTIE
misdemeanor|MISBED
felony|FELON
capitalOffense|DOODSCHADE
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Interpunctieproblemen
spacing|Problemen met de afstand
layout|Problemen met de lay-out
font|Lettertypeproblemen
symbol|Problemen met symbolen
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dubbele spaties
straightQuotes|Rechte citaten
hyphenAsDash|Koppelteken als streepje
fakeEllipsis|Valse ellips
widow|Weduwen
orphan|Wezen
inconsistentSpacing|Inconsistente spatiëring
comicSans|Comic Sans
primeMarks|Prime-markeringen
multiplicationSign|Verkeerd vermenigvuldigingsteken
trademarkSymbol|Misbruik van handelsmerksymbolen
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Extra spaties na interpunctie aan het einde van de zin.
straightQuotes|ASCII aanhalingstekens worden gebruikt waar gekrulde aanhalingstekens thuishoren.
hyphenAsDash|Koppelstreepjes staan voor een echt streepje.
fakeEllipsis|Drie punten gebruikt in plaats van het weglatingsteken.
widow|Er resteert nog een laatste regel met slechts één kort woord.
orphan|Een klein lijntje aan het begin van een alinea.
inconsistentSpacing|Gemengde stijlen voor de spatiëring van zinnen in één tekst.
comicSans|Comic Sans gedetecteerd in het ingediende bewijsmateriaal.
primeMarks|ASCII aanhalingstekens worden gebruikt waar hoofdsymbolen thuishoren.
multiplicationSign|De letter x die wordt gebruikt in plaats van ×.
trademarkSymbol|Fallback-notatie gebruikt in plaats van ©, ® of ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Dubbele spaties na een zin komen voort uit typemachinegewoonten. In het moderne proportionele type is één spatie de schonere standaard.", "Extra spaties zorgen voor een onregelmatig ritme en zichtbare gaten in een alinea.", "Typemachines gebruikten tekens met een vaste breedte, dus extra spaties hielpen lezers om zinseinden te zien.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Zoek naar herhaalde spaties na interpunctie.", "Voer een snelle opschoonpas uit voordat je deze deelt.", "Als dubbele spaties opzettelijk zijn, houd ze dan consistent."]),
            (.straightQuotes, "Rechte aanhalingstekens zijn gewone ASCII-tekens. Voltooide tekst leest meestal beter met gerichte, gekrulde aanhalingstekens.", "Krullende aanhalingstekens zien er verzorgder uit en verbeteren het visuele ritme van een zin.", "Vroege toetsenborden en tekensets hadden slechts één enkel aanhalingsteken voor beide richtingen.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Schakel slimme interpunctie in, indien beschikbaar.", "Tekst opschonen die is geplakt uit bronnen met platte tekst.", "Controleer de afmetingen zodat de hoofdmarkeringen correct blijven."]),
            (.hyphenAsDash, "Koppelingen verbinden woorden, maar zijn geen vervanging voor em-streepjes of en-streepjes.", "Het juiste streepje verbetert de toon, spatiëring en leesbaarheid.", "Dubbele koppeltekens waren een oplossing in systemen die niet gemakkelijk rijke interpunctie konden produceren.", "He paused -- dramatically.", "He paused — dramatically.", ["Gebruik het echte streepjeskarakter dat jouw stijl vereist.", "Bewaar koppeltekens voor samenstellingen, niet voor zinseinden.", "Blijf consistent in het hele document."]),
            (.fakeEllipsis, "Drie punten kunnen een ellips nabootsen, maar ze zijn niet hetzelfde teken.", "Een echte ellips heeft een evenwichtige spatiëring en gedraagt zich beter in een tekstregel.", "Veel informele schrijfworkflows typen nog steeds standaard drie punten.", "Wait...", "Wait…", ["Vervang drie punten door het weglatingsteken.", "Gebruik tekstvervanging als u deze vaak typt.", "Controleer de geïmporteerde kopie voordat u deze publiceert."]),
            (.widow, "Een weduwe laat een kort woord achter op de laatste regel van een alinea.", "Dat zwakke einde verstoort de vorm en het ritme van de alinea.", "Redacteurs en ontwerpers hebben lang aangepaste regeleinden gebruikt om weduwen in druk te voorkomen.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Verkort of herschrijf de zin iets.", "Pas de lijnlengte aan als er lay-outtools beschikbaar zijn.", "Beschouw dit als een zachte stijlaanbeveling."]),
            (.orphan, "Een wees is een kleine overdrachtsregel die op een ongemakkelijke manier aan een nieuwe alinea of tekstblok begint.", "Het onderbreekt de leesstroom en zorgt ervoor dat de lay-out minder doordacht aanvoelt.", "Redactionele workflows repareren traditioneel weeskinderen vóór publicatie.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Herschrijf een nabijgelegen zin om de pauze opnieuw in evenwicht te brengen.", "Open de maat een beetje als je de lay-out bepaalt.", "Gebruik het als een waarschuwing, niet als een rigide fout."]),
            (.inconsistentSpacing, "Door de spatiëring van enkele en dubbele zinnen te combineren, voelt de tekst uit verschillende bronnen aan elkaar geplakt.", "Lezers merken inconsistenties snel op, zelfs als ze niet kunnen uitleggen waarom.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Kies één stijl voor de spatiëring van de zinnen.", "Normaliseer geplakte tekst voordat u deze deelt.", "Houd de keuze consistent van begin tot eind."]),
            (.comicSans, "Comic Sans is niet verboden, maar het heeft een sterke culturele toon die vaak botst met serieuze teksten.", "Lettertypen communiceren de stemming voordat een lezer de woorden zelfs maar heeft verwerkt.", "Comic Sans werd in 1994 ontworpen voor een software-interface voor kinderen en verspreidde zich later tot ver buiten die context.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Kies een lettertype dat bij de boodschap past.", "Reserveer speelse displayvlakken voor duidelijk speels werk.", "Schakel deze detector uit als de keuze opzettelijk is."]),
            (.primeMarks, "Voor metingen zoals voet, inches, minuten en seconden zijn vaak hoofdtekens nodig in plaats van aanhalingstekens.", "De juiste markering voorkomt dubbelzinnigheid en zorgt ervoor dat technische tekst er doelbewuster uitziet.", nil, "5'11\"", "5′11″", ["Gebruik priemgetallen en dubbelpriemtekens na cijfers.", "Let op automatische conversie van slimme offertes.", "Controleer de specificaties, menu's en productafmetingen zorgvuldig."]),
            (.multiplicationSign, "De letter x en het vermenigvuldigingsteken zijn qua afmetingen niet uitwisselbaar.", "Het gebruik van × geeft technische teksten en productteksten een schonere typografische afwerking.", nil, "1920x1080", "1920×1080", ["Vervang x tussen getallen door ×.", "Gebruik tekstvervanging voor gangbare formaten.", "Controleer de specificaties en marketingmiddelen op consistentie."]),
            (.trademarkSymbol, "Formulieren zoals (c), (r) en (tm) zijn een reservenotatie en geen gepolijste eindkopie.", "De juiste symbolen besparen ruimte en zorgen ervoor dat juridische of merktekst er afgewerkt uitziet.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Vervang de fallback-notatie door ©, ® en ™.", "Controleer de juridische en marketingteksten voordat deze worden vrijgegeven.", "Houd de afstand rond deze symbolen consistent."])
        ])
    )
}
