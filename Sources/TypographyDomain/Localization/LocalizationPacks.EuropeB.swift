import Foundation

extension L10n {
    static let turkishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Suç Laboratuvarı
app.tab.case_files|Vaka Dosyaları
app.tab.learn|Öğrenin
app.tab.settings|Ayarlar
counts.crimes_categories|Suçlar: %@ · Kategoriler: %@
counts.detected_issues|Algılanan sorunlar: %@
counts.entries|Girişler: %@
counts.characters|Karakterler: %@
counts.line_column|Satır %@ · Sütun %@
counts.crimes_verdict|Suçlar: %@ · %@
share.offense_line|• %@: %@
general.done|Bitti
general.cancel|İptal
general.retry|Yeniden dene
general.next|Sonraki
general.skip|Atla
general.got_it|Anladım
general.coming_soon|Çok Yakında
general.wrong|Yanlış
general.right|Doğru
history.empty_title|Henüz vaka yok
history.empty_subtitle|Bir tarama çalıştırdığınızda vaka dosyalarınız burada görünecektir.
history.share|Paylaş
history.delete|Sil
history.title|Vaka Dosyaları
history.today|BUGÜN
history.yesterday|DÜN
history.this_week|BU HAFTA
history.this_month|BU AY
history.select_all|Tümünü Seç
history.delete_selected|Seçilenleri Sil
learn.title|Hukuk Kütüphanesi
learn.search_prompt|Suç türlerini arayın
learn.empty_title|Eşleşen suç bulunamadı
learn.empty_subtitle|Farklı bir arama terimi deneyin.
learn.what_is_this|Bu sorun nedir?
learn.why_it_matters|Neden önemlidir
learn.history_origin|Geçmiş ve bağlam
learn.how_to_fix|Nasıl düzeltilir?
learn.default_why|İyi tipografi, üzerinde düşünülmüş ayrıntılardan oluşan bir sistemdir.
learn.default_fix|Doğru karakteri kullanın ve belgeyi tutarlı tutun.
input.method|Giriş Yöntemi
input.method.paste|Yapıştır / Yaz
input.method.camera|Kamera (OCR)
input.placeholder|Metninizi buraya yapıştırın veya yazın…
input.paste_from_clipboard|Panodan yapıştır
input.title|Kanıt Gönderin
input.analyze|Analiz et
input.analyze_evidence|Kanıtları Analiz Edin
input.camera_message|Kamera tabanlı metin tanıma gelecekteki bir güncellemeyle gelecek. Şimdilik analiz edilecek metninizi yapıştırın veya yazın.
input.trimmed_warning|Metin 100.000 karaktere kısaltıldı.
input.clipboard_empty|Pano boş. Önce metnin bir kısmını kopyalayın.
input.no_text|Analiz edilecek metin yok. Önce bir metin yapıştırın veya yazın.
home.new_investigation|Yeni Soruşturma
home.new_investigation_subtitle|Adli tipografi analizine başlamak için metni yapıştırın veya yazın
home.new_investigation_badge|MASTA · TÜR · ANALİZ
home.recent_cases|Son Vakalar
home.see_all|Tümünü Gör →
home.empty_title|Henüz vaka yok
home.empty_subtitle|İlk araştırmanıza başlayın.
home.begin_investigation|İncelemeye Başlayın
home.stat.scans|Taramalar
home.stat.crimes|Suçlar
home.stat.avg|Ort.
onboarding.splash_tagline|Her glif kanıttır.
onboarding.page1.title|Yapıştır. Analiz edin. İnceleyin.
onboarding.page1.body|Herhangi bir metni bırakın ve uygulama, göz önünde saklanan tipografik sorunları işaretleyecektir.
onboarding.page2.title|Yazım Denetiminin Kaçırdığını Yakalıyoruz
onboarding.page2.body|Düz tırnak işaretleri, sahte elipsler, uzun tire gibi görünen kısa çizgiler ve tutarsız boşlukların tümü burada görünür.
onboarding.page3.title|Suç Puanınızı Alın
onboarding.page3.body|Tipografinizin ne kadar temiz olduğunu görün ve ardından kararı paylaşın.
onboarding.page4.title|Kullandıkça Öğrenin
onboarding.page4.body|Neden önemli olduğunu ve nasıl düzeltileceğini görmek için herhangi bir sorunu açın.
onboarding.start|Araştırmaya Başlayın
onboarding.sample.not_em_dash|Uzun çizgi değil
onboarding.library.investigate|Araştırın
onboarding.library.study|Kuralları inceleyin
analysis.failed_title|Analiz Başarısız
analysis.failed_body|Tarama sırasında bir şeyler ters gitti. Lütfen tekrar deneyin.
analysis.status.scan|Tipografik kanıtlar taranıyor…
analysis.status.quotes|Tırnak işaretleri kontrol ediliyor…
analysis.status.dashes|Tire kullanımı kontrol ediliyor…
analysis.status.ellipsis|Elipsler kontrol ediliyor…
analysis.status.spacing|Aralık tutarlılığı kontrol ediliyor…
analysis.status.layout|Dul ve yetimler kontrol ediliyor...
analysis.status.comic_sans|Yazı tipi meta verileri kontrol ediliyor…
analysis.status.compiling|Rapor derleniyor…
mugshot.title|Tipografik suiistimal nedeniyle işaretlendi
mugshot.body|Comic Sans bulundu. Eğlenceli bağlamlarda işe yarayabilir ancak çoğu ürün ve editoryal ortamda uyumsuzluk olarak algılanır.
mugshot.continue|Tam Raporu Aç →
report.breakdown|Suç Dağılımı
report.share|Raporu Paylaş
report.new_scan|Yeni Tarama
report.close|Raporu Kapat
report.copy_fixed|Sabit Metni Kopyala
report.copy_fixed_hint|Geçerli düzeltilmiş metni kopyalar.
report.clean_title|Lekesiz
report.clean_body|Hiçbir tipografik sorun algılanmadı. Bu metin örnek bir vatandaştır.
report.replace_single_space|Tek boşlukla değiştirin
report.fixed_text_copied|Sabit metin kopyalandı ✓
report.manual_rewrite|Bu sorunun manuel olarak yeniden yazılması gerekiyor.
report.apply_failed|Bu düzeltme uygulanamadı.
report.issue_fixed|Sorun düzeltildi ve rapor güncellendi ✓
report.learn_more|Bu sorun hakkında daha fazla bilgi edinin →
settings.detection_rules|Algılama Kuralları
settings.scoring|Puanlama
settings.strictness|Puanlama Katılığı
settings.dash_style|Uzun Çizgi Stili
settings.appearance|Görünüm
settings.theme|Tema
settings.haptics|Dokunsal Geri Bildirim
settings.sounds|Ses Efektleri
settings.data|Veri
settings.clear_all|Tüm Vaka Dosyalarını Temizle
settings.export_all|Tüm Raporları Dışa Aktar
settings.about|Hakkında
settings.version|Sürüm
settings.typpo|Typpo
settings.rate_app|App Store'da ücretlendirme
settings.send_feedback|Geri Bildirim Gönder
settings.privacy|Gizlilik Politikası
settings.footer|Özenle ve uygun kıvrımlı alıntılarla yapılmıştır.
settings.title|Ayarlar
settings.clear_confirm_title|Tüm vaka dosyaları temizlensin mi?
settings.clear_confirm_message|Bu işlem geri alınamaz.
settings.delete_all|Tümünü Sil
settings.about_body|Metniniz için adli analiz. İstediğiniz metni yapıştırın, puanınızı alın ve kararı paylaşın.
settings.about_placeholder|Bu yapı tamamen çevrimdışıdır ve web sitesi, gizlilik politikası ve App Store hedefi için yer tutucu sürüm bağlantılarını kullanmaya devam eder.
settings.about_website|Web sitesi: %@
share.title|Raporu Paylaş
share.copy_report_image|Rapor Resmini Kopyala
share.save_to_photos|Fotoğraflara Kaydet
share.copy_report_text|Rapor Metnini Kopyala
share.photos_needed|Fotoğraflara Erişim Gerekli
share.open_settings|Ayarları Aç
share.photos_message|Rapor görüntüsünü kaydetmek için fotoğraflara erişim gerekiyor. Erişim izni vermek için Ayarlar'ı açın.
share.primary.share_text|Metin Paylaş
share.primary.copy_link|Bağlantıyı Kopyala
share.primary.share|Paylaş
share.copied_clipboard|Panoya kopyalandı ✓
share.deep_link_copied|Derin bağlantı kopyalandı ✓
share.render_failed|Rapor görüntüsü oluşturulamadı.
share.saved_photos|Fotoğraflara kaydedildi ✓
share.save_failed|Rapor resmi kaydedilemedi.
share.swipe_up|KENDİ METNİNİZİ ANALİZ ETMEK İÇİN UYGULAMAYI AÇIN
share.report_heading|Tipografi Raporu
share.score_prefix|Puan
share.top_issues|En önemli sorunlar
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Metniniz yalnızca boşluk içeriyor. Suç teşkil etmiyor ancak şüpheli.
engine.non_latin_warning|Analiz, Latin alfabesi tipografisine göre ayarlanmıştır. Bazı boşluk ve noktalama kuralları bu yazı sisteminde geçerli olmayabilir.
engine.short_text_note|Çok kısa pasajlarda dul ve yetim tespiti daha az güvenilirdir.
engine.fix.single_space|Cümle sonu noktalama işaretlerinden sonra tek boşluk kullanın.
engine.fix.replace_with|%@ ile değiştirin
engine.fix.normalize_spacing|Metin boyunca cümle aralıklarını normalleştirin.
engine.fix.rewrite_widow|Tek kelimelik bir son satırdan kaçınmak için paragrafı yeniden yazın veya yeniden akıtın.
engine.fix.rewrite_orphan|Küçük bir aktarım hattını önlemek için yakındaki kopyayı ayarlayın.
engine.fix.change_font|Daha uygun bir yazı tipi kullanın.
engine.explain.double_space|Bu cümle, orantılı tipografiye ait olmayan, daktilo dönemi geleneği olan çoklu boşluklarla bitiyor.
engine.explain.straight_quotes|Bu tırnak işareti, yönlü kıvrımlı tırnak işaretleri yerine düz ASCII formunu kullanır.
engine.explain.hyphen_dash|Bu kesinti, uygun bir kısa çizgi yerine kısa çizgi-eksi karakterleri kullanır.
engine.explain.fake_ellipsis|Bu nokta dizisi üç nokta karakteriyle değiştirilmelidir.
engine.explain.inconsistent_spacing|Bu cümle aralığı metindeki baskın kalıptan farklıdır.
engine.explain.widow|Paragraf, görünür bir dul oluşturan izole edilmiş bir son satır sözcüğüyle biter.
engine.explain.orphan|Bu paragraf, muhtemelen yetim olarak okunan uzun bir önceki paragraftan sonra çok kısa bir satırla başlıyor.
engine.explain.comic_sans|Comic Sans meta verileri, gönderilen zengin metinde bulundu.
engine.explain.prime_marks|Bu ölçüm işareti, uygun asal sembol yerine ASCII tırnak işareti kullanıyor.
engine.explain.multiplication_sign|Bu boyut, çarpma işaretinin görünmesi gereken yerde x harfini kullanır.
engine.explain.trademark_symbol|Bu geri dönüş gösterimi uygun sembolle değiştirilmelidir.
category.punctuation|Noktalama Sorunları
category.spacing|Boşluk Sorunları
category.layout|Yerleşim Sorunları
category.font|Yazı Tipi Sorunları
category.symbol|Sembol Sorunları
severity.infraction|İHLAL
severity.misdemeanor|KABAHAT
severity.felony|SUÇ
verdict.clean|TEMİZ
verdict.infraction|İHLAL
verdict.misdemeanor|KABAHAT
verdict.felony|SUÇ
verdict.capital|SERMAYE SUÇU
strictness.lenient|Hoşgörülü
strictness.standard|Standart
strictness.strict|Katı
theme.system|Sistem
theme.light|Işık
theme.dark|Karanlık
dash.spaced|Aralıklı
dash.closed|Kapalı
share_format.image|Resim
share_format.story|Hikaye
share_format.landscape|Manzara
share_format.text|Düz Metin
share_format.link|Bağlantıyı Kopyala
share_format_desc.image|PNG sosyal yayınlar için optimize edilmiş resim.
share_format_desc.story|1080×1920 hikayeye hazır rapor.
share_format_desc.landscape|Makale ve sosyal önizlemeler için geniş kart.
share_format_desc.text|Biçimlendirilmiş metin özeti.
share_format_desc.link|Yer tutucu derin bağlantı kopyası.
evidence_source.typed|Yazıldı
evidence_source.pasted|Yapıştırıldı
evidence_source.pasted_rich|Zengin Metin Yapıştırıldı
toast.load_failed|Kayıtlı vaka dosyaları yüklenemedi.
toast.save_failed|Dava dosyası kaydedilemedi.
toast.delete_failed|Silme işlemi başarısız oldu.
toast.cleared|Tüm vaka dosyaları temizlendi.
toast.clear_failed|Vaka dosyaları temizlenemedi.
toast.export_failed|Dışa aktarma başarısız oldu.
"""),
        verdictShortLabels: verdictMap("""
clean|TEMİZ
infraction|İHLAL
misdemeanor|KABAHAT
felony|SUÇ
capitalOffense|SERMAYE SUÇU
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Noktalama Sorunları
spacing|Boşluk Sorunları
layout|Yerleşim Sorunları
font|Yazı Tipi Sorunları
symbol|Sembol Sorunları
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Çift Boşluk
straightQuotes|Düz Alıntılar
hyphenAsDash|Çizgi Olarak Kısa Çizgi
fakeEllipsis|Sahte Üç Nokta
widow|Dullar
orphan|Yetimler
inconsistentSpacing|Tutarsız Aralık
comicSans|Comic Sans
primeMarks|Başarılı İşaretler
multiplicationSign|Yanlış Çarpma İşareti
trademarkSymbol|Ticari Marka Sembolünün Kötüye Kullanımı
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Cümle sonu noktalama işaretlerinden sonra fazladan boşluklar.
straightQuotes|ASCII kıvrımlı tırnakların ait olduğu yerlerde tırnak işaretleri kullanılır.
hyphenAsDash|Gerçek bir çizgiyi temsil eden kısa çizgiler.
fakeEllipsis|Elips karakteri yerine üç nokta kullanıldı.
widow|Yalnızca bir kısa kelimeden oluşan son satır kaldı.
orphan|Paragrafın başlangıcındaki küçük bir aktarma çizgisi.
inconsistentSpacing|Tek metinde karışık cümle aralığı stilleri.
comicSans|Comic Sans gönderilen kanıtta tespit edildi.
primeMarks|ASCII asal sembollerin ait olduğu yerlerde tırnak işaretleri kullanılır.
multiplicationSign|× yerine kullanılan x harfi.
trademarkSymbol|©, ® veya ™ yerine geri dönüş gösterimi kullanıldı.
"""),
        articles: articleMap([
            (.doubleSpace, "Cümleden sonraki çift boşluklar daktilo alışkanlıklarından kaynaklanır. Modern orantısal yazımda, daha temiz varsayılan bir boşluktur.", "Ekstra boşluklar, paragrafta düzensiz ritim ve gözle görülür boşluklar oluşturur.", "Daktilolar sabit genişlikte karakterler kullanıyordu, dolayısıyla fazladan boşluk bırakmak okuyucuların cümle sonlarını görmesine yardımcı oluyordu.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Noktalama işaretlerinden sonra tekrarlanan boşlukları arayın.", "Paylaşmadan önce hızlı bir temizleme işlemi gerçekleştirin.", "Çift boşluk kasıtlı olarak kullanıldıysa tutarlı olmasını sağlayın."]),
            (.straightQuotes, "Düz tırnaklar düz ASCII işaretleridir. Biten metin genellikle yön veren kıvrımlı tırnak işaretleri ile daha iyi okunur.", "Kıvırcık alıntılar daha gösterişli görünür ve cümlenin görsel ritmini geliştirir.", "İlk klavyeler ve karakter kümeleri her iki yön için de yalnızca bir basit tırnak işareti tutuyordu.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Varsa akıllı noktalama işaretini açın.", "Düz metin kaynaklarından yapıştırılan metni temizleyin.", "Ölçümleri kontrol ederek başlangıç işaretlerinin doğru kalmasını sağlayın."]),
            (.hyphenAsDash, "Kısa çizgiler sözcükleri birleştirir ancak uzun tire veya uzun tirelerin yerine geçmez.", "Doğru çizgi tonu, aralığı ve okunabilirliği artırır.", "Çift tire, zengin noktalama işaretlerini kolaylıkla üretemeyen sistemlerde geçici bir çözümdü.", "He paused -- dramatically.", "He paused — dramatically.", ["Tarzınızın gerektirdiği gerçek kısa çizgi karakterini kullanın.", "Cümle aralarını değil, bileşikler için kısa çizgileri kullanın.", "Belgenin tamamında tutarlı kalın."]),
            (.fakeEllipsis, "Üç nokta bir üç noktayı taklit edebilir ancak bunlar aynı karakter değildir.", "Gerçek bir üç nokta dengeli aralığa sahiptir ve bir metin satırında daha iyi davranır.", "Gündelik yazma iş akışlarının birçoğu hâlâ varsayılan olarak üç nokta yazmayı kullanıyor.", "Wait...", "Wait…", ["Üç noktayı üç nokta karakteriyle değiştirin.", "Sık sık yazıyorsanız metin değiştirmeyi kullanın.", "Yayınlamadan önce içe aktarılan kopyayı kontrol edin."]),
            (.widow, "Dul bir kadın paragrafın son satırında kısa bir kelimeyi yarım bırakır.", "Bu zayıf son paragrafın şeklini ve ritmini bozuyor.", "Editörler ve tasarımcılar, baskıda dolulmaları önlemek için satır sonlarını uzun süre ayarladılar.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Cümleyi biraz sıkın veya yeniden yazın.", "Düzen araçları mevcutsa satır uzunluğunu ayarlayın.", "Bunu yumuşak bir stil önerisi olarak değerlendirin."]),
            (.orphan, "Yetim, yeni bir paragrafa veya metin bloğuna garip bir şekilde başlayan küçük bir aktarma satırıdır.", "Okuma akışını bozar ve düzenin daha az düşünülmüş gibi görünmesine neden olur.", "Editörlük iş akışları geleneksel olarak yetimleri yayınlanmadan önce düzeltir.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Arayı yeniden dengelemek için yakındaki bir ifadeyi yeniden yazın.", "Düzeni kontrol ediyorsanız hesaplamayı biraz açın.", "Bunu kesin bir hata olarak değil, uyarı olarak kullanın."]),
            (.inconsistentSpacing, "Tek ve çift cümle aralığını karıştırmak, metnin farklı kaynaklardan birleştirilmiş gibi görünmesini sağlar.", "Okuyucular nedenini açıklayamasalar bile tutarsızlığı hemen fark ederler.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Bir cümle aralığı stili seçin.", "Yapıştırılan metni paylaşmadan önce normalleştirin.", "Seçimi baştan sona tutarlı tutun."]),
            (.comicSans, "Comic Sans yasak değildir ancak ciddi metinlerle sıklıkla çatışan güçlü bir kültürel ton taşır.", "Yazı tipleri, okuyucu kelimeleri işlemeden önce ruh halini iletir.", "Comic Sans 1994 yılında çocuklara yönelik bir yazılım arayüzü için tasarlandı ve daha sonra bu bağlamın çok ötesine yayıldı.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Mesajınıza uygun bir yazı tipi seçin.", "Açıkça eğlenceli çalışmalar için eğlenceli ekran yüzlerini ayırın.", "Seçim kasıtlıysa bu dedektörü devre dışı bırakın."]),
            (.primeMarks, "Fit, inç, dakika ve saniye gibi ölçümler genellikle tırnak işaretleri yerine asal sembollere ihtiyaç duyar.", "Doğru işaret belirsizliği önler ve teknik metnin daha bilinçli görünmesini sağlar.", nil, "5'11\"", "5′11″", ["Rakamlardan sonra asal ve çift asal sembolleri kullanın.", "Otomatik akıllı alıntı dönüşümünü izleyin.", "Teknik özellikleri, menüleri ve ürün boyutlarını dikkatlice kontrol edin."]),
            (.multiplicationSign, "X harfi ve çarpma işareti boyut olarak birbirinin yerine kullanılamaz.", "× kullanmak, teknik ve ürün kopyalarına daha temiz bir tipografik görünüm kazandırır.", nil, "1920x1080", "1920×1080", ["Sayıların arasındaki x'i × ile değiştirin.", "Genel boyut biçimleri için metin değiştirmeyi kullanın.", "Tutarlılık sağlamak için özellikleri ve pazarlama varlıklarını inceleyin."]),
            (.trademarkSymbol, "(c), (r) ve (tm) gibi formlar, son kopya değil, geri dönüş gösterimidir.", "Doğru semboller yerden tasarruf sağlar ve yasal veya marka metninin bitmiş gibi görünmesini sağlar.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Son çare gösterimini ©, ® ve ™ ile değiştirin.", "Yayınlamadan önce yasal ve pazarlama metnini kontrol edin.", "Bu sembollerin etrafındaki aralığı tutarlı tutun."])
        ])
    )

    static let russianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Криминальная лаборатория
app.tab.case_files|Дело
app.tab.learn|Узнать
app.tab.settings|Настройки
counts.crimes_categories|Преступления: %@ · Категории: %@
counts.detected_issues|Обнаружены проблемы: %@
counts.entries|Записи: %@
counts.characters|Символы: %@
counts.line_column|Строка %@ · Столбец %@
counts.crimes_verdict|Преступления: %@ · %@
share.offense_line|• %@: %@
general.done|Готово
general.cancel|Отмена
general.retry|Повторить
general.next|Далее
general.skip|Пропустить
general.got_it|Понял
general.coming_soon|Скоро
general.wrong|Неверно
general.right|Верно
history.empty_title|Случаев пока нет
history.empty_subtitle|Запустите сканирование, и здесь появятся файлы вашего дела.
history.share|Поделиться
history.delete|Удалить
history.title|Дело
history.today|СЕГОДНЯ
history.yesterday|ВЧЕРА
history.this_week|ЭТА НЕДЕЛЯ
history.this_month|В ЭТОМ МЕСЯЦЕ
history.select_all|Выбрать все
history.delete_selected|Удалить выбранное
learn.title|Юридическая библиотека
learn.search_prompt|Поиск типов преступлений
learn.empty_title|Подходящих преступлений не обнаружено
learn.empty_subtitle|Попробуйте другой поисковый запрос.
learn.what_is_this|Что это за проблема?
learn.why_it_matters|Почему это важно
learn.history_origin|История и контекст
learn.how_to_fix|Как это исправить
learn.default_why|Хорошая типографика — это система продуманных деталей.
learn.default_fix|Используйте правильный символ и сохраняйте единообразие в документе.
input.method|Метод ввода
input.method.paste|Вставить/Ввести
input.method.camera|Камера (OCR)
input.placeholder|Вставьте или введите сюда свой текст…
input.paste_from_clipboard|Вставить из буфера обмена
input.title|Отправить доказательства
input.analyze|Анализ
input.analyze_evidence|Анализ доказательств
input.camera_message|Распознавание текста с помощью камеры появится в будущем обновлении. А пока вставьте или введите текст для анализа.
input.trimmed_warning|Текст был обрезан до 100 000 символов.
input.clipboard_empty|Буфер обмена пуст. Сначала скопируйте текст.
input.no_text|Нет текста для анализа. Сначала вставьте или введите текст.
home.new_investigation|Новое расследование
home.new_investigation_subtitle|Вставьте или введите текст, чтобы начать судебно-типографический анализ
home.new_investigation_badge|ВСТАВИТЬ · ТИП · АНАЛИЗ
home.recent_cases|Недавние случаи
home.see_all|Просмотреть все →
home.empty_title|Случаев пока нет
home.empty_subtitle|Начните свое первое расследование.
home.begin_investigation|Начать расследование
home.stat.scans|Сканирование
home.stat.crimes|Преступления
home.stat.avg|Среднее
onboarding.splash_tagline|Каждый символ является доказательством.
onboarding.page1.title|Вставить. Анализируйте. Обзор.
onboarding.page1.body|Вставьте любой текст, и приложение укажет на типографские ошибки, скрытые на виду.
onboarding.page2.title|Мы замечаем то, что упускает проверка правописания
onboarding.page2.body|Здесь отображаются прямые кавычки, ложные многоточия, дефисы, притворяющиеся длинными тире, и непостоянные интервалы.
onboarding.page3.title|Получите свой показатель преступности
onboarding.page3.body|Посмотрите, насколько чиста ваша типографика, и поделитесь вердиктом.
onboarding.page4.title|Учитесь по ходу дела
onboarding.page4.body|Откройте любую проблему, чтобы понять, почему она важна и как ее исправить.
onboarding.start|Начать расследование
onboarding.sample.not_em_dash|Не длинное тире
onboarding.library.investigate|Расследование
onboarding.library.study|Изучите правила
analysis.failed_title|Анализ не удался
analysis.failed_body|Во время сканирования что-то пошло не так. Пожалуйста, попробуйте еще раз.
analysis.status.scan|Сканирование на предмет типографских доказательств…
analysis.status.quotes|Проверка кавычек…
analysis.status.dashes|Проверка использования тире…
analysis.status.ellipsis|Проверка эллипсов…
analysis.status.spacing|Проверка согласованности интервалов…
analysis.status.layout|Проверка вдов и сирот…
analysis.status.comic_sans|Проверка метаданных шрифта…
analysis.status.compiling|Составление отчета…
mugshot.title|Отмечен за опечатку
mugshot.body|Comic Sans был обнаружен в представленных доказательствах. В игривом контексте это может сработать, но в большинстве продуктовых и редакционных ситуаций это воспринимается как несоответствие.
mugshot.continue|Открыть полный отчет →
report.breakdown|Распределение преступности
report.share|Поделиться отчетом
report.new_scan|Новое сканирование
report.close|Закрыть отчет
report.copy_fixed|Копировать фиксированный текст
report.copy_fixed_hint|Копирует текущий исправленный текст.
report.clean_title|Безупречно
report.clean_body|Никаких типографских проблем обнаружено не было. Этот текст — образцовый гражданин.
report.replace_single_space|Заменить одним пробелом
report.fixed_text_copied|Скопирован фиксированный текст ✓
report.manual_rewrite|Эту проблему необходимо переписать вручную.
report.apply_failed|Не удалось применить это исправление.
report.issue_fixed|Проблема устранена, отчет обновлен ✓
report.learn_more|Подробнее об этой проблеме →
settings.detection_rules|Правила обнаружения
settings.scoring|Оценка
settings.strictness|Строгость оценки
settings.dash_style|Стиль длинного тире
settings.appearance|Внешний вид
settings.theme|Тема
settings.haptics|Тактильная обратная связь
settings.sounds|Звуковые эффекты
settings.data|Данные
settings.clear_all|Очистить все файлы дела
settings.export_all|Экспортировать все отчеты
settings.about|О программе
settings.version|Версия
settings.typpo|Typpo
settings.rate_app|Оценка в App Store
settings.send_feedback|Отправить отзыв
settings.privacy|Политика конфиденциальности
settings.footer|Сделано тщательно и с правильными фигурными кавычками.
settings.title|Настройки
settings.clear_confirm_title|Очистить все файлы дела?
settings.clear_confirm_message|Это действие невозможно отменить.
settings.delete_all|Удалить все
settings.about_body|Криминалистический анализ вашего текста. Вставьте любой текст, получите оценку и поделитесь вердиктом.
settings.about_placeholder|Эта сборка полностью автономна и по-прежнему использует ссылки на выпуск-заполнитель для веб-сайта, политики конфиденциальности и места назначения App Store.
settings.about_website|Веб-сайт: %@
share.title|Поделиться отчетом
share.copy_report_image|Копировать изображение отчета
share.save_to_photos|Сохранить в фотографиях
share.copy_report_text|Копировать текст отчета
share.photos_needed|Требуется доступ к фотографиям
share.open_settings|Открыть настройки
share.photos_message|Для сохранения изображения отчета необходим доступ к фотографиям. Откройте «Настройки», чтобы предоставить доступ.
share.primary.share_text|Поделиться текстом
share.primary.copy_link|Копировать ссылку
share.primary.share|Поделиться
share.copied_clipboard|Скопировано в буфер обмена ✓
share.deep_link_copied|Ссылка на контент скопирована ✓
share.render_failed|Не удалось отобразить изображение отчета.
share.saved_photos|Сохранено в фотографиях ✓
share.save_failed|Не удалось сохранить изображение отчета.
share.swipe_up|ОТКРОЙТЕ ПРИЛОЖЕНИЕ, ЧТОБЫ АНАЛИЗИРОВАТЬ СОБСТВЕННЫЙ ТЕКСТ
share.report_heading|Отчет о типографике
share.score_prefix|Оценка
share.top_issues|Основные проблемы
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Ваш текст содержит только пробелы. Это не криминально, но подозрительно.
engine.non_latin_warning|Анализ настроен на типографику с латинским алфавитом. Некоторые правила пробелов и пунктуации могут не применяться к этой системе письма.
engine.short_text_note|Обнаружение висячих и сирот менее надежно на очень коротких отрывках.
engine.fix.single_space|Используйте один пробел после знака препинания в конце предложения.
engine.fix.replace_with|Заменить на %@
engine.fix.normalize_spacing|Нормализация интервала между предложениями по всему тексту.
engine.fix.rewrite_widow|Перепишите или измените расположение абзаца, чтобы избежать последней строки из одного слова.
engine.fix.rewrite_orphan|Откорректируйте ближайший текст, чтобы избежать крошечной линии переноса.
engine.fix.change_font|Используйте более подходящий шрифт.
engine.explain.double_space|Это предложение заканчивается несколькими пробелами — соглашение эпохи пишущих машинок, которое не соответствует пропорциональной типографике.
engine.explain.straight_quotes|Эта кавычка использует прямую форму ASCII вместо направленных фигурных кавычек.
engine.explain.hyphen_dash|В этом прерывании вместо правильного тире используются символы дефис-минус.
engine.explain.fake_ellipsis|Эту последовательность точек следует заменить символом многоточия.
engine.explain.inconsistent_spacing|Этот интервал между предложениями отличается от доминирующего образца в тексте.
engine.explain.widow|Абзац заканчивается изолированным словом в последней строке, образующим видимое окошко.
engine.explain.orphan|Этот абзац начинается с очень короткой строки после длинного предыдущего абзаца, которая, скорее всего, читается как потерянная.
engine.explain.comic_sans|В отправленном форматированном тексте обнаружены метаданные Comic Sans.
engine.explain.prime_marks|В этой метке измерения используется кавычка ASCII вместо правильного штрихового символа.
engine.explain.multiplication_sign|Этот размер использует букву x там, где должен стоять знак умножения.
engine.explain.trademark_symbol|Это резервное обозначение следует заменить соответствующим символом.
category.punctuation|Проблемы с пунктуацией
category.spacing|Проблемы с интервалами
category.layout|Проблемы с макетом
category.font|Проблемы со шрифтами
category.symbol|Проблемы с символами
severity.infraction|НАРУШЕНИЕ
severity.misdemeanor|ПРАВОНАРУШЕНИЕ
severity.felony|ПРЕКРАЩЕНИЕ
verdict.clean|ЧИСТКА
verdict.infraction|НАРУШЕНИЕ
verdict.misdemeanor|ПРАВОНАРУШЕНИЕ
verdict.felony|ПРЕКРАЩЕНИЕ
verdict.capital|СМЕРТНОЕ ПРЕСТУПЛЕНИЕ
strictness.lenient|Снисходительный
strictness.standard|Стандарт
strictness.strict|Строгий
theme.system|Система
theme.light|Свет
theme.dark|Темный
dash.spaced|Размещено
dash.closed|Закрыто
share_format.image|Изображение
share_format.story|История
share_format.landscape|Пейзаж
share_format.text|Обычный текст
share_format.link|Копировать ссылку
share_format_desc.image|Изображение PNG, оптимизированное для социальных сетей.
share_format_desc.story|Готовый отчет 1080×1920
share_format_desc.landscape|Широкая карточка для предварительного просмотра статей и социальных сетей.
share_format_desc.text|Форматированное текстовое резюме.
share_format_desc.link|Копия глубокой ссылки-заполнителя.
evidence_source.typed|Введено
evidence_source.pasted|Вставлен
evidence_source.pasted_rich|Вставлен форматированный текст
toast.load_failed|Не удалось загрузить сохраненные файлы дел.
toast.save_failed|Не удалось сохранить файл дела.
toast.delete_failed|Не удалось удалить.
toast.cleared|Все файлы дела очищены.
toast.clear_failed|Не удалось очистить файлы дела.
toast.export_failed|Ошибка экспорта.
"""),
        verdictShortLabels: verdictMap("""
clean|ЧИСТКА
infraction|НАРУШЕНИЕ
misdemeanor|ПРАВОНАРУШЕНИЕ
felony|ПРЕКРАЩЕНИЕ
capitalOffense|СМЕРТНОЕ ПРЕСТУПЛЕНИЕ
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Проблемы с пунктуацией
spacing|Проблемы с интервалами
layout|Проблемы с макетом
font|Проблемы со шрифтами
symbol|Проблемы с символами
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Двойные пробелы
straightQuotes|Прямые кавычки
hyphenAsDash|Дефис как тире
fakeEllipsis|Ложное многоточие
widow|Вдовы
orphan|Сироты
inconsistentSpacing|Несоответствующий интервал
comicSans|Comic Sans
primeMarks|Первоначальные знаки
multiplicationSign|Неправильный знак умножения
trademarkSymbol|Неправомерное использование символа товарного знака
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Дополнительные пробелы после знаков препинания в конце предложения.
straightQuotes|Кавычки ASCII используются вместо фигурных кавычек.
hyphenAsDash|Дефисы заменяют настоящее тире.
fakeEllipsis|Вместо многоточия используются три точки.
widow|В последней строке осталось только одно короткое слово.
orphan|Крошечная переносимая строка в начале абзаца.
inconsistentSpacing|Смешанные стили расположения предложений в одном тексте.
comicSans|В представленных доказательствах обнаружен Comic Sans.
primeMarks|Кавычки ASCII используются там, где принадлежат простые символы.
multiplicationSign|Вместо × используется буква x.
trademarkSymbol|Резервное обозначение используется вместо ©, ® или ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Двойные пробелы после предложения возникают из-за привычки писать на пишущей машинке. В современном пропорциональном шрифте один пробел является более чистым по умолчанию.", "Лишние пробелы создают неравномерный ритм и видимые пробелы в абзаце.", "В пишущих машинках использовались символы фиксированной ширины, поэтому дополнительный интервал когда-то помогал читателям видеть разрывы предложений.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Поиск повторяющихся пробелов после знаков препинания.", "Перед тем как поделиться, выполните быструю очистку.", "Если двойные пробелы созданы намеренно, сохраняйте их согласованность."]),
            (.straightQuotes, "Прямые кавычки представляют собой простые знаки ASCII. Готовый текст обычно лучше читается с направленными фигурными кавычками.", "Кудрявые кавычки выглядят более изысканно и улучшают визуальный ритм предложения.", "Ранние клавиатуры и наборы символов содержали только одну простую кавычку для обоих направлений.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Включите интеллектуальную пунктуацию, если она доступна.", "Очистка текста, вставленного из обычных текстовых источников.", "Проверьте размеры, чтобы основные отметки оставались правильными."]),
            (.hyphenAsDash, "Дефисы соединяют слова, но не заменяют длинные тире или тире.", "Правильное тире улучшает тон, интервалы и читабельность.", "Двойные дефисы были обходным решением в системах, которые не могли легко создать богатую пунктуацию.", "He paused -- dramatically.", "He paused — dramatically.", ["Используйте настоящий тире, которого требует ваш стиль.", "Сохраняйте дефисы для составных частей, а не разрывов предложений.", "Сохраняйте единообразие во всем документе."]),
            (.fakeEllipsis, "Три точки могут имитировать многоточие, но это не один и тот же символ.", "Настоящий многоточие имеет сбалансированный интервал и лучше ведет себя в строке текста.", "Многие рабочие процессы обычного письма по-прежнему по умолчанию используют три точки.", "Wait...", "Wait…", ["Замените три точки многоточием.", "Используйте замену текста, если вы его часто печатаете.", "Проверяйте импортированную копию перед публикацией."]),
            (.widow, "Вдова оставляет одно короткое слово в последней строке абзаца.", "Это слабое окончание нарушает форму и ритм абзаца.", "Редакторы и дизайнеры долго настраивали разрывы строк, чтобы избежать появления висячих строк при печати.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Слегка ужесточите или перепишите предложение.", "Отрегулируйте длину строки, если доступны инструменты макета.", "Считайте это мягкой рекомендацией по стилю."]),
            (.orphan, "Сиротская строка — это крошечная переносящаяся строка, которая неудобно начинает новый абзац или текстовый блок.", "Это нарушает процесс чтения и делает макет менее продуманным.", "Редакционные рабочие процессы традиционно исправляют ошибки перед публикацией.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Перепишите ближайшую фразу, чтобы сбалансировать разрыв.", "Слегка приоткройте меру, если вы управляете макетом.", "Используйте это как предупреждение, а не как серьезную ошибку."]),
            (.inconsistentSpacing, "Смешивание одинарного и двойного интервала между предложениями создает ощущение, будто текст из разных источников сшит вместе.", "Читатели быстро замечают несоответствие, даже если не могут объяснить, почему.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Выберите один стиль межпредложений.", "Нормализовать вставленный текст, прежде чем поделиться им.", "Сохраняйте единообразие выбора от начала до конца."]),
            (.comicSans, "Comic Sans не запрещен, но несет в себе сильный культурный оттенок, который часто противоречит серьезному тексту.", "Шрифты передают настроение еще до того, как читатель обработает слова.", "Comic Sans был разработан в 1994 году для детского программного интерфейса, а затем распространился далеко за пределы этого контекста.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Выберите шрифт, соответствующий сообщению.", "Сохраняйте игривые лица для явно игривой работы.", "Отключите этот детектор, если выбор сделан намеренно."]),
            (.primeMarks, "Для таких измерений, как футы, дюймы, минуты и секунды, часто требуются простые символы, а не кавычки.", "Правильная пометка предотвращает двусмысленность и делает технический текст более продуманным.", nil, "5'11\"", "5′11″", ["Используйте символы простых и двойных штрихов после цифр.", "Следите за автоматическим преобразованием смарт-цитат.", "Внимательно проверяйте характеристики, меню и размеры продукта."]),
            (.multiplicationSign, "Буква x и знак умножения не являются взаимозаменяемыми по размерам.", "Использование × придает технической документации и тексту продукта более чистый типографский вид.", nil, "1920x1080", "1920×1080", ["Замените x между числами на ×.", "Использовать замену текста для распространенных форматов размеров.", "Проверьте спецификации и маркетинговые материалы на предмет согласованности."]),
            (.trademarkSymbol, "Такие формы, как (c), (r) и (tm), являются резервными обозначениями, а не доработанной окончательной копией.", "Правильные символы экономят место и придают юридическому или фирменному тексту законченный вид.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Замените резервное обозначение на ©, ® и ™.", "Перед выпуском проверьте юридическую и маркетинговую копию.", "Сохраняйте одинаковое расстояние между этими символами."])
        ])
    )

    static let polishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratorium kryminalistyczne
app.tab.case_files|Akta sprawy
app.tab.learn|Dowiedz się
app.tab.settings|Ustawienia
counts.crimes_categories|Przestępstwa: %@ · Kategorie: %@
counts.detected_issues|Wykryte problemy: %@
counts.entries|Wpisy: %@
counts.characters|Znaki: %@
counts.line_column|Linia %@ · Col %@
counts.crimes_verdict|Przestępstwa: %@ · %@
share.offense_line|• %@: %@
general.done|Gotowe
general.cancel|Anuluj
general.retry|Spróbuj ponownie
general.next|Dalej
general.skip|Pomiń
general.got_it|Rozumiem
general.coming_soon|Już wkrótce
general.wrong|Źle
general.right|Prawo
history.empty_title|Nie ma jeszcze żadnych przypadków
history.empty_subtitle|Uruchom skanowanie, a akta Twojej sprawy pojawią się tutaj.
history.share|Udostępnij
history.delete|Usuń
history.title|Akta sprawy
history.today|DZIŚ
history.yesterday|WCZORAJ
history.this_week|W TYM TYGODNIU
history.this_month|W TYM MIESIĄCU
history.select_all|Wybierz wszystko
history.delete_selected|Usuń wybrane
learn.title|Biblioteka prawnicza
learn.search_prompt|Wyszukaj rodzaje przestępstw
learn.empty_title|Nie znaleziono pasujących przestępstw
learn.empty_subtitle|Wypróbuj inne wyszukiwane hasło.
learn.what_is_this|Co to za problem?
learn.why_it_matters|Dlaczego jest to ważne
learn.history_origin|Historia i kontekst
learn.how_to_fix|Jak to naprawić
learn.default_why|Dobra typografia to system przemyślanych szczegółów.
learn.default_fix|Użyj prawidłowego znaku i zachowaj spójność dokumentu.
input.method|Metoda wprowadzania
input.method.paste|Wklej / wpisz
input.method.camera|Kamera (OCR)
input.placeholder|Wklej lub wpisz tutaj swój tekst…
input.paste_from_clipboard|Wklej ze schowka
input.title|Prześlij dowód
input.analyze|Analizuj
input.analyze_evidence|Analizuj dowody
input.camera_message|Rozpoznawanie tekstu za pomocą aparatu będzie dostępne w przyszłej aktualizacji. Na razie wklej lub wpisz tekst do analizy.
input.trimmed_warning|Tekst został przycięty do 100 000 znaków.
input.clipboard_empty|Schowek jest pusty. Najpierw skopiuj jakiś tekst.
input.no_text|Brak tekstu do analizy. Najpierw wklej lub wpisz tekst.
home.new_investigation|Nowe dochodzenie
home.new_investigation_subtitle|Wklej lub wpisz tekst, aby rozpocząć kryminalistyczną analizę typografii
home.new_investigation_badge|WKLEJ · WPISZ · ANALIZUJ
home.recent_cases|Ostatnie przypadki
home.see_all|Zobacz wszystko →
home.empty_title|Nie ma jeszcze żadnych przypadków
home.empty_subtitle|Rozpocznij swoje pierwsze dochodzenie.
home.begin_investigation|Rozpocznij dochodzenie
home.stat.scans|Skanowanie
home.stat.crimes|Przestępstwa
home.stat.avg|Śr.
onboarding.splash_tagline|Każdy glif jest dowodem.
onboarding.page1.title|Wklej. Analizować. Przejrzyj.
onboarding.page1.body|Wpisz dowolny tekst, a aplikacja oznaczy problemy typograficzne ukryte na widoku.
onboarding.page2.title|Wyłapujemy to, czego brakuje podczas sprawdzania pisowni
onboarding.page2.body|Pojawiają się tutaj proste cudzysłowy, fałszywe elipsy, łączniki udające myślniki i niespójne odstępy.
onboarding.page3.title|Uzyskaj ocenę przestępczości
onboarding.page3.body|Sprawdź, jak czysta jest Twoja typografia, a następnie podziel się werdyktem.
onboarding.page4.title|Ucz się na bieżąco
onboarding.page4.body|Otwórz dowolny problem, aby zobaczyć, dlaczego jest on ważny i jak go rozwiązać.
onboarding.start|Rozpocznij badanie
onboarding.sample.not_em_dash|To nie myślnik
onboarding.library.investigate|Zbadaj
onboarding.library.study|Przestudiuj zasady
analysis.failed_title|Analiza nie powiodła się
analysis.failed_body|Coś poszło nie tak podczas skanowania. Spróbuj ponownie.
analysis.status.scan|Skanowanie dowodów typograficznych…
analysis.status.quotes|Sprawdzam cudzysłowy…
analysis.status.dashes|Sprawdzanie użycia myślnika…
analysis.status.ellipsis|Sprawdzanie elips…
analysis.status.spacing|Sprawdzanie spójności odstępów…
analysis.status.layout|Sprawdzanie wdów i sierot…
analysis.status.comic_sans|Sprawdzanie metadanych czcionki…
analysis.status.compiling|Tworzę raport…
mugshot.title|Oznaczono za niewłaściwe postępowanie typograficzne
mugshot.body|W przesłanych materiałach wykryto Comic Sans. W lekkim, żartobliwym kontekście może się obronić, ale w większości interfejsów i tekstów redakcyjnych brzmi jak stylistyczne niedopasowanie.
mugshot.continue|Otwórz pełny raport →
report.breakdown|Podział przestępczości
report.share|Udostępnij raport
report.new_scan|Nowy skan
report.close|Zamknij raport
report.copy_fixed|Kopiuj ustalony tekst
report.copy_fixed_hint|Kopiuje bieżący poprawiony tekst.
report.clean_title|Bez skazy
report.clean_body|Nie wykryto żadnych problemów typograficznych. Ten tekst jest wzorowym obywatelem.
report.replace_single_space|Zastąp pojedynczą spacją
report.fixed_text_copied|Skopiowano poprawiony tekst ✓
report.manual_rewrite|Ten problem wymaga ręcznego napisania.
report.apply_failed|Nie można zastosować tej poprawki.
report.issue_fixed|Problem rozwiązany i raport zaktualizowany ✓
report.learn_more|Dowiedz się więcej na ten temat →
settings.detection_rules|Zasady wykrywania
settings.scoring|Punktacja
settings.strictness|Ścisłość punktacji
settings.dash_style|Styl Em-kreska
settings.appearance|Wygląd
settings.theme|Motyw
settings.haptics|Opinia dotykowa
settings.sounds|Efekty dźwiękowe
settings.data|Dane
settings.clear_all|Wyczyść wszystkie akta sprawy
settings.export_all|Eksportuj wszystkie raporty
settings.about|O
settings.version|Wersja
settings.typpo|Typpo
settings.rate_app|Oceń w App Store
settings.send_feedback|Wyślij opinię
settings.privacy|Polityka prywatności
settings.footer|Wykonane starannie i z odpowiednimi cytatami.
settings.title|Ustawienia
settings.clear_confirm_title|Usunąć wszystkie akta sprawy?
settings.clear_confirm_message|Tej akcji nie można cofnąć.
settings.delete_all|Usuń wszystko
settings.about_body|Analiza kryminalistyczna Twojego tekstu. Wklej dowolny tekst, uzyskaj wynik i podziel się werdyktem.
settings.about_placeholder|Ta kompilacja jest w pełni offline i nadal korzysta z zastępczych linków do wersji dla witryny internetowej, polityki prywatności i miejsca docelowego App Store.
settings.about_website|Witryna internetowa: %@
share.title|Udostępnij raport
share.copy_report_image|Skopiuj obraz raportu
share.save_to_photos|Zapisz w Zdjęciach
share.copy_report_text|Skopiuj tekst raportu
share.photos_needed|Potrzebny dostęp do zdjęć
share.open_settings|Otwórz Ustawienia
share.photos_message|Do zapisania obrazu raportu potrzebny jest dostęp do zdjęć. Otwórz Ustawienia, aby przyznać dostęp.
share.primary.share_text|Udostępnij tekst
share.primary.copy_link|Skopiuj link
share.primary.share|Udostępnij
share.copied_clipboard|Skopiowano do schowka ✓
share.deep_link_copied|Skopiowano precyzyjny link ✓
share.render_failed|Nie można wyrenderować obrazu raportu.
share.saved_photos|Zapisano w Zdjęciach ✓
share.save_failed|Nie można zapisać obrazu raportu.
share.swipe_up|OTWÓRZ APLIKACJĘ, ABY PRZEanalizować WŁASNY TEKST
share.report_heading|Raport typograficzny
share.score_prefix|Wynik
share.top_issues|Najważniejsze problemy
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Twój tekst zawiera tylko białe znaki. Nie jest to przestępstwo, ale jest podejrzane.
engine.non_latin_warning|Analiza jest dostosowana do typografii alfabetu łacińskiego. Niektóre zasady dotyczące odstępów i interpunkcji mogą nie mieć zastosowania w tym systemie pisma.
engine.short_text_note|Wykrywanie wdów i sierot jest mniej niezawodne w przypadku bardzo krótkich fragmentów.
engine.fix.single_space|Użyj pojedynczej spacji po znaku interpunkcyjnym kończącym zdanie.
engine.fix.replace_with|Zamień na %@
engine.fix.normalize_spacing|Normalizuj odstępy między zdaniami w całym tekście.
engine.fix.rewrite_widow|Przepisz lub zmień układ akapitu, aby uniknąć końcowego wiersza składającego się z jednego słowa.
engine.fix.rewrite_orphan|Dostosuj pobliską kopię, aby uniknąć niewielkiej linii przeniesienia.
engine.fix.change_font|Użyj bardziej odpowiedniej czcionki.
engine.explain.double_space|To zdanie kończy się wieloma spacjami, co jest konwencją z epoki maszyn do pisania, która nie pasuje do typografii proporcjonalnej.
engine.explain.straight_quotes|W tym cudzysłowie zastosowano prostą formę ASCII zamiast kierunkowych cudzysłowów kręconych.
engine.explain.hyphen_dash|W tym przerwaniu zamiast właściwego myślnika używane są znaki łącznika i minusa.
engine.explain.fake_ellipsis|Ten ciąg kropek należy zastąpić znakiem wielokropka.
engine.explain.inconsistent_spacing|Te odstępy między zdaniami różnią się od dominującego wzorca w tekście.
engine.explain.widow|Akapit kończy się izolowanym słowem w ostatnim wierszu, tworząc widoczną wdowę.
engine.explain.orphan|Ten akapit zaczyna się bardzo krótką linijką po długim poprzedzającym akapicie, który prawdopodobnie brzmi jako sierota.
engine.explain.comic_sans|W przesłanym tekście sformatowanym znaleziono metadane Comic Sans.
engine.explain.prime_marks|W tym znaku miary zastosowano cudzysłów ASCII zamiast prawidłowego symbolu pierwszego.
engine.explain.multiplication_sign|W tym wymiarze używana jest litera x w miejscu, w którym powinien pojawić się znak mnożenia.
engine.explain.trademark_symbol|Ten zapis zastępczy należy zastąpić odpowiednim symbolem.
category.punctuation|Problemy interpunkcyjne
category.spacing|Problemy z odstępami
category.layout|Problemy z układem
category.font|Problemy z czcionkami
category.symbol|Problemy dotyczące symboli
severity.infraction|NARUSZENIE
severity.misdemeanor|WSTĘP
severity.felony|Przestępstwo
verdict.clean|CZYSTY
verdict.infraction|NARUSZENIE
verdict.misdemeanor|WSTĘP
verdict.felony|Przestępstwo
verdict.capital|KAPITALNE PRZESTĘPSTWO
strictness.lenient|Łagodny
strictness.standard|Standardowy
strictness.strict|Rurystyczne
theme.system|System
theme.light|Światło
theme.dark|Ciemno
dash.spaced|Odstępy
dash.closed|Zamknięte
share_format.image|Obraz
share_format.story|Historia
share_format.landscape|Krajobraz
share_format.text|Zwykły tekst
share_format.link|Skopiuj link
share_format_desc.image|Obraz PNG zoptymalizowany pod kątem kanałów społecznościowych.
share_format_desc.story|Gotowy raport w formacie 1080×1920.
share_format_desc.landscape|Szeroka karta do podglądów artykułów i mediów społecznościowych.
share_format_desc.text|Sformatowane podsumowanie tekstowe.
share_format_desc.link|Kopia zastępczego precyzyjnego linku.
evidence_source.typed|Wpisano
evidence_source.pasted|Wklejone
evidence_source.pasted_rich|Wklejono tekst sformatowany
toast.load_failed|Nie można wczytać zapisanych akt spraw.
toast.save_failed|Nie można zapisać akt sprawy.
toast.delete_failed|Usunięcie nie powiodło się.
toast.cleared|Wszystkie akta sprawy zostały usunięte.
toast.clear_failed|Nie można wyczyścić akt sprawy.
toast.export_failed|Eksport nie powiódł się.
"""),
        verdictShortLabels: verdictMap("""
clean|CZYSTY
infraction|NARUSZENIE
misdemeanor|WSTĘP
felony|Przestępstwo
capitalOffense|KAPITALNE PRZESTĘPSTWO
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problemy interpunkcyjne
spacing|Problemy z odstępami
layout|Problemy z układem
font|Problemy z czcionkami
symbol|Problemy dotyczące symboli
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Podwójne spacje
straightQuotes|Proste cytaty
hyphenAsDash|Myślnik jako myślnik
fakeEllipsis|Fałszywa elipsa
widow|Wdowy
orphan|Sieroty
inconsistentSpacing|Niespójne odstępy
comicSans|Comic Sans
primeMarks|Pierwsze oceny
multiplicationSign|Zły znak mnożenia
trademarkSymbol|Niewłaściwe użycie symbolu znaku towarowego
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Dodatkowe spacje po znaku interpunkcyjnym kończącym zdanie.
straightQuotes|ASCII cudzysłowy używane tam, gdzie należą cudzysłowy kręcone.
hyphenAsDash|Myślniki zastępujące prawdziwą myślnik.
fakeEllipsis|Zamiast wielokropka zastosowano trzy kropki.
widow|Pozostała ostatnia linijka zawierająca tylko jedno krótkie słowo.
orphan|Mała linia przeniesienia na początku akapitu.
inconsistentSpacing|Mieszane style odstępów między zdaniami w jednym tekście.
comicSans|Comic Sans wykryto w przedstawionych dowodach.
primeMarks|ASCII cudzysłowy używane tam, gdzie należą symbole pierwsze.
multiplicationSign|Litera x użyta zamiast ×.
trademarkSymbol|Zapis zastępczy używany zamiast ©, ® lub ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Podwójne spacje po zdaniu wynikają z nawyków związanych z maszyną do pisania. W nowoczesnym typie proporcjonalnym domyślną wartością jest jedna spacja.", "Dodatkowe spacje tworzą nierówny rytm i widoczne luki w akapicie.", "Maszyny do pisania używały znaków o stałej szerokości, więc dodatkowe odstępy pomogły czytelnikom zobaczyć przerwy w zdaniach.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Szukaj powtarzających się spacji po znakach interpunkcyjnych.", "Przeprowadź szybkie czyszczenie przed udostępnieniem.", "Jeśli podwójne spacje są zamierzone, zachowaj ich spójność."]),
            (.straightQuotes, "Proste cudzysłowy to zwykłe znaki ASCII. Gotowy tekst zwykle czyta się lepiej, jeśli jest umieszczony w kierunkowych cudzysłowach.", "Kręcone cytaty wyglądają bardziej dopracowane i poprawiają wizualny rytm zdania.", "Wczesne klawiatury i zestawy znaków zawierały tylko jeden prosty cudzysłów dla obu kierunków.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Włącz inteligentną interpunkcję, jeśli jest dostępna.", "Wyczyść tekst wklejony ze źródeł zwykłego tekstu.", "Sprawdź pomiary, aby znaki podstawowe pozostały prawidłowe."]),
            (.hyphenAsDash, "Myślniki łączą wyrazy, ale nie zastępują myślników ani kresek.", "Prawidłowa myślnik poprawia ton, odstępy i czytelność.", "Podwójne łączniki były rozwiązaniem w systemach, w których nie można było łatwo uzyskać bogatej interpunkcji.", "He paused -- dramatically.", "He paused — dramatically.", ["Użyj prawdziwej kreski, jakiej wymaga Twój styl.", "Zachowaj łączniki w przypadku związków, a nie przerw w zdaniach.", "Zachowaj spójność w całym dokumencie."]),
            (.fakeEllipsis, "Trzy kropki mogą przypominać wielokropek, ale nie są tym samym znakiem.", "Prawdziwa elipsa ma zrównoważone odstępy i zachowuje się lepiej w wierszu tekstu.", "W wielu zwykłych procesach pisania nadal domyślnie wpisuje się trzy kropki.", "Wait...", "Wait…", ["Zastąp trzy kropki znakiem wielokropka.", "Użyj zamiany tekstu, jeśli często go piszesz.", "Sprawdź zaimportowaną kopię przed publikacją."]),
            (.widow, "Wdowa pozostawia jedno krótkie słowo w ostatnim wierszu akapitu.", "To słabe zakończenie zakłóca kształt i rytm akapitu.", "Wydawcy i projektanci od dawna dostosowywali podziały wierszy, aby uniknąć wdów w druku.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Doprecyzuj nieco zdanie lub przepisz je.", "Dostosuj długość linii, jeśli dostępne są narzędzia układu.", "Potraktuj to jako delikatną rekomendację."]),
            (.orphan, "Sierota to niewielka linia przeniesienia, która niezręcznie rozpoczyna nowy akapit lub blok tekstu.", "Przerywa to przepływ czytania i sprawia, że układ wydaje się mniej przemyślany.", "Przepływ pracy redakcyjnej tradycyjnie pomaga sierotom przed publikacją.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Przepisz pobliskie zdanie, aby zrównoważyć przerwę.", "Nieznacznie otwórz miarę, jeśli kontrolujesz układ.", "Użyj tego jako ostrzeżenia, a nie sztywnego błędu."]),
            (.inconsistentSpacing, "Łączenie pojedynczych i podwójnych odstępów w zdaniach sprawia wrażenie, że tekst jest połączony z różnymi źródłami.", "Czytelnicy szybko zauważają niespójności, nawet jeśli nie potrafią wyjaśnić dlaczego.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Wybierz jeden styl odstępów w zdaniach.", "Normalizuj wklejony tekst przed jego udostępnieniem.", "Zachowuj spójność wyboru od początku do końca."]),
            (.comicSans, "Comic Sans nie jest zabroniony, ale niesie ze sobą silny wydźwięk kulturowy, który często koliduje z poważnym tekstem.", "Czcionki komunikują nastrój, zanim czytelnik w ogóle przetworzy słowa.", "Comic Sans został zaprojektowany w 1994 r. dla interfejsu oprogramowania dla dzieci, a później rozprzestrzenił się daleko poza ten kontekst.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Wybierz krój pisma pasujący do przekazu.", "Zarezerwuj zabawne ekrany do pracy wyraźnie zabawnej.", "Wyłącz ten detektor, jeśli wybór jest zamierzony."]),
            (.primeMarks, "Miary takie jak stopy, cale, minuty i sekundy często wymagają symboli pierwszych, a nie cudzysłowów.", "Właściwy znak zapobiega dwuznacznościom i sprawia, że tekst techniczny wygląda na bardziej przemyślany.", nil, "5'11\"", "5′11″", ["Używaj symboli liczb pierwszych i podwójnych po cyfrach.", "Uważaj na automatyczną konwersję inteligentnych cytatów.", "Sprawdź dokładnie specyfikacje, menu i wymiary produktu."]),
            (.multiplicationSign, "Litera x i znak mnożenia nie są zamienne pod względem wymiarów.", "Zastosowanie × zapewnia kopiom technicznym i produktowym czystsze wykończenie typograficzne.", nil, "1920x1080", "1920×1080", ["Zamień x między liczbami na ×.", "Użyj zastępowania tekstu w przypadku popularnych formatów rozmiarów.", "Przejrzyj specyfikacje i zasoby marketingowe pod kątem spójności."]),
            (.trademarkSymbol, "Formy takie jak (c), (r) i (tm) są zapisem zastępczym, a nie dopracowaną wersją ostateczną.", "Właściwe symbole oszczędzają miejsce i sprawiają, że tekst prawny lub tekstowy wygląda na wykończony.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Zamień zapis zastępczy na ©, ® i ™.", "Sprawdź kopię prawną i marketingową przed wydaniem.", "Zachowaj spójne odstępy wokół tych symboli."])
        ])
    )

    static let ukrainianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Лабораторія злочинів
app.tab.case_files|Досьє
app.tab.learn|Навчіться
app.tab.settings|Налаштування
counts.crimes_categories|Злочини: %@ · Категорії: %@
counts.detected_issues|Виявлені проблеми: %@
counts.entries|Записи: %@
counts.characters|Символи: %@
counts.line_column|Рядок %@ · Стовпець %@
counts.crimes_verdict|Злочини: %@ · %@
share.offense_line|• %@: %@
general.done|Готово
general.cancel|Скасувати
general.retry|Повторити спробу
general.next|Далі
general.skip|Пропустити
general.got_it|Зрозуміло
general.coming_soon|Незабаром
general.wrong|Неправильно
general.right|Правильно
history.empty_title|Поки що немає випадків
history.empty_subtitle|Запустіть сканування, і ваші файли справи з’являться тут.
history.share|Поділитися
history.delete|Видалити
history.title|Досьє
history.today|СЬОГОДНІ
history.yesterday|УЧОРА
history.this_week|ЦЬОГО ТИЖНЯ
history.this_month|ЦЬОГО МІСЯЦЯ
history.select_all|Вибрати все
history.delete_selected|Видалити вибране
learn.title|Юридична бібліотека
learn.search_prompt|Пошук типів злочинів
learn.empty_title|Відповідних злочинів не знайдено
learn.empty_subtitle|Спробуйте інший пошуковий термін.
learn.what_is_this|Що це за проблема?
learn.why_it_matters|Чому це важливо
learn.history_origin|Історія та контекст
learn.how_to_fix|Як це виправити
learn.default_why|Хороша типографіка — це система продуманих деталей.
learn.default_fix|Використовуйте правильний символ і зберігайте документ послідовним.
input.method|Метод введення
input.method.paste|Вставити/ввести
input.method.camera|Камера (OCR)
input.placeholder|Вставте або введіть свій текст тут…
input.paste_from_clipboard|Вставити з буфера обміну
input.title|Надати докази
input.analyze|Аналіз
input.analyze_evidence|Аналізуйте докази
input.camera_message|Розпізнавання тексту за допомогою камери з’явиться в майбутньому оновленні. Наразі вставте або введіть текст для аналізу.
input.trimmed_warning|Текст скорочено до 100 000 символів.
input.clipboard_empty|Буфер обміну порожній. Спершу скопіюйте текст.
input.no_text|Немає тексту для аналізу. Спочатку вставте або введіть текст.
home.new_investigation|Нове розслідування
home.new_investigation_subtitle|Вставте або введіть текст, щоб розпочати судово-медичний аналіз типографіки
home.new_investigation_badge|ВСТАВИТИ · ТИПИТИ · АНАЛІЗУВАТИ
home.recent_cases|Останні випадки
home.see_all|Показати все →
home.empty_title|Ще немає випадків
home.empty_subtitle|Почніть своє перше дослідження.
home.begin_investigation|Почати розслідування
home.stat.scans|Сканування
home.stat.crimes|Злочини
home.stat.avg|Сер.
onboarding.splash_tagline|Кожен гліф є доказом.
onboarding.page1.title|Вставити. Аналізуйте. Огляд.
onboarding.page1.body|Додайте будь-який текст, і програма позначить типографські проблеми, які ховаються на видноті.
onboarding.page2.title|Ми вловлюємо те, що пропускає перевірка правопису
onboarding.page2.body|Тут відображаються прямі лапки, фальшиві три крапки, дефіси, що виглядають як тире, і непослідовні пробіли.
onboarding.page3.title|Отримайте свій рейтинг злочинності
onboarding.page3.body|Подивіться, наскільки чиста ваша типографіка, а потім поділіться своїм вердиктом.
onboarding.page4.title|Вчіться по ходу
onboarding.page4.body|Відкрийте будь-яку проблему, щоб дізнатися, чому вона має значення та як її вирішити.
onboarding.start|Почніть дослідження
onboarding.sample.not_em_dash|Без тире
onboarding.library.investigate|Розслідувати
onboarding.library.study|Вивчіть правила
analysis.failed_title|Помилка аналізу
analysis.failed_body|Під час сканування сталася помилка. Спробуйте ще раз.
analysis.status.scan|Сканування друкарських ознак…
analysis.status.quotes|Перевірка лапок…
analysis.status.dashes|Перевірка використання тире…
analysis.status.ellipsis|Перевірка еліпсів…
analysis.status.spacing|Перевірка узгодженості інтервалів…
analysis.status.layout|Перевірка вдів і сиріт…
analysis.status.comic_sans|Перевірка метаданих шрифту…
analysis.status.compiling|Складання звіту…
mugshot.title|Позначено за друкарські порушення
mugshot.body|Comic Sans знайдено в наданих доказах. У ігрових контекстах це може працювати, але в більшості продуктів і редакційних налаштувань це сприймається як невідповідність.
mugshot.continue|Відкрити повний звіт →
report.breakdown|Розклад злочинів
report.share|Поділитися звітом
report.new_scan|Нове сканування
report.close|Закрити звіт
report.copy_fixed|Копіювати фіксований текст
report.copy_fixed_hint|Копіює поточний виправлений текст.
report.clean_title|Чисто
report.clean_body|Типографічних проблем не виявлено. Цей текст є зразковим громадянином.
report.replace_single_space|Замінити одним пробілом
report.fixed_text_copied|Виправлено копіювання тексту ✓
report.manual_rewrite|Цю проблему потрібно переписати вручну.
report.apply_failed|Не вдалося застосувати це виправлення.
report.issue_fixed|Проблему виправлено та звіт оновлено ✓
report.learn_more|Докладніше про цю проблему →
settings.detection_rules|Правила виявлення
settings.scoring|Очки
settings.strictness|Суворість підрахунку балів
settings.dash_style|Стиль Em-dash
settings.appearance|Зовнішній вигляд
settings.theme|Тема
settings.haptics|Тактильний зворотний зв'язок
settings.sounds|Звукові ефекти
settings.data|Дані
settings.clear_all|Очистити всі файли справи
settings.export_all|Експортувати всі звіти
settings.about|Про
settings.version|Версія
settings.typpo|Typpo
settings.rate_app|Оцініть у App Store
settings.send_feedback|Надіслати відгук
settings.privacy|Політика конфіденційності
settings.footer|Зроблено обережно та з належними фігурними лапками.
settings.title|Налаштування
settings.clear_confirm_title|Очистити всі справи?
settings.clear_confirm_message|Цю дію неможливо скасувати.
settings.delete_all|Видалити все
settings.about_body|Криміналістичний аналіз вашого тексту. Вставте будь-який текст, отримайте свій бал і поділіться вердиктом.
settings.about_placeholder|Ця збірка повністю офлайн і все ще використовує посилання випуску заповнювачів для веб-сайту, політики конфіденційності та призначення App Store.
settings.about_website|Веб-сайт: %@
share.title|Поділитися звітом
share.copy_report_image|Копіювати зображення звіту
share.save_to_photos|Зберегти у фото
share.copy_report_text|Копіювати текст звіту
share.photos_needed|Потрібен доступ до фотографій
share.open_settings|Відкрийте налаштування
share.photos_message|Для збереження зображення звіту потрібен доступ до фотографій. Відкрийте налаштування, щоб надати доступ.
share.primary.share_text|Поділитися текстом
share.primary.copy_link|Копіювати посилання
share.primary.share|Поділитися
share.copied_clipboard|Скопійовано в буфер обміну ✓
share.deep_link_copied|Глибоке посилання скопійовано ✓
share.render_failed|Не вдалося відобразити зображення звіту.
share.saved_photos|Збережено у Фото ✓
share.save_failed|Не вдалося зберегти зображення звіту.
share.swipe_up|ВІДКРИТИ ПРОГРАМУ, ЩОБ АНАЛІЗУВАТИ ВЛАСНИЙ ТЕКСТ
share.report_heading|Звіт про типографіку
share.score_prefix|Оцінка
share.top_issues|Головні проблеми
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Ваш текст містить лише пробіли. Це не кримінально, але підозріло.
engine.non_latin_warning|Аналіз налаштовано для типографіки латинським шрифтом. Деякі правила пробілів і пунктуації можуть не застосовуватися до цієї системи письма.
engine.short_text_note|Виявлення вдів і сиріт менш надійне на дуже коротких проходах.
engine.fix.single_space|Використовуйте один пробіл після розділових знаків у кінці речення.
engine.fix.replace_with|Замінити на %@
engine.fix.normalize_spacing|Нормалізуйте інтервали між реченнями по всьому тексту.
engine.fix.rewrite_widow|Перепишіть або перекомпонуйте абзац, щоб уникнути останнього рядка з одного слова.
engine.fix.rewrite_orphan|Відкоригуйте найближчу копію, щоб уникнути крихітної перенесеної лінії.
engine.fix.change_font|Використовуйте більш відповідний шрифт.
engine.explain.double_space|Це речення закінчується декількома пробілами, умовність часів друкарської машинки, яка не належить до пропорційної типографіки.
engine.explain.straight_quotes|Ці лапки використовують пряму форму ASCII замість направлених фігурних лапок.
engine.explain.hyphen_dash|Це переривання використовує символи дефіс-мінус замість правильного тире.
engine.explain.fake_ellipsis|Цей ряд крапок слід замінити на три крапки.
engine.explain.inconsistent_spacing|Цей інтервал між реченнями відрізняється від домінуючого зразка в тексті.
engine.explain.widow|Абзац закінчується ізольованим словом останнього рядка, створюючи видиму вдову.
engine.explain.orphan|Цей абзац починається з дуже короткого рядка після довгого попереднього абзацу, який, ймовірно, читається як сирота.
engine.explain.comic_sans|У поданому форматованому тексті знайдено метадані Comic Sans.
engine.explain.prime_marks|Ця вимірювальна позначка використовує лапки ASCII замість належного простого символу.
engine.explain.multiplication_sign|У цьому розмірі використовується літера x, де має бути знак множення.
engine.explain.trademark_symbol|Цю резервну нотацію слід замінити відповідним символом.
category.punctuation|Проблеми з пунктуацією
category.spacing|Проблеми з інтервалами
category.layout|Проблеми з макетом
category.font|Проблеми зі шрифтом
category.symbol|Проблеми із символами
severity.infraction|ПОРУШЕННЯ
severity.misdemeanor|ПОРУШЕННЯ
severity.felony|ЗЛОЧИН
verdict.clean|ЧИСТО
verdict.infraction|ПОРУШЕННЯ
verdict.misdemeanor|ПОРУШЕННЯ
verdict.felony|ЗЛОЧИН
verdict.capital|ЗЛОПОЧИНУ, ЩО ЗАВЕРШУЄТЬСЯ СМЕРТОЮ
strictness.lenient|Поблажливий
strictness.standard|Стандарт
strictness.strict|Строго
theme.system|Система
theme.light|Світло
theme.dark|Темний
dash.spaced|Пробіл
dash.closed|Закрито
share_format.image|Зображення
share_format.story|Історія
share_format.landscape|Пейзаж
share_format.text|Простий текст
share_format.link|Копіювати посилання
share_format_desc.image|PNG зображення, оптимізоване для соціальних стрічок.
share_format_desc.story|Звіт 1080×1920, готовий до історії.
share_format_desc.landscape|Широка картка для попереднього перегляду статей і соціальних мереж.
share_format_desc.text|Форматований текстовий підсумок.
share_format_desc.link|Копія глибокого посилання заповнювача.
evidence_source.typed|Введено
evidence_source.pasted|Вставлено
evidence_source.pasted_rich|Вставлений форматований текст
toast.load_failed|Не вдалося завантажити збережені файли справи.
toast.save_failed|Не вдалося зберегти файл справи.
toast.delete_failed|Не вдалося видалити.
toast.cleared|Усі файли справи видалено.
toast.clear_failed|Не вдалося очистити файли справи.
toast.export_failed|Помилка експорту.
"""),
        verdictShortLabels: verdictMap("""
clean|ЧИСТО
infraction|ПОРУШЕННЯ
misdemeanor|ПОРУШЕННЯ
felony|ЗЛОЧИН
capitalOffense|ЗЛОПОЧИНУ, ЩО ЗАВЕРШУЄТЬСЯ СМЕРТОЮ
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Проблеми з пунктуацією
spacing|Проблеми з інтервалами
layout|Проблеми з макетом
font|Проблеми зі шрифтом
symbol|Проблеми із символами
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Подвійні пробіли
straightQuotes|Відверті цитати
hyphenAsDash|Дефіс як тире
fakeEllipsis|Фальшиві три крапки
widow|Вдови
orphan|Діти-сироти
inconsistentSpacing|Непослідовний інтервал
comicSans|Comic Sans
primeMarks|Основні оцінки
multiplicationSign|Неправильний знак множення
trademarkSymbol|Неправильне використання символу торгової марки
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Зайві пробіли після розділових знаків у кінці речення.
straightQuotes|ASCII лапки, які використовуються там, де фігурні лапки.
hyphenAsDash|Дефіси, які замінюють справжнє тире.
fakeEllipsis|Три крапки використовуються замість символу еліпсису.
widow|Останній рядок лише з одним коротким словом.
orphan|Маленький перенесений рядок на початку абзацу.
inconsistentSpacing|Змішані стилі інтервалів у реченнях в одному тексті.
comicSans|Comic Sans виявлено в наданих доказах.
primeMarks|ASCII лапки використовуються там, де є прості символи.
multiplicationSign|Літера x використовується замість ×.
trademarkSymbol|Резервна нотація, яка використовується замість ©, ® або ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Подвійні пробіли після речення походять від звички друкарської машинки. У сучасному пропорційному типі один пробіл є чистішим за замовчуванням.", "Зайві пробіли створюють нерівний ритм і видимі прогалини в абзаці.", "На друкарських машинках використовувалися символи фіксованої ширини, тому колись додаткові пробіли допомагали читачам бачити розриви речень.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Пошук повторюваних пробілів після пунктуації.", "Виконайте швидке очищення, перш ніж ділитися.", "Якщо подвійні пробіли створені навмисно, дотримуйтеся їх послідовності."]),
            (.straightQuotes, "Прямі лапки — це прості позначки ASCII. Завершений текст зазвичай краще читається, якщо взяти спрямовані фігурні лапки.", "Кучеряві лапки виглядають вишуканіше та покращують візуальний ритм речення.", "Ранні клавіатури та набори символів містили лише одну просту лапку для обох напрямків.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Увімкніть розумну пунктуацію, де це можливо.", "Очистити текст, вставлений із джерел звичайного тексту.", "Перевірте розміри, щоб основні позначки залишалися правильними."]),
            (.hyphenAsDash, "Дефіси поєднують слова, але вони не замінюють тире або тире.", "Правильне тире покращує тон, інтервали та читабельність.", "Подвійні дефіси були обхідним шляхом у системах, які не могли легко створити насичену пунктуацію.", "He paused -- dramatically.", "He paused — dramatically.", ["Використовуйте справжній тире, якого вимагає ваш стиль.", "Зберігайте дефіси для складних, а не розривів речень.", "Залишайтеся послідовними в усьому документі."]),
            (.fakeEllipsis, "Три крапки можуть імітувати три крапки, але це не той самий символ.", "Справжні три крапки мають збалансований інтервал і краще поводяться в рядку тексту.", "Багато повсякденних робочих процесів все ще за умовчанням вводять три крапки.", "Wait...", "Wait…", ["Замініть три крапки на три крапки.", "Використовуйте заміну тексту, якщо ви його часто вводите.", "Перевірте імпортовану копію перед публікацією."]),
            (.widow, "Вдова залишає одне коротке слово в останньому рядку абзацу.", "Ця слабка кінцівка порушує форму та ритм абзацу.", "Редактори та дизайнери давно відкоригували розриви рядків, щоб уникнути вдови під час друку.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Злегка затягніть або перепишіть речення.", "Відкоригуйте довжину лінії, якщо доступні інструменти компонування.", "Розглядайте це як рекомендацію щодо м’якого стилю."]),
            (.orphan, "Сіротка — це крихітний перенесений рядок, який незграбно починає новий абзац або текстовий блок.", "Це порушує потік читання та робить макет менш продуманим.", "Редакторські робочі процеси традиційно виправляють сироти перед публікацією.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Перепишіть сусідню фразу, щоб відновити баланс розриву.", "Злегка розкрийте міру, якщо ви контролюєте макет.", "Використовуйте це як попередження, а не як чітку помилку."]),
            (.inconsistentSpacing, "Змішування інтервалів між одним і двома реченнями створює враження, що текст з’єднано з різних джерел.", "Читач швидко помічає непослідовність, навіть якщо не може пояснити причину.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Виберіть один стиль інтервалів у реченнях.", "Нормалізуйте вставлений текст перед тим, як поділитися ним.", "Зберігайте вибір послідовним від початку до кінця."]),
            (.comicSans, "Comic Sans не заборонено, але він має сильний культурний тон, який часто суперечить серйозній копії.", "Шрифти передають настрій ще до того, як читач обробить слова.", "Comic Sans було розроблено в 1994 році для інтерфейсу дитячого програмного забезпечення, а потім поширилося далеко за межі цього контексту.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Виберіть шрифт, який відповідає повідомленню.", "Зарезервуйте грайливі циферблати для явно ігрової роботи.", "Вимкніть цей детектор, якщо вибір зроблено навмисно."]),
            (.primeMarks, "Такі вимірювання, як фути, дюйми, хвилини та секунди, часто потребують простих символів, а не лапок.", "Правильна позначка запобігає двозначності та робить технічний текст більш навмисним.", nil, "5'11\"", "5′11″", ["Використовуйте штрихи та подвійні штрихи після чисел.", "Стежте за автоматичним перетворенням розумних цитат.", "Уважно перевірте характеристики, меню та розміри продукту."]),
            (.multiplicationSign, "Літера x і знак множення не є взаємозамінними за розмірами.", "Використання × надає технічній копії та копії продукту чистішу друкарську обробку.", nil, "1920x1080", "1920×1080", ["Замініть x між числами на ×.", "Використовуйте заміну тексту для стандартних форматів розміру.", "Перегляньте специфікації та маркетингові активи на узгодженість."]),
            (.trademarkSymbol, "Такі форми, як (c), (r) і (tm), є резервною нотацією, а не відшліфованою остаточною копією.", "Правильні символи зберігають простір і надають юридичному або фірмовому тексту вигляд завершеного.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Замініть резервну нотацію на ©, ® і ™.", "Перевірте юридичну та маркетингову копію перед випуском.", "Зберігайте однакові інтервали навколо цих символів."])
        ])
    )

    static let swedishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Crime Lab
app.tab.case_files|Casefiler
app.tab.learn|Lär dig
app.tab.settings|Inställningar
counts.crimes_categories|Brott: %@ · Kategorier: %@
counts.detected_issues|Detekterade problem: %@
counts.entries|Inlägg: %@
counts.characters|Tecken: %@
counts.line_column|Linje %@ · Kol. %@
counts.crimes_verdict|Brott: %@ · %@
share.offense_line|• %@: %@
general.done|Klart
general.cancel|Avbryt
general.retry|Försök igen
general.next|Nästa
general.skip|Hoppa över
general.got_it|Förstår
general.coming_soon|Kommer snart
general.wrong|Fel
general.right|Höger
history.empty_title|Inga fall ännu
history.empty_subtitle|Kör en skanning och dina ärendefiler visas här.
history.share|Dela
history.delete|Ta bort
history.title|Casefiler
history.today|I DAG
history.yesterday|Igår
history.this_week|DENNA VECKA
history.this_month|DENNA MÅNAD
history.select_all|Välj alla
history.delete_selected|Ta bort markerade
learn.title|Juridikbiblioteket
learn.search_prompt|Sök brottstyper
learn.empty_title|Inga matchande brott hittades
learn.empty_subtitle|Testa en annan sökterm.
learn.what_is_this|Vad är det här problemet?
learn.why_it_matters|Varför det spelar roll
learn.history_origin|Historik och sammanhang
learn.how_to_fix|Hur man åtgärdar det
learn.default_why|Bra typografi är ett system av genomtänkta detaljer.
learn.default_fix|Använd rätt tecken och håll dokumentet konsekvent.
input.method|Inmatningsmetod
input.method.paste|Klistra in / skriv
input.method.camera|Kamera (OCR)
input.placeholder|Klistra in eller skriv din text här...
input.paste_from_clipboard|Klistra in från Urklipp
input.title|Skicka in bevis
input.analyze|Analysera
input.analyze_evidence|Analysera bevis
input.camera_message|Kamerabaserad textigenkänning kommer i en framtida uppdatering. För nu, klistra in eller skriv din text för att analysera.
input.trimmed_warning|Texten trimmades till 100 000 tecken.
input.clipboard_empty|Urklipp är tomt. Kopiera lite text först.
input.no_text|Ingen text att analysera. Klistra in eller skriv lite text först.
home.new_investigation|Ny undersökning
home.new_investigation_subtitle|Klistra in eller skriv text för att påbörja rättsmedicinsk typografianalys
home.new_investigation_badge|KLISTA IN · TYP · ANALYSE
home.recent_cases|Senaste fall
home.see_all|Se alla →
home.empty_title|Inga fall ännu
home.empty_subtitle|Starta din första undersökning.
home.begin_investigation|Börja undersökning
home.stat.scans|Sökningar
home.stat.crimes|Brott
home.stat.avg|Gen.
onboarding.splash_tagline|Varje glyf är bevis.
onboarding.page1.title|Klistra in. Analysera. Granska.
onboarding.page1.body|Släpp in valfri text så kommer appen att flagga typografiska problem som gömmer sig tydligt.
onboarding.page2.title|Vi fångar vad stavningskontrollen missar
onboarding.page2.body|Raka citattecken, falska ellipser, bindestreck som låtsas vara em-streck och inkonsekventa mellanrum visas här.
onboarding.page3.title|Få ditt brottsresultat
onboarding.page3.body|Se hur ren din typografi är och dela sedan domen.
onboarding.page4.title|Lär dig när du går
onboarding.page4.body|Öppna ett problem för att se varför det är viktigt och hur du åtgärdar det.
onboarding.start|Börja undersöka
onboarding.sample.not_em_dash|Inte ett streck
onboarding.library.investigate|Undersök
onboarding.library.study|Studera reglerna
analysis.failed_title|Analys misslyckades
analysis.failed_body|Något gick fel under skanningen. Försök igen.
analysis.status.scan|Söker efter typografiska bevis...
analysis.status.quotes|Kontrollerar citattecken...
analysis.status.dashes|Kontrollerar användning av bindestreck...
analysis.status.ellipsis|Kontrollerar ellipser...
analysis.status.spacing|Kontrollerar konsistensen mellan avståndet...
analysis.status.layout|Kontrollerar änkor och föräldralösa barn...
analysis.status.comic_sans|Kontrollerar teckensnittsmetadata...
analysis.status.compiling|Kompilerar rapport...
mugshot.title|Flaggat för typografiskt felaktigt uppförande
mugshot.body|Comic Sans hittades i det inlämnade beviset. I lekfulla sammanhang kan det fungera, men i de flesta produkt- och redaktionella sammanhang läses det som en missmatch.
mugshot.continue|Öppna hela rapporten →
report.breakdown|Brottsuppdelning
report.share|Dela rapport
report.new_scan|Ny skanning
report.close|Stäng rapport
report.copy_fixed|Kopiera fast text
report.copy_fixed_hint|Kopierar den aktuella korrigerade texten.
report.clean_title|Fläckfritt
report.clean_body|Inga typografiska problem upptäcktes. Den här texten är en mönstermedborgare.
report.replace_single_space|Ersätt med ett enda mellanslag
report.fixed_text_copied|Fast text kopierad ✓
report.manual_rewrite|Det här problemet behöver en manuell omskrivning.
report.apply_failed|Det gick inte att tillämpa denna korrigering.
report.issue_fixed|Problemet åtgärdat och rapporten uppdaterad ✓
report.learn_more|Läs mer om det här problemet →
settings.detection_rules|Detektionsregler
settings.scoring|Poäng
settings.strictness|Stänga poäng
settings.dash_style|Em-dash stil
settings.appearance|Utseende
settings.theme|Tema
settings.haptics|Haptisk feedback
settings.sounds|Ljudeffekter
settings.data|Data
settings.clear_all|Rensa alla ärendefiler
settings.export_all|Exportera alla rapporter
settings.about|Om
settings.version|Version
settings.typpo|Typpo
settings.rate_app|Betygsätt App Store
settings.send_feedback|Skicka feedback
settings.privacy|Sekretesspolicy
settings.footer|Gjord med omsorg och korrekta lockiga citat.
settings.title|Inställningar
settings.clear_confirm_title|Rensa alla ärenden?
settings.clear_confirm_message|Denna åtgärd kan inte ångras.
settings.delete_all|Ta bort alla
settings.about_body|Forensisk analys för din text. Klistra in valfri text, få din poäng och dela domen.
settings.about_placeholder|Denna version är helt offline och använder fortfarande platshållarlänkar för webbplatsen, integritetspolicyn och destinationen App Store.
settings.about_website|Webbplats: %@
share.title|Dela rapport
share.copy_report_image|Kopiera rapportbild
share.save_to_photos|Spara till foton
share.copy_report_text|Kopiera rapporttext
share.photos_needed|Fotoåtkomst behövs
share.open_settings|Öppna Inställningar
share.photos_message|Fotoåtkomst krävs för att spara rapportbilden. Öppna Inställningar för att ge åtkomst.
share.primary.share_text|Dela text
share.primary.copy_link|Kopiera länk
share.primary.share|Dela
share.copied_clipboard|Kopierat till urklipp ✓
share.deep_link_copied|Djuplänk kopierad ✓
share.render_failed|Det gick inte att rendera rapportbilden.
share.saved_photos|Sparat i foton ✓
share.save_failed|Det gick inte att spara rapportbilden.
share.swipe_up|ÖPPNA APPEN FÖR ATT ANALYSE DIN EGEN TEXT
share.report_heading|Typografirapport
share.score_prefix|Poäng
share.top_issues|De vanligaste problemen
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Din text innehåller endast blanksteg. Det är inte brottsligt, men det är misstänkt.
engine.non_latin_warning|Analysen är inställd för typografi med latinsk skrift. Vissa regler för mellanrum och skiljetecken kanske inte gäller för detta skrivsystem.
engine.short_text_note|Detektion av änkor och föräldralösa barn är mindre tillförlitlig på mycket korta passager.
engine.fix.single_space|Använd ett enda blanksteg efter meningsslutande skiljetecken.
engine.fix.replace_with|Ersätt med %@
engine.fix.normalize_spacing|Normalisera meningsavstånd genom hela texten.
engine.fix.rewrite_widow|Skriv om eller flöda om stycket för att undvika en sista rad på ett ord.
engine.fix.rewrite_orphan|Justera närliggande kopia för att undvika en liten överföringsrad.
engine.fix.change_font|Använd ett mer passande typsnitt.
engine.explain.double_space|Denna mening slutar med flera mellanslag, en konvention från skrivmaskinstiden som inte hör hemma i proportionell typografi.
engine.explain.straight_quotes|Detta citattecken använder den raka ASCII-formen istället för riktade krulliga citattecken.
engine.explain.hyphen_dash|Det här avbrottet använder bindestreck-minus-tecken istället för ett korrekt bindestreck.
engine.explain.fake_ellipsis|Denna perioder bör ersättas med ellipstecknet.
engine.explain.inconsistent_spacing|Detta meningsavstånd skiljer sig från det dominerande mönstret i texten.
engine.explain.widow|Stycket avslutas med ett isolerat ord på sista raden, vilket skapar en synlig änka.
engine.explain.orphan|Detta stycke börjar med en mycket kort rad efter ett långt föregående stycke, som troligen läses som ett föräldralöst stycke.
engine.explain.comic_sans|Comic Sans metadata hittades i den inskickade rich text.
engine.explain.prime_marks|Detta mätmärke använder ett ASCII-citattecken istället för en riktig primtalssymbol.
engine.explain.multiplication_sign|Denna dimension använder bokstaven x där multiplikationstecknet ska visas.
engine.explain.trademark_symbol|Denna reservnotation bör ersättas med rätt symbol.
category.punctuation|Teckensättningsproblem
category.spacing|Avståndsproblem
category.layout|Layoutproblem
category.font|Teckensnittsproblem
category.symbol|Symbolproblem
severity.infraction|INFRAKTION
severity.misdemeanor|FÖRSÄTTELSE
severity.felony|BROTT
verdict.clean|RENA
verdict.infraction|INFRAKTION
verdict.misdemeanor|FÖRSÄTTELSE
verdict.felony|BROTT
verdict.capital|KAPITALBROTT
strictness.lenient|Livlig
strictness.standard|Standard
strictness.strict|Strikt
theme.system|System
theme.light|Ljus
theme.dark|Mörkt
dash.spaced|mellanrum
dash.closed|Stängt
share_format.image|Bild
share_format.story|Berättelse
share_format.landscape|Landskap
share_format.text|Oformaterad text
share_format.link|Kopiera länk
share_format_desc.image|PNG bild optimerad för sociala flöden.
share_format_desc.story|1080×1920 story-ready rapport.
share_format_desc.landscape|Brett kort för artiklar och sociala förhandsgranskningar.
share_format_desc.text|Formaterad textsammanfattning.
share_format_desc.link|Platshållarens djuplänkskopia.
evidence_source.typed|Skrivt
evidence_source.pasted|Klistrat in
evidence_source.pasted_rich|Klistrade in Rich Text
toast.load_failed|Det gick inte att ladda sparade ärendefiler.
toast.save_failed|Det gick inte att spara ärendet.
toast.delete_failed|Raderingen misslyckades.
toast.cleared|Alla ärendefiler har rensats.
toast.clear_failed|Det gick inte att rensa ärendefiler.
toast.export_failed|Export misslyckades.
"""),
        verdictShortLabels: verdictMap("""
clean|RENA
infraction|INFRAKTION
misdemeanor|FÖRSÄTTELSE
felony|BROTT
capitalOffense|KAPITALBROTT
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Teckensättningsproblem
spacing|Avståndsproblem
layout|Layoutproblem
font|Teckensnittsproblem
symbol|Symbolproblem
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dubbla mellanslag
straightQuotes|Raka citat
hyphenAsDash|Beststreck som bindestreck
fakeEllipsis|Falsk ellips
widow|Änkor
orphan|Föräldralösa barn
inconsistentSpacing|Inkonsekvent mellanrum
comicSans|Comic Sans
primeMarks|Primemärken
multiplicationSign|Fel multiplikationstecken
trademarkSymbol|Misbruk av varumärkessymbol
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Extra mellanslag efter meningsslutande skiljetecken.
straightQuotes|ASCII citattecken används där lockiga citattecken hör hemma.
hyphenAsDash|Beststreck står för ett riktigt streck.
fakeEllipsis|Tre punkter används istället för ellipstecknet.
widow|En sista rad kvar med bara ett kort ord.
orphan|En liten överföringsrad i början av ett stycke.
inconsistentSpacing|Blandade meningsavståndsstilar i en text.
comicSans|Comic Sans upptäcktes i de inlämnade bevisen.
primeMarks|ASCII citattecken används där primtalssymboler hör hemma.
multiplicationSign|Bokstaven x används istället för ×.
trademarkSymbol|Reservnotation används istället för ©, ® eller ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Dubbla mellanslag efter en mening kommer från skrivmaskinsvanor. I modern proportionell typ är ett blanksteg den renare standardinställningen.", "Extra mellanslag skapar ojämn rytm och synliga luckor i ett stycke.", "Skrivmaskiner använde tecken med fast bredd, så extra mellanrum hjälpte läsarna att se meningsbrytningar en gång.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Sök efter upprepade mellanslag efter skiljetecken.", "Kör ett snabbt städpass innan du delar.", "Om dubbla mellanslag är avsiktliga, håll dem konsekventa."]),
            (.straightQuotes, "Raka citattecken är vanliga ASCII-tecken. Färdig text läser vanligtvis bättre med riktade lockiga citattecken.", "Kulliga citattecken ser mer polerade ut och förbättrar den visuella rytmen i en mening.", "Tidiga tangentbord och teckenuppsättningar hade bara ett enkelt citattecken för båda riktningarna.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Aktivera smart interpunktion där det är tillgängligt.", "Rensa upp text som klistrats in från källor med vanlig text.", "Kontrollera måtten så att primtecken förblir korrekta."]),
            (.hyphenAsDash, "Beststreck sammanfogar ord, men de ersätter inte em-streck eller en-streck.", "Rätt bindestreck förbättrar ton, avstånd och läsbarhet.", "Dubbla bindestreck var en lösning i system som inte lätt kunde producera rika skiljetecken.", "He paused -- dramatically.", "He paused — dramatically.", ["Använd den riktiga strecktecken som din stil kräver.", "Behåll bindestreck för sammansättningar, inte meningsbrytningar.", "Var konsekvent över hela dokumentet."]),
            (.fakeEllipsis, "Tre punkter kan härma en ellips, men de är inte samma karaktär.", "En riktig ellips har balanserat mellanrum och beter sig bättre i en textrad.", "Många tillfälliga skrivarbetsflöden använder fortfarande tre punkter som standard.", "Wait...", "Wait…", ["Ersätt tre punkter med ellipstecknet.", "Använd textersättning om du skriver det ofta.", "Kontrollera importerad kopia innan publicering."]),
            (.widow, "En änka lämnar ett kort ord kvar på den sista raden i ett stycke.", "Det där svaga slutet stör styckets form och rytm.", "Redaktörer och designers har långa anpassade radbrytningar för att undvika änkor i tryck.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Skärp eller skriv om meningen något.", "Justera radlängden om layoutverktyg är tillgängliga.", "Behandla detta som en mjuk stilrekommendation."]),
            (.orphan, "Ett föräldralöst barn är en liten överföringsrad som börjar ett nytt stycke eller ett nytt textblock obekvämt.", "Det bryter läsflödet och gör att layouten känns mindre övervägd.", "Redaktionella arbetsflöden fixar traditionellt föräldralösa barn före publicering.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Skriv om en närliggande fras för att återbalansera pausen.", "Öppna måttet något om du kontrollerar layouten.", "Använd det som en varning, inte som ett stelfel."]),
            (.inconsistentSpacing, "Att blanda enkla och dubbla meningsavstånd gör att texten känns sammanfogad från olika källor.", "Läsare märker snabbt inkonsekvens, även när de inte kan förklara varför.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Välj en stil med meningsavstånd.", "Normalisera inklistrad text innan du delar den.", "Håll valet konsekvent från början till slut."]),
            (.comicSans, "Comic Sans är inte förbjudet, men det har en stark kulturell ton som ofta krockar med seriös kopia.", "Teckensnitt kommunicerar humör innan en läsare ens bearbetar orden.", "Comic Sans designades 1994 för ett programvarugränssnitt för barn och spreds senare långt utanför det sammanhanget.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Välj ett typsnitt som passar meddelandet.", "Reservera lekfulla ansikten för tydligt lekfullt arbete.", "Inaktivera den här detektorn om valet är avsiktligt."]),
            (.primeMarks, "Mått som fot, tum, minuter och sekunder behöver ofta primtalssymboler snarare än citattecken.", "Rätt märke förhindrar otydlighet och gör att teknisk text ser mer avsiktlig ut.", nil, "5'11\"", "5′11″", ["Använd prim- och dubbla primtalssymboler efter siffror.", "Se efter automatisk konvertering av smarta offerter.", "Kontrollera specifikationer, menyer och produktdimensioner noggrant."]),
            (.multiplicationSign, "Bokstaven x och multiplikationstecknet är inte utbytbara i dimensioner.", "Att använda × ger teknisk kopia och produktkopia en renare typografisk finish.", nil, "1920x1080", "1920×1080", ["Ersätt x mellan siffror med ×.", "Använd textersättning för vanliga storleksformat.", "Granska specifikationer och marknadsföringstillgångar för konsekvens."]),
            (.trademarkSymbol, "Formater som (c), (r) och (tm) är reservnotation, inte polerad slutlig kopia.", "Rätta symboler sparar utrymme och får juridisk eller varumärkestext att se färdig ut.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Ersätt reservnotation med ©, ® och ™.", "Kontrollera juridiska och marknadsföringsmässiga kopior innan release.", "Håll avståndet runt dessa symboler konsekvent."])
        ])
    )

    static let norwegianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Crime Lab
app.tab.case_files|Saksfiler
app.tab.learn|Lær
app.tab.settings|Innstillinger
counts.crimes_categories|Forbrytelser: %@ · Kategorier: %@
counts.detected_issues|Oppdagede problemer: %@
counts.entries|Oppføringer: %@
counts.characters|Tegn: %@
counts.line_column|Linje %@ · Kol. %@
counts.crimes_verdict|Forbrytelser: %@ · %@
share.offense_line|• %@: %@
general.done|Ferdig
general.cancel|Avbryt
general.retry|Prøv på nytt
general.next|Neste
general.skip|Hopp over
general.got_it|Skjønner det
general.coming_soon|Kommer snart
general.wrong|Feil
general.right|Høyre
history.empty_title|Ingen saker ennå
history.empty_subtitle|Kjør en skanning og saksfilene dine vises her.
history.share|Del
history.delete|Slett
history.title|Saksfiler
history.today|I DAG
history.yesterday|I GÅR
history.this_week|DENNE UKEN
history.this_month|DENNE MÅNEDEN
history.select_all|Velg alle
history.delete_selected|Slett valgte
learn.title|Jussbiblioteket
learn.search_prompt|Søk etter kriminalitetstyper
learn.empty_title|Ingen samsvarende forbrytelser funnet
learn.empty_subtitle|Prøv et annet søkeord.
learn.what_is_this|Hva er dette problemet?
learn.why_it_matters|Hvorfor det betyr noe
learn.history_origin|Historie og kontekst
learn.how_to_fix|Hvordan fikser du det
learn.default_why|God typografi er et system med gjennomtenkte detaljer.
learn.default_fix|Bruk riktig tegn og hold dokumentet konsistent.
input.method|Inndatametode
input.method.paste|Lim inn / skriv inn
input.method.camera|Kamera (OCR)
input.placeholder|Lim inn eller skriv inn teksten din her...
input.paste_from_clipboard|Lim inn fra utklippstavlen
input.title|Send inn bevis
input.analyze|Analyser
input.analyze_evidence|Analyser bevis
input.camera_message|Kamerabasert tekstgjenkjenning kommer i en fremtidig oppdatering. For nå, lim inn eller skriv inn teksten din for å analysere.
input.trimmed_warning|Teksten ble trimmet til 100 000 tegn.
input.clipboard_empty|Utklippstavlen er tom. Kopier litt tekst først.
input.no_text|Ingen tekst å analysere. Lim inn eller skriv inn tekst først.
home.new_investigation|Ny undersøkelse
home.new_investigation_subtitle|Lim inn eller skriv inn tekst for å starte rettsmedisinsk typografianalyse
home.new_investigation_badge|LIM · TYP · ANALYSER
home.recent_cases|Nylige tilfeller
home.see_all|Se alle →
home.empty_title|Ingen saker ennå
home.empty_subtitle|Start din første undersøkelse.
home.begin_investigation|Begynn undersøkelsen
home.stat.scans|Skanninger
home.stat.crimes|Forbrytelser
home.stat.avg|Gjennomsnitt
onboarding.splash_tagline|Hver glyph er bevis.
onboarding.page1.title|Lim inn. Analysere. Gjennomgå.
onboarding.page1.body|Skriv inn hvilken som helst tekst, og appen vil flagge typografiske problemer som skjuler seg lett synlig.
onboarding.page2.title|Vi fanger hva stavekontrollen går glipp av
onboarding.page2.body|Rete anførselstegn, falske ellipser, bindestreker som utgir seg for å være em-bindestreker og inkonsekvent mellomrom vises her.
onboarding.page3.title|Få kriminalitetspoeng
onboarding.page3.body|Se hvor ren typografien din er, og del deretter dommen.
onboarding.page4.title|Lær mens du går
onboarding.page4.body|Åpne ethvert problem for å se hvorfor det er viktig og hvordan du kan fikse det.
onboarding.start|Begynn å undersøke
onboarding.sample.not_em_dash|Ikke et bindestrek
onboarding.library.investigate|Undersøk
onboarding.library.study|Studer reglene
analysis.failed_title|Analyse mislyktes
analysis.failed_body|Noe gikk galt under skanningen. Vennligst prøv igjen.
analysis.status.scan|Søker etter typografiske bevis...
analysis.status.quotes|Sjekker anførselstegn...
analysis.status.dashes|Sjekker bindestrekbruk...
analysis.status.ellipsis|Sjekker ellipser...
analysis.status.spacing|Sjekker konsistensen av mellomrom...
analysis.status.layout|Sjekker enker og foreldreløse barn...
analysis.status.comic_sans|Sjekker skriftmetadata...
analysis.status.compiling|Sammenstiller rapport...
mugshot.title|Flagget for typografisk uredelighet
mugshot.body|Comic Sans ble funnet i det innsendte beviset. I lekne sammenhenger kan det fungere, men i de fleste produkt- og redaksjonelle miljøer kan det leses som en mismatch.
mugshot.continue|Åpne hele rapporten →
report.breakdown|Kriminalitetssammenbrudd
report.share|Del rapport
report.new_scan|Ny skanning
report.close|Lukk rapport
report.copy_fixed|Kopier fast tekst
report.copy_fixed_hint|Kopierer gjeldende korrigerte tekst.
report.clean_title|Plettfrie
report.clean_body|Ingen typografiske problemer ble oppdaget. Denne teksten er en mønsterborger.
report.replace_single_space|Erstatt med ett enkelt mellomrom
report.fixed_text_copied|Fast tekst kopiert ✓
report.manual_rewrite|Dette problemet må omskrives manuelt.
report.apply_failed|Kunne ikke bruke denne løsningen.
report.issue_fixed|Problem løst og rapport oppdatert ✓
report.learn_more|Les mer om dette problemet →
settings.detection_rules|Deteksjonsregler
settings.scoring|Scoring
settings.strictness|Skåringsstrenghet
settings.dash_style|Em-dash-stil
settings.appearance|Utseende
settings.theme|Tema
settings.haptics|Haptisk tilbakemelding
settings.sounds|Lydeffekter
settings.data|Data
settings.clear_all|Slett alle saksfiler
settings.export_all|Eksporter alle rapporter
settings.about|Om
settings.version|Versjon
settings.typpo|Typpo
settings.rate_app|Vurder på App Store
settings.send_feedback|Send tilbakemelding
settings.privacy|Personvernregler
settings.footer|Laget med omhu og riktige krøllete sitater.
settings.title|Innstillinger
settings.clear_confirm_title|Vil du slette alle saksfiler?
settings.clear_confirm_message|Denne handlingen kan ikke angres.
settings.delete_all|Slett alle
settings.about_body|Rettsmedisinsk analyse for teksten din. Lim inn hvilken som helst tekst, få poengsummen din og del dommen.
settings.about_placeholder|Denne versjonen er helt offline og bruker fortsatt plassholderutgivelseskoblinger for nettstedet, personvernreglene og App Store-destinasjonen.
settings.about_website|Nettsted: %@
share.title|Del rapport
share.copy_report_image|Kopier rapportbilde
share.save_to_photos|Lagre i bilder
share.copy_report_text|Kopier rapporttekst
share.photos_needed|Fototilgang er nødvendig
share.open_settings|Åpne Innstillinger
share.photos_message|Fototilgang er nødvendig for å lagre rapportbildet. Åpne Innstillinger for å gi tilgang.
share.primary.share_text|Del tekst
share.primary.copy_link|Kopier lenke
share.primary.share|Del
share.copied_clipboard|Kopiert til utklippstavlen ✓
share.deep_link_copied|Dyplink kopiert ✓
share.render_failed|Kunne ikke gjengi rapportbildet.
share.saved_photos|Lagret i bilder ✓
share.save_failed|Kunne ikke lagre rapportbildet.
share.swipe_up|ÅPNE APPEN FOR AT ANALYSE DIN EGEN TEKST
share.report_heading|Typografirapport
share.score_prefix|Poengsum
share.top_issues|Toppproblemer
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Teksten din inneholder bare mellomrom. Det er ikke kriminelt, men det er mistenkelig.
engine.non_latin_warning|Analyse er innstilt for latinsk typografi. Noen regler for mellomrom og tegnsetting gjelder kanskje ikke for dette skrivesystemet.
engine.short_text_note|Deteksjon av enker og foreldreløse barn er mindre pålitelig på svært korte passasjer.
engine.fix.single_space|Bruk ett enkelt mellomrom etter tegnsetting som avslutter setningen.
engine.fix.replace_with|Erstatt med %@
engine.fix.normalize_spacing|Normaliser setningsavstanden gjennom hele teksten.
engine.fix.rewrite_widow|Skriv om eller flyt avsnittet om for å unngå en siste linje på ett ord.
engine.fix.rewrite_orphan|Juster kopien i nærheten for å unngå en liten overføringslinje.
engine.fix.change_font|Bruk en mer passende font.
engine.explain.double_space|Denne setningen avsluttes med flere mellomrom, en konvensjon fra skrivemaskintiden som ikke hører hjemme i proporsjonal typografi.
engine.explain.straight_quotes|Dette anførselstegnet bruker den rette ASCII-formen i stedet for retningsbestemte anførselstegn.
engine.explain.hyphen_dash|Dette avbruddet bruker bindestrek-minus-tegn i stedet for en skikkelig bindestrek.
engine.explain.fake_ellipsis|Denne perioden bør erstattes med ellipsetegnet.
engine.explain.inconsistent_spacing|Denne setningsavstanden skiller seg fra det dominerende mønsteret i teksten.
engine.explain.widow|Avsnittet avsluttes med et isolert ord på siste linje, og skaper en synlig enke.
engine.explain.orphan|Dette avsnittet starter med en veldig kort linje etter et langt foregående avsnitt, som sannsynligvis leses som et foreldreløst avsnitt.
engine.explain.comic_sans|Comic Sans metadata ble funnet i den innsendte rike teksten.
engine.explain.prime_marks|Dette målemerket bruker et ASCII-anførselstegn i stedet for et riktig primtallssymbol.
engine.explain.multiplication_sign|Denne dimensjonen bruker bokstaven x der multiplikasjonstegnet skal vises.
engine.explain.trademark_symbol|Denne reservenotasjonen bør erstattes med det riktige symbolet.
category.punctuation|Tekkesettingsproblemer
category.spacing|Space-problemer
category.layout|Layoutproblemer
category.font|Skriftproblemer
category.symbol|Symbolproblemer
severity.infraction|INFRAKTION
severity.misdemeanor|FEIL
severity.felony|FORBRUK
verdict.clean|RENGJØR
verdict.infraction|INFRAKSJON
verdict.misdemeanor|FEIL
verdict.felony|FORBRUK
verdict.capital|KAPITALKRETTELSE
strictness.lenient|Ledsom
strictness.standard|Standard
strictness.strict|Streng
theme.system|System
theme.light|Lys
theme.dark|Mørkt
dash.spaced|mellomrom
dash.closed|Stengt
share_format.image|Bilde
share_format.story|Historie
share_format.landscape|Landskap
share_format.text|Ren tekst
share_format.link|Kopier lenke
share_format_desc.image|PNG bilde optimalisert for sosiale innmatinger.
share_format_desc.story|1080×1920 historieklar rapport.
share_format_desc.landscape|Bredt kort for artikler og sosiale forhåndsvisninger.
share_format_desc.text|Formatert tekstsammendrag.
share_format_desc.link|Dyplinkkopi for plassholder.
evidence_source.typed|Skrevet
evidence_source.pasted|Lim inn
evidence_source.pasted_rich|Lim inn rik tekst
toast.load_failed|Kunne ikke laste inn lagrede saksfiler.
toast.save_failed|Kunne ikke lagre saksfilen.
toast.delete_failed|Sletting mislyktes.
toast.cleared|Alle saksfiler er slettet.
toast.clear_failed|Kunne ikke slette saksfiler.
toast.export_failed|Eksporten mislyktes.
"""),
        verdictShortLabels: verdictMap("""
clean|RENGJØR
infraction|INFRAKSJON
misdemeanor|FEIL
felony|FORBRUK
capitalOffense|KAPITALKRETTELSE
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Tekkesettingsproblemer
spacing|Space-problemer
layout|Layoutproblemer
font|Skriftproblemer
symbol|Symbolproblemer
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dobbeltrom
straightQuotes|Rete sitater
hyphenAsDash|Beststrek som bindestrek
fakeEllipsis|Falske ellipsis
widow|Enker
orphan|Foreldreløse
inconsistentSpacing|Inkonsekvent mellomrom
comicSans|Comic Sans
primeMarks|Primemerker
multiplicationSign|Feil multiplikasjonstegn
trademarkSymbol|Misbruk av varemerkesymbol
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Ekstra mellomrom etter setningsavslutning.
straightQuotes|ASCII anførselstegn brukt der krøllete anførselstegn hører hjemme.
hyphenAsDash|Binnestreker som står for en skikkelig strek.
fakeEllipsis|Tre punktum brukt i stedet for ellipsetegnet.
widow|En siste linje igjen med bare ett kort ord.
orphan|En liten overføringslinje i begynnelsen av et avsnitt.
inconsistentSpacing|Blandede setningsavstandsstiler i én tekst.
comicSans|Comic Sans oppdaget i det innsendte beviset.
primeMarks|ASCII anførselstegn brukt der primtallssymboler hører hjemme.
multiplicationSign|Bokstaven x brukt i stedet for ×.
trademarkSymbol|Reparasjonsnotasjon brukes i stedet for ©, ® eller ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Doble mellomrom etter en setning kommer fra skrivemaskinvaner. I moderne proporsjonal type er ett mellomrom standard for renere.", "Ekstra mellomrom skaper ujevn rytme og synlige hull i et avsnitt.", "Skrivemaskiner brukte tegn med fast bredde, så ekstra mellomrom hjalp leserne en gang med å se setningsskift.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Søk etter gjentatte mellomrom etter tegnsetting.", "Kjør et raskt opprydningspass før du deler.", "Hvis doble mellomrom er tilsiktet, hold dem konsekvente."]),
            (.straightQuotes, "Rete anførselstegn er vanlige ASCII-tegn. Ferdig tekst leses vanligvis bedre med retningsbestemte krøllete anførselstegn.", "Krøllete sitater ser mer polerte ut og forbedrer den visuelle rytmen til en setning.", "Tidlige tastaturer og tegnsett holdt bare ett enkelt anførselstegn for begge retninger.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Slå på smart tegnsetting der det er tilgjengelig.", "Rydd opp i tekst som er limt inn fra kilder med ren tekst.", "Sjekk målene slik at prime merker forblir korrekte."]),
            (.hyphenAsDash, "Beststreker slår sammen ord, men de er ikke erstatninger for em-bindestreker eller en-bindestreker.", "Riktig bindestrek forbedrer tone, avstand og lesbarhet.", "Doble bindestreker var en løsning i systemer som ikke lett kunne produsere rike tegnsetting.", "He paused -- dramatically.", "He paused — dramatically.", ["Bruk den virkelige strekkarakteren stilen din krever.", "Behold bindestreker for sammensetninger, ikke setningsskift.", "Hold deg konsekvent på tvers av hele dokumentet."]),
            (.fakeEllipsis, "Tre punktum kan etterligne en ellipse, men de er ikke samme karakter.", "En ekte ellipse har balansert avstand og oppfører seg bedre i en tekstlinje.", "Mange tilfeldige skrivearbeidsflyter er fortsatt standard til å skrive tre punktum.", "Wait...", "Wait…", ["Erstatt tre punktum med ellipsetegnet.", "Bruk teksterstatning hvis du skriver det ofte.", "Sjekk importert kopi før publisering."]),
            (.widow, "En enke legger igjen ett kort ord på den siste linjen i et avsnitt.", "Den svake avslutningen forstyrrer formen og rytmen til avsnittet.", "Redaktører og designere har lenge justert linjeskift for å unngå enker på trykk.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Stram eller omskriv setningen litt.", "Juster linjelengden hvis layoutverktøy er tilgjengelig.", "Behandle dette som en myk stilanbefaling."]),
            (.orphan, "Et foreldreløst barn er en liten overføringslinje som starter et nytt avsnitt eller en tekstblokk vanskelig.", "Det bryter leseflyten og gjør at oppsettet føles mindre vurdert.", "Redaksjonelle arbeidsflyter fikser tradisjonelt foreldreløse barn før publisering.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Skriv om en nærliggende setning for å balansere pausen på nytt.", "Åpne målet litt hvis du kontrollerer layout.", "Bruk det som en advarsel, ikke en streng feil."]),
            (.inconsistentSpacing, "Blanding av enkelt og dobbel setningsavstand gjør at teksten føles sammenføyd fra forskjellige kilder.", "Leserne merker raskt inkonsekvens, selv når de ikke kan forklare hvorfor.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Velg én stil med setningsavstand.", "Normaliser innlimt tekst før du deler den.", "Hold valget konsekvent fra start til slutt."]),
            (.comicSans, "Comic Sans er ikke forbudt, men den har en sterk kulturell tone som ofte kolliderer med seriøs kopi.", "Skrifter kommuniserer stemning før en leser i det hele tatt behandler ordene.", "Comic Sans ble designet i 1994 for et programvaregrensesnitt for barn og spredte seg senere langt utenfor denne konteksten.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Velg en skrifttype som passer til meldingen.", "Reserver lekne ansikter for tydelig lekent arbeid.", "Deaktiver denne detektoren hvis valget er med vilje."]),
            (.primeMarks, "Mål som fot, tommer, minutter og sekunder trenger ofte primtallssymboler i stedet for anførselstegn.", "Riktig merke forhindrer tvetydighet og får teknisk tekst til å se mer bevisst ut.", nil, "5'11\"", "5′11″", ["Bruk primtalls- og doble primtallssymboler etter tall.", "Se etter automatisk konvertering av smarte tilbud.", "Sjekk spesifikasjoner, menyer og produktdimensjoner nøye."]),
            (.multiplicationSign, "Bokstaven x og multiplikasjonstegnet er ikke utskiftbare i dimensjoner.", "Å bruke × gir teknisk kopi og produktkopi en renere typografisk finish.", nil, "1920x1080", "1920×1080", ["Erstatt x mellom tall med ×.", "Bruk teksterstatning for vanlige størrelsesformater.", "Gjennomgå spesifikasjoner og markedsføringselementer for konsistens."]),
            (.trademarkSymbol, "Skjemaer som (c), (r) og (tm) er reservenotasjon, ikke polert endelig kopi.", "De riktige symbolene sparer plass og får juridisk tekst eller merketekst til å se ferdig ut.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Erstatt reservenotasjon med ©, ® og ™.", "Sjekk juridisk og markedsføringsmessig kopi før utgivelse.", "Hold avstanden rundt disse symbolene konsekvent."])
        ])
    )

    static let danishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Crime Lab
app.tab.case_files|Sagsfiler
app.tab.learn|Lær
app.tab.settings|Indstillinger
counts.crimes_categories|Forbrydelser: %@ · Kategorier: %@
counts.detected_issues|Opdagede problemer: %@
counts.entries|Indgange: %@
counts.characters|Tegn: %@
counts.line_column|Linje %@ · Kol. %@
counts.crimes_verdict|Forbrydelser: %@ · %@
share.offense_line|• %@: %@
general.done|Udført
general.cancel|Annuller
general.retry|Prøv igen
general.next|Næste
general.skip|Spring over
general.got_it|Forstår det
general.coming_soon|Kommer snart
general.wrong|Forkert
general.right|Højt
history.empty_title|Ingen sager endnu
history.empty_subtitle|Kør en scanning, og dine sagsakter vil blive vist her.
history.share|Del
history.delete|Slet
history.title|Sagsfiler
history.today|I DAG
history.yesterday|IGÅR
history.this_week|DENNE UGE
history.this_month|DENNE MÅNED
history.select_all|Vælg alle
history.delete_selected|Slet valgte
learn.title|The Law Library
learn.search_prompt|Søg efter kriminalitetstyper
learn.empty_title|Ingen matchende forbrydelser fundet
learn.empty_subtitle|Prøv en anden søgeterm.
learn.what_is_this|Hvad er dette problem?
learn.why_it_matters|Hvorfor det betyder noget
learn.history_origin|Historie og kontekst
learn.how_to_fix|Sådan løser du det
learn.default_why|God typografi er et system af gennemtænkte detaljer.
learn.default_fix|Brug det korrekte tegn og hold dokumentet konsekvent.
input.method|Inputmetode
input.method.paste|Indsæt/skriv
input.method.camera|Kamera (OCR)
input.placeholder|Indsæt eller skriv din tekst her...
input.paste_from_clipboard|Indsæt fra udklipsholder
input.title|Indsend bevis
input.analyze|Analyser
input.analyze_evidence|Analyser beviser
input.camera_message|Kamerabaseret tekstgenkendelse kommer i en fremtidig opdatering. Indtil nu, indsæt eller skriv din tekst for at analysere.
input.trimmed_warning|Teksten blev beskåret til 100.000 tegn.
input.clipboard_empty|Udklipsholderen er tom. Kopier noget tekst først.
input.no_text|Ingen tekst at analysere. Indsæt eller skriv noget tekst først.
home.new_investigation|Ny undersøgelse
home.new_investigation_subtitle|Indsæt eller skriv tekst for at begynde retsmedicinsk typografianalyse
home.new_investigation_badge|INDSÆT · TYP · ANALYSER
home.recent_cases|Seneste tilfælde
home.see_all|Se alle →
home.empty_title|Ingen sager endnu
home.empty_subtitle|Start din første undersøgelse.
home.begin_investigation|Begynd undersøgelse
home.stat.scans|Scanninger
home.stat.crimes|Forbrydelser
home.stat.avg|Gns.
onboarding.splash_tagline|Hver glyf er bevis.
onboarding.page1.title|Sæt ind. Analysere. Gennemgå.
onboarding.page1.body|Skriv en hvilken som helst tekst, og appen vil markere typografiske problemer, der skjuler sig i almindelighed.
onboarding.page2.title|Vi fanger, hvad stavekontrol går glip af
onboarding.page2.body|Lige citater, falske ellipser, bindestreger, der foregiver at være em-bindestreger, og inkonsekvente mellemrum vises alle her.
onboarding.page3.title|Få din kriminalitetsscore
onboarding.page3.body|Se, hvor ren din typografi er, og del derefter dommen.
onboarding.page4.title|Lær mens du går
onboarding.page4.body|Åbn ethvert problem for at se, hvorfor det er vigtigt, og hvordan det løses.
onboarding.start|Begynd at undersøge
onboarding.sample.not_em_dash|Ikke et bindestreg
onboarding.library.investigate|Undersøg
onboarding.library.study|Lær reglerne
analysis.failed_title|Analyse mislykkedes
analysis.failed_body|Der gik noget galt under scanningen. Prøv venligst igen.
analysis.status.scan|Scanning efter typografiske beviser...
analysis.status.quotes|Kontrollerer anførselstegn...
analysis.status.dashes|Tjekker brugen af bindestreg...
analysis.status.ellipsis|Kontrollerer ellipser...
analysis.status.spacing|Kontrollerer konsistensen mellem mellemrum...
analysis.status.layout|Kontrollerer enker og forældreløse børn...
analysis.status.comic_sans|Tjekker skrifttypemetadata...
analysis.status.compiling|Kompilerer rapport...
mugshot.title|Flagget for typografisk uredelighed
mugshot.body|Comic Sans blev fundet i det indsendte bevis. I legende sammenhænge kan det fungere, men i de fleste produkt- og redaktionelle indstillinger lyder det som et misforhold.
mugshot.continue|Åbn hele rapporten →
report.breakdown|Forbrydelsessammenbrud
report.share|Del rapport
report.new_scan|Ny scanning
report.close|Luk rapport
report.copy_fixed|Kopiér fast tekst
report.copy_fixed_hint|Kopierer den aktuelle korrigerede tekst.
report.clean_title|Plettet
report.clean_body|Der blev ikke fundet nogen typografiske problemer. Denne tekst er en modelborger.
report.replace_single_space|Erstat med et enkelt mellemrum
report.fixed_text_copied|Fixet tekst kopieret ✓
report.manual_rewrite|Dette problem kræver en manuel omskrivning.
report.apply_failed|Kunne ikke anvende denne rettelse.
report.issue_fixed|Problem rettet og rapport opdateret ✓
report.learn_more|Få mere at vide om dette problem →
settings.detection_rules|Detektionsregler
settings.scoring|Scoring
settings.strictness|Scoringstrenghed
settings.dash_style|Em-dash-stil
settings.appearance|Udseende
settings.theme|Tema
settings.haptics|Haptisk feedback
settings.sounds|Lydeffekter
settings.data|Data
settings.clear_all|Ryd alle sagsfiler
settings.export_all|Eksporter alle rapporter
settings.about|Om
settings.version|Version
settings.typpo|Typpo
settings.rate_app|Vurder på App Store
settings.send_feedback|Send feedback
settings.privacy|Privatlivspolitik
settings.footer|Lavet med omhu og korrekte krøllede citater.
settings.title|Indstillinger
settings.clear_confirm_title|Vil du rydde alle sagsakter?
settings.clear_confirm_message|Denne handling kan ikke fortrydes.
settings.delete_all|Slet alle
settings.about_body|Retsmedicinsk analyse til din tekst. Indsæt enhver tekst, få din score, og del dommen.
settings.about_placeholder|Denne build er helt offline og bruger stadig pladsholder-udgivelseslinks til webstedet, privatlivspolitikken og App Store-destinationen.
settings.about_website|Websted: %@
share.title|Del rapport
share.copy_report_image|Kopiér rapportbillede
share.save_to_photos|Gem i billeder
share.copy_report_text|Kopiér rapporttekst
share.photos_needed|Fotoadgang nødvendig
share.open_settings|Åbn Indstillinger
share.photos_message|Fotoadgang er nødvendig for at gemme rapportbilledet. Åbn Indstillinger for at give adgang.
share.primary.share_text|Del tekst
share.primary.copy_link|Kopiér link
share.primary.share|Del
share.copied_clipboard|Kopieret til udklipsholder ✓
share.deep_link_copied|Dybt link kopieret ✓
share.render_failed|Kunne ikke gengive rapportbilledet.
share.saved_photos|Gem i billeder ✓
share.save_failed|Kunne ikke gemme rapportbilledet.
share.swipe_up|ÅBN APPEN FOR AT ANALYSE DIN EGEN TEKST
share.report_heading|Typografirapport
share.score_prefix|Score
share.top_issues|Vigtigste problemer
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Din tekst indeholder kun mellemrum. Det er ikke kriminelt, men det er mistænkeligt.
engine.non_latin_warning|Analyse er indstillet til typografi med latinsk skrift. Nogle regler for mellemrum og tegnsætning gælder muligvis ikke for dette skrivesystem.
engine.short_text_note|Detektion af enke og forældreløse er mindre pålidelig på meget korte passager.
engine.fix.single_space|Brug et enkelt mellemrum efter tegnsætning, der afslutter sætningen.
engine.fix.replace_with|Erstat med %@
engine.fix.normalize_spacing|Normaliser sætningsafstand i hele teksten.
engine.fix.rewrite_widow|Omskriv eller flyt afsnittet om for at undgå en sidste linje på ét ord.
engine.fix.rewrite_orphan|Juster kopien i nærheden for at undgå en lille overførselslinje.
engine.fix.change_font|Brug en mere passende skrifttype.
engine.explain.double_space|Denne sætning slutter med flere mellemrum, en skrivemaskine-æra-konvention, der ikke hører hjemme i proportional typografi.
engine.explain.straight_quotes|Dette anførselstegn bruger den lige ASCII-form i stedet for retningsbestemte krøllede anførselstegn.
engine.explain.hyphen_dash|Denne afbrydelse bruger bindestreg-minus-tegn i stedet for en korrekt bindestreg.
engine.explain.fake_ellipsis|Denne perioder bør erstattes med ellipsetegnet.
engine.explain.inconsistent_spacing|Denne sætningsafstand adskiller sig fra det dominerende mønster i teksten.
engine.explain.widow|Afsnittet slutter med et isoleret ord på sidste linje, hvilket skaber en synlig enke.
engine.explain.orphan|Dette afsnit starter med en meget kort linje efter et langt foregående afsnit, som sandsynligvis læses som et forældreløst.
engine.explain.comic_sans|Comic Sans metadata blev fundet i den indsendte rich text.
engine.explain.prime_marks|Dette målemærke bruger et ASCII anførselstegn i stedet for et egentligt primesymbol.
engine.explain.multiplication_sign|Denne dimension bruger bogstavet x, hvor multiplikationstegnet skal vises.
engine.explain.trademark_symbol|Denne reservenotation bør erstattes med det rigtige symbol.
category.punctuation|Tekkesætningsproblemer
category.spacing|Space-problemer
category.layout|Layoutproblemer
category.font|Skrifttypeproblemer
category.symbol|Symbolproblemer
severity.infraction|INFRAKTION
severity.misdemeanor|FORSKED
severity.felony|FORBRUG
verdict.clean|RENS
verdict.infraction|INFRAKTION
verdict.misdemeanor|FEJL
verdict.felony|FORBRUG
verdict.capital|KAPITALKRÆVELSE
strictness.lenient|Ledsom
strictness.standard|Standard
strictness.strict|Streng
theme.system|System
theme.light|Lys
theme.dark|Mørk
dash.spaced|Med mellemrum
dash.closed|Lukket
share_format.image|Billede
share_format.story|Historie
share_format.landscape|Landskab
share_format.text|Almindelig tekst
share_format.link|Kopiér link
share_format_desc.image|PNG billede optimeret til sociale feeds.
share_format_desc.story|1080×1920 historieklar rapport.
share_format_desc.landscape|Bredt kort til artikler og sociale forhåndsvisninger.
share_format_desc.text|Formateret tekstoversigt.
share_format_desc.link|Placeholder dybt link kopi.
evidence_source.typed|Skrevet
evidence_source.pasted|Indsat
evidence_source.pasted_rich|Indsat Rich Text
toast.load_failed|Kunne ikke indlæse gemte sagsfiler.
toast.save_failed|Kunne ikke gemme sagsmappen.
toast.delete_failed|Sletning mislykkedes.
toast.cleared|Alle sagsfiler ryddet.
toast.clear_failed|Kunne ikke rydde sagsfiler.
toast.export_failed|Eksporten mislykkedes.
"""),
        verdictShortLabels: verdictMap("""
clean|RENS
infraction|INFRAKTION
misdemeanor|FEJL
felony|FORBRUG
capitalOffense|KAPITALKRÆVELSE
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Tekkesætningsproblemer
spacing|Space-problemer
layout|Layoutproblemer
font|Skrifttypeproblemer
symbol|Symbolproblemer
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dobbelt mellemrum
straightQuotes|Lige citater
hyphenAsDash|Bestregstreg som bindestreg
fakeEllipsis|Falske Ellipsis
widow|Enker
orphan|Forældreløse børn
inconsistentSpacing|Inkonsistent mellemrum
comicSans|Comic Sans
primeMarks|Primemærker
multiplicationSign|Forkert multiplikationstegn
trademarkSymbol|Misbrug af varemærkesymboler
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Ekstra mellemrum efter sætningsafslutning.
straightQuotes|ASCII citater brugt, hvor krøllede citater hører hjemme.
hyphenAsDash|Beststreger står i for en rigtig streg.
fakeEllipsis|Tre punktum bruges i stedet for ellipsetegnet.
widow|En sidste linje tilbage med kun et kort ord.
orphan|En lille overførselslinje i starten af et afsnit.
inconsistentSpacing|Blandede sætningsafstande i én tekst.
comicSans|Comic Sans opdaget i det indsendte bevis.
primeMarks|ASCII anførselstegn brugt, hvor prime symboler hører hjemme.
multiplicationSign|Bogstavet x brugt i stedet for ×.
trademarkSymbol|Fallback-notation brugt i stedet for ©, ® eller ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Dobbelt mellemrum efter en sætning kommer fra skrivemaskinevaner. I moderne proportional type er ét mellemrum den renere standard.", "Ekstra mellemrum skaber ujævn rytme og synlige huller i et afsnit.", "Skrivemaskiner brugte tegn med fast bredde, så ekstra mellemrum hjalp engang læsere med at se sætningsskift.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Søg efter gentagne mellemrum efter tegnsætning.", "Kør et hurtigt oprydningspas, før du deler.", "Hvis dobbelte mellemrum er bevidste, så hold dem konsekvente."]),
            (.straightQuotes, "Lige anførselstegn er almindelige ASCII-tegn. Færdig tekst læses normalt bedre med retningsbestemte krøllede anførselstegn.", "Krøllede citater ser mere polerede ud og forbedrer den visuelle rytme i en sætning.", "Tidlige tastaturer og tegnsæt holdt kun ét enkelt anførselstegn for begge retninger.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Slå smart tegnsætning til, hvor det er muligt.", "Ryd op i tekst, der er indsat fra almindelige tekstkilder.", "Tjek målene, så prime mærker forbliver korrekte."]),
            (.hyphenAsDash, "Beststreger forbinder ord, men de er ikke erstatninger for em bindestreger eller en bindestreger.", "Den korrekte bindestreg forbedrer tone, mellemrum og læsbarhed.", "Dobbelt bindestreger var en løsning i systemer, der ikke nemt kunne producere fyldige tegnsætninger.", "He paused -- dramatically.", "He paused — dramatically.", ["Brug den rigtige bindestreg, din stil kræver.", "Behold bindestreger for sammensætninger, ikke sætningsskift.", "Forbliv konsistent på tværs af hele dokumentet."]),
            (.fakeEllipsis, "Tre perioder kan efterligne en ellipse, men de er ikke den samme karakter.", "En rigtig ellipse har afbalanceret mellemrum og opfører sig bedre i en tekstlinje.", "Mange afslappede skrivearbejdsgange er stadig som standard at skrive tre punktum.", "Wait...", "Wait…", ["Erstat tre punktum med ellipsetegnet.", "Brug teksterstatning, hvis du skriver det ofte.", "Tjek importeret kopi før udgivelse."]),
            (.widow, "En enke efterlader et kort ord strandet på den sidste linje i et afsnit.", "Den svage slutning forstyrrer afsnittets form og rytme.", "Redaktører og designere har lange justerede linjeskift for at undgå enker på tryk.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Stram eller omskriv sætningen lidt.", "Juster linjelængden, hvis layoutværktøjer er tilgængelige.", "Behandle dette som en blød stilanbefaling."]),
            (.orphan, "En forældreløs er en lille overførselslinje, der starter et nyt afsnit eller en tekstblok akavet.", "Det bryder læseflowet og får layoutet til at føles mindre velovervejet.", "Redaktionelle arbejdsgange retter traditionelt forældreløse børn før udgivelse.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Omskriv en nærliggende sætning for at genbalancere pausen.", "Åbn målingen lidt, hvis du styrer layoutet.", "Brug det som en advarsel, ikke en stiv fejl."]),
            (.inconsistentSpacing, "Blanding af enkelt og dobbelt sætningsafstand gør, at teksten føles sat sammen fra forskellige kilder.", "Læsere bemærker hurtigt inkonsekvens, selv når de ikke kan forklare hvorfor.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Vælg én stil med sætningsmellemrum.", "Normaliser indsat tekst, før du deler den.", "Hold valget konsekvent fra start til slut."]),
            (.comicSans, "Comic Sans er ikke forbudt, men den har en stærk kulturel tone, der ofte kolliderer med seriøs kopi.", "Skrifttyper kommunikerer stemning, før en læser overhovedet behandler ordene.", "Comic Sans blev designet i 1994 til en børnesoftwaregrænseflade og spredte sig senere langt ud over den kontekst.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Vælg en skrifttype, der passer til beskeden.", "Reservér legende ansigter til tydeligt legende arbejde.", "Deaktiver denne detektor, hvis valget er bevidst."]),
            (.primeMarks, "Mål som f.eks. fod, tommer, minutter og sekunder har ofte brug for primære symboler frem for anførselstegn.", "Det korrekte mærke forhindrer tvetydighed og får teknisk tekst til at se mere bevidst ud.", nil, "5'11\"", "5′11″", ["Brug prim- og dobbelt-prime-symboler efter tal.", "Se efter automatisk konvertering af smarte tilbud.", "Tjek specifikationer, menuer og produktdimensioner omhyggeligt."]),
            (.multiplicationSign, "Bogstavet x og multiplikationstegnet er ikke udskiftelige i dimensioner.", "Brug af × giver teknisk kopi og produktkopi en renere typografisk finish.", nil, "1920x1080", "1920×1080", ["Erstat x mellem tal med ×.", "Brug teksterstatning til almindelige størrelsesformater.", "Gennemgå specifikationer og markedsføringsaktiver for at sikre ensartethed."]),
            (.trademarkSymbol, "Formularer som (c), (r) og (tm) er reservenotation, ikke poleret endelig kopi.", "De rigtige symboler sparer plads og får juridisk tekst eller brandtekst til at se færdig ud.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Erstat fallback-notation med ©, ® og ™.", "Tjek juridisk og markedsføringsmæssig kopi inden frigivelse.", "Hold afstanden omkring disse symboler ensartet."])
        ])
    )

    static let finnishPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Rikoslaboratorio
app.tab.case_files|Tapaustiedostot
app.tab.learn|Opi
app.tab.settings|Asetukset
counts.crimes_categories|Rikos: %@ · Luokat: %@
counts.detected_issues|Havaitut ongelmat: %@
counts.entries|Tiedot: %@
counts.characters|Hahmot: %@
counts.line_column|Rivi %@ · Sarake %@
counts.crimes_verdict|Rikokset: %@ · %@
share.offense_line|• %@: %@
general.done|Valmis
general.cancel|Peruuta
general.retry|Yritä uudelleen
general.next|Seuraava
general.skip|Ohita
general.got_it|Selvä
general.coming_soon|Tulossa pian
general.wrong|Väärin
general.right|Oikea
history.empty_title|Ei tapauksia vielä
history.empty_subtitle|Suorita tarkistus, niin tapaustiedostosi näkyvät täällä.
history.share|Jaa
history.delete|Poista
history.title|Tapaustiedostot
history.today|TÄNÄÄN
history.yesterday|EILEN
history.this_week|TÄLLÄ VIIKKOLLA
history.this_month|TÄSSÄ KUUKASSA
history.select_all|Valitse kaikki
history.delete_selected|Poista valitut
learn.title|Lakikirjasto
learn.search_prompt|Hae rikostyyppejä
learn.empty_title|Vastaavia rikoksia ei löytynyt
learn.empty_subtitle|Kokeile toista hakutermiä.
learn.what_is_this|Mikä tämä ongelma on?
learn.why_it_matters|Miksi sillä on merkitystä
learn.history_origin|Historia ja konteksti
learn.how_to_fix|Kuinka korjata se
learn.default_why|Hyvä typografia on harkittujen yksityiskohtien järjestelmä.
learn.default_fix|Käytä oikeaa merkkiä ja pidä asiakirja johdonmukaisena.
input.method|Syöttötapa
input.method.paste|Liitä/kirjoita
input.method.camera|Kamera (OCR)
input.placeholder|Liitä tai kirjoita tekstisi tähän…
input.paste_from_clipboard|Liitä leikepöydältä
input.title|Lähetä todisteet
input.analyze|Analysoi
input.analyze_evidence|Analysoi todisteet
input.camera_message|Kamerapohjainen tekstintunnistus on tulossa tulevassa päivityksessä. Liitä tai kirjoita analysoitava teksti toistaiseksi.
input.trimmed_warning|Tekstiä leikattiin 100 000 merkkiin.
input.clipboard_empty|Leikepöytä on tyhjä. Kopioi ensin tekstiä.
input.no_text|Ei tekstiä analysoitavaa. Liitä tai kirjoita ensin tekstiä.
home.new_investigation|Uusi tutkimus
home.new_investigation_subtitle|Aloita rikostekninen typografia-analyysi liittämällä tai kirjoittamalla tekstiä
home.new_investigation_badge|LIITÄ · TYYPPI · ANALYSOI
home.recent_cases|Viimeaikaiset tapaukset
home.see_all|Näytä kaikki →
home.empty_title|Ei tapauksia vielä
home.empty_subtitle|Aloita ensimmäinen tutkimuksesi.
home.begin_investigation|Aloita tutkiminen
home.stat.scans|Skannaukset
home.stat.crimes|Rikokset
home.stat.avg|Keskim.
onboarding.splash_tagline|Jokainen kuvio on todiste.
onboarding.page1.title|Liitä. Analysoida. Tarkista.
onboarding.page1.body|Pudota mitä tahansa tekstiä, niin sovellus ilmoittaa näkyvät typografiset ongelmat.
onboarding.page2.title|Huomioimme, mitä oikeinkirjoituksen tarkastuksesta puuttuu
onboarding.page2.body|Tässä näkyvät suorat lainausmerkit, väärennetyt ellipsit, väliviivoja esittävät yhdysmerkit ja epäjohdonmukaiset välit.
onboarding.page3.title|Hanki rikospisteesi
onboarding.page3.body|Katso, kuinka puhdas typografiasi on, ja kerro sitten tuomio.
onboarding.page4.title|Opi samalla
onboarding.page4.body|Avaa mikä tahansa ongelma nähdäksesi, miksi sillä on merkitystä ja miten se korjataan.
onboarding.start|Aloita tutkiminen
onboarding.sample.not_em_dash|Ei em-viiva
onboarding.library.investigate|Tutki
onboarding.library.study|Tutki sääntöjä
analysis.failed_title|Analyysi epäonnistui
analysis.failed_body|Jotain meni vikaan tarkistuksen aikana. Yritä uudelleen.
analysis.status.scan|Skannataan typografisia todisteita…
analysis.status.quotes|Tarkistetaan lainausmerkkejä…
analysis.status.dashes|Tarkistetaan kojetaulun käyttöä…
analysis.status.ellipsis|Tarkistetaan ellipsiä…
analysis.status.spacing|Tarkistetaan välien yhdenmukaisuutta…
analysis.status.layout|Tarkistetaan leskiä ja orpoja…
analysis.status.comic_sans|Tarkistetaan kirjasimen metatietoja…
analysis.status.compiling|Raporttia laaditaan…
mugshot.title|Liitetty typografisen virheen vuoksi
mugshot.body|Comic Sans löytyi toimitetusta todisteesta. Leikkisissä yhteyksissä se voi toimia, mutta useimmissa tuote- ja toimituksellisissa asetuksissa se lukee yhteensopimattomuuden.
mugshot.continue|Avaa koko raportti →
report.breakdown|Rikollisuuden jakautuminen
report.share|Jaa raportti
report.new_scan|Uusi tarkistus
report.close|Sulje raportti
report.copy_fixed|Kopioi kiinteä teksti
report.copy_fixed_hint|Kopioi nykyisen korjatun tekstin.
report.clean_title|Tahraton
report.clean_body|Typografisia ongelmia ei havaittu. Tämä teksti on mallikansalainen.
report.replace_single_space|Korvaa yhdellä välilyönnillä
report.fixed_text_copied|Korjattu teksti kopioitu ✓
report.manual_rewrite|Tämä ongelma vaatii manuaalisen uudelleenkirjoituksen.
report.apply_failed|Tätä korjausta ei voitu ottaa käyttöön.
report.issue_fixed|Ongelma korjattu ja raportti päivitetty ✓
report.learn_more|Lisätietoja tästä ongelmasta →
settings.detection_rules|Havaitsemissäännöt
settings.scoring|Pisteytys
settings.strictness|Pisteiden tiukkaus
settings.dash_style|Em-viiva-tyyli
settings.appearance|Ulkonäkö
settings.theme|Teema
settings.haptics|Haptinen palaute
settings.sounds|Äänitehosteet
settings.data|Tiedot
settings.clear_all|Tyhjennä kaikki tapaustiedostot
settings.export_all|Vie kaikki raportit
settings.about|Tietoja
settings.version|Versio
settings.typpo|Typpo
settings.rate_app|Arvioi App Store
settings.send_feedback|Lähetä palautetta
settings.privacy|Tietosuojakäytäntö
settings.footer|Tehty huolella ja oikeilla lainausmerkeillä.
settings.title|Asetukset
settings.clear_confirm_title|Poistetaanko kaikki tapaustiedostot?
settings.clear_confirm_message|Tätä toimintoa ei voi kumota.
settings.delete_all|Poista kaikki
settings.about_body|Tekstisi rikostekninen analyysi. Liitä mikä tahansa teksti, hanki pisteet ja jaa tuomio.
settings.about_placeholder|Tämä koontiversio on täysin offline-tilassa ja käyttää edelleen paikkamerkkien julkaisulinkkejä verkkosivustolle, tietosuojakäytännölle ja App Store-kohteelle.
settings.about_website|Sivusto: %@
share.title|Jaa raportti
share.copy_report_image|Kopioi raportin kuva
share.save_to_photos|Tallenna Kuviin
share.copy_report_text|Kopioi raportin teksti
share.photos_needed|Valokuvien käyttöoikeus tarvitaan
share.open_settings|Avaa Asetukset
share.photos_message|Raportin kuvan tallentamiseen tarvitaan valokuvien käyttöoikeus. Myönnä käyttöoikeus avaamalla Asetukset.
share.primary.share_text|Jaa teksti
share.primary.copy_link|Kopioi linkki
share.primary.share|Jaa
share.copied_clipboard|Kopioitu leikepöydälle ✓
share.deep_link_copied|Täsmälinkki kopioitu ✓
share.render_failed|Raportin kuvaa ei voitu renderöidä.
share.saved_photos|Tallennettu Kuviin ✓
share.save_failed|Raportin kuvaa ei voitu tallentaa.
share.swipe_up|AVAA SOVELLUS ANALYSOIDAksesi OMAA TEKSTIÄSI
share.report_heading|Typografiaraportti
share.score_prefix|Pistemäärä
share.top_issues|Suosituimmat ongelmat
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Tekstisi sisältää vain välilyöntejä. Se ei ole rikollista, mutta se on epäilyttävää.
engine.non_latin_warning|Analyysi on viritetty latinalaiseen typografiaan. Jotkut väli- ja välimerkkisäännöt eivät välttämättä koske tätä kirjoitusjärjestelmää.
engine.short_text_note|Leskien ja orpojen havaitseminen on vähemmän luotettavaa hyvin lyhyissä kohdissa.
engine.fix.single_space|Käytä yhtä välilyöntiä lauseen loppujen välimerkkien jälkeen.
engine.fix.replace_with|Korvaa %@
engine.fix.normalize_spacing|Normaaloi lausevälit koko tekstissä.
engine.fix.rewrite_widow|Kirjoita kappale uudelleen tai viiva uudelleen, jotta vältät yhden sanan loppurivin.
engine.fix.rewrite_orphan|Säädä lähellä olevaa kopiota, jotta vältät pienen siirtymäviivan.
engine.fix.change_font|Käytä sopivampaa kirjasinta.
engine.explain.double_space|Tämä lause päättyy useisiin välilyönteihin, kirjoituskoneen aikakauden käytäntö, joka ei kuulu suhteelliseen typografiaan.
engine.explain.straight_quotes|Tämä lainausmerkki käyttää suoraa ASCII-muotoa suuntaavien kihara lainausmerkkien sijaan.
engine.explain.hyphen_dash|Tämä keskeytys käyttää väliviiva-miinusmerkkejä oikean viivan sijaan.
engine.explain.fake_ellipsis|Tämä pistesarja tulee korvata ellipsimerkillä.
engine.explain.inconsistent_spacing|Tämä lauseväli eroaa tekstin hallitsevasta kuviosta.
engine.explain.widow|Kappale päättyy eristettyyn viimeisen rivin sanaan, mikä luo näkyvän lesken.
engine.explain.orphan|Tämä kappale alkaa hyvin lyhyellä rivillä pitkän edellisen kappaleen jälkeen, joka todennäköisesti kuuluu orpoksi.
engine.explain.comic_sans|Comic Sans-sisällönkuvaustiedot löytyivät lähetetystä monipuolisesta tekstistä.
engine.explain.prime_marks|Tämä mittausmerkki käyttää lainausmerkkiä ASCII oikean alkusymbolin sijaan.
engine.explain.multiplication_sign|Tämä ulottuvuus käyttää x-kirjainta, jossa kertomerkin pitäisi näkyä.
engine.explain.trademark_symbol|Tämä varamerkintä tulee korvata oikealla symbolilla.
category.punctuation|Välimerkkiongelmat
category.spacing|Välitysongelmat
category.layout|Asetteluongelmat
category.font|Fonttiongelmat
category.symbol|Symboliongelmat
severity.infraction|INFRAKTIO
severity.misdemeanor|VIRHE
severity.felony|FELONY
verdict.clean|PUHDISTA
verdict.infraction|INFRAKTIO
verdict.misdemeanor|VIRHE
verdict.felony|FELONY
verdict.capital|PÄÄRIKOSTO
strictness.lenient|Lempeä
strictness.standard|Vakio
strictness.strict|Tiukka
theme.system|Järjestelmä
theme.light|Valo
theme.dark|Tumma
dash.spaced|välillä
dash.closed|Suljettu
share_format.image|Kuva
share_format.story|Tarina
share_format.landscape|Maisema
share_format.text|Pelkkä teksti
share_format.link|Kopioi linkki
share_format_desc.image|PNG kuva on optimoitu sosiaalisiin syötteisiin.
share_format_desc.story|1080 × 1920 tarinavalmis raportti.
share_format_desc.landscape|Leveä kortti artikkeleille ja sosiaalisen median esikatseluille.
share_format_desc.text|Muotoiltu tekstiyhteenveto.
share_format_desc.link|Paikkamerkkien täsmälinkkikopio.
evidence_source.typed|Kirjoitettu
evidence_source.pasted|Liitetty
evidence_source.pasted_rich|Liitetty Rich Text
toast.load_failed|Tallennettuja tapaustiedostoja ei voitu ladata.
toast.save_failed|Tapaustiedostoa ei voitu tallentaa.
toast.delete_failed|Poistaminen epäonnistui.
toast.cleared|Kaikki tapaustiedostot tyhjennettiin.
toast.clear_failed|Tapaustiedostoja ei voitu tyhjentää.
toast.export_failed|Vienti epäonnistui.
"""),
        verdictShortLabels: verdictMap("""
clean|PUHDISTA
infraction|INFRAKTIO
misdemeanor|VIRHE
felony|FELONY
capitalOffense|PÄÄRIKOSTO
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Välimerkkiongelmat
spacing|Välitysongelmat
layout|Asetteluongelmat
font|Fonttiongelmat
symbol|Symboliongelmat
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Kaksoisvälit
straightQuotes|Suora lainaus
hyphenAsDash|Tavuviiva viivana
fakeEllipsis|Väärennetty ellipsi
widow|Lesket
orphan|Orvot
inconsistentSpacing|Epäjohdonmukainen välilyönti
comicSans|Comic Sans
primeMarks|Alkumerkit
multiplicationSign|Väärä kertomerkki
trademarkSymbol|Tavaramerkkisymbolien väärinkäyttö
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Ylimääräiset välilyönnit lauseen loppujen välimerkkien jälkeen.
straightQuotes|ASCII lainausmerkkejä käytetään siellä, missä kiharat lainausmerkit kuuluvat.
hyphenAsDash|Yhdysviivat edustavat todellista viivaa.
fakeEllipsis|Kolme pistettä käytetään ellipsimerkin sijaan.
widow|Viimeinen rivi jäljellä vain yhdellä lyhyellä sanalla.
orphan|Pieni siirtorivi kappaleen alussa.
inconsistentSpacing|Sekalaiset lausevälityylit yhdessä tekstissä.
comicSans|Comic Sans havaittu toimitetussa todisteessa.
primeMarks|ASCII lainausmerkkejä käytetään, kun alkusymbolit kuuluvat.
multiplicationSign|X-kirjain, jota käytetään x:n sijaan.
trademarkSymbol|Varamerkintä käytetty ©, ® tai ™ sijasta.
"""),
        articles: articleMap([
            (.doubleSpace, "Kaksoisvälit lauseen jälkeen johtuvat kirjoituskonetottumuksista. Nykyaikaisessa suhteellisessa tyypissä yksi välilyönti on puhtaamman oletus.", "Ylimääräiset välilyönnit luovat epätasaisen rytmin ja näkyvät aukot kappaleeseen.", "Kirjoituskoneet käyttivät kiinteäleveisiä merkkejä, joten ylimääräinen välilyönti auttoi lukijoita näkemään lauseenvaihdot.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Etsi toistuvia välilyöntejä välimerkkien jälkeen.", "Suorita nopea siivouspassi ennen jakamista.", "Jos kaksoisvälilyönnit ovat tarkoituksellisia, pidä ne johdonmukaisina."]),
            (.straightQuotes, "Suorat lainausmerkit ovat tavallisia ASCII-merkkejä. Valmis teksti luetaan yleensä paremmin suuntaavilla lainausmerkeillä.", "Kiharat lainaukset näyttävät hienostuneemmilta ja parantavat lauseen visuaalista rytmiä.", "Varhaisissa näppäimistöissä ja merkistöissä oli vain yksi yksinkertainen lainausmerkki molempiin suuntiin.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Ota älykkäät välimerkit käyttöön, jos mahdollista.", "Puhdista pelkkätekstilähteistä liitetty teksti.", "Tarkista mitat, jotta alkumerkit pysyvät oikein."]),
            (.hyphenAsDash, "Tavuviivat yhdistävät sanoja, mutta ne eivät korvaa väliviivoja tai väliviivoja.", "Oikea viiva parantaa sävyä, välilyöntejä ja luettavuutta.", "Kaksoisyhdysviivat olivat kiertotapa järjestelmissä, joissa ei voitu helposti tuottaa monipuolisia välimerkkejä.", "He paused -- dramatically.", "He paused — dramatically.", ["Käytä todellista viivahahmoa, jota tyylisi vaatii.", "Säilytä yhdysviivat, älä lauseenvaihtoja.", "Pysy johdonmukainen koko asiakirjassa."]),
            (.fakeEllipsis, "Kolme pistettä voivat jäljitellä ellipsiä, mutta ne eivät ole sama merkki.", "Todella ellipsillä on tasapainoiset välit ja se käyttäytyy paremmin tekstirivillä.", "Monissa satunnaisissa kirjoitustyönkuluissa on edelleen oletuksena kolmen pisteen kirjoittaminen.", "Wait...", "Wait…", ["Korvaa kolme pistettä ellipsillä.", "Käytä tekstin korvaamista, jos kirjoitat sen usein.", "Tarkista tuotu kopio ennen julkaisua."]),
            (.widow, "Leski jättää yhden lyhyen sanan jumiin kappaleen viimeiselle riville.", "Tuo heikko loppu häiritsee kappaleen muotoa ja rytmiä.", "Toimittajat ja suunnittelijat ovat säätäneet pitkiä rivinvaihtoja välttääkseen leskien tulosta.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Kierrä tai kirjoita lausetta hieman uudelleen.", "Säädä rivin pituutta, jos asettelutyökaluja on saatavilla.", "Käsi tätä pehmeänä tyylisuosituksena."]),
            (.orphan, "Orpo on pieni siirretty rivi, joka aloittaa uuden kappaleen tai tekstilohkon hankalasti.", "Se katkaisee lukuvirran ja tekee asettelusta vähemmän harkitun.", "Toimitukselliset työnkulut korjaavat perinteisesti orvot ennen julkaisua.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Kirjoita lähellä oleva lause uudelleen tasapainottaaksesi tauon.", "Avaa mittaa hieman, jos hallitset asettelua.", "Käytä sitä varoituksena, ei jäykkänä virheenä."]),
            (.inconsistentSpacing, "Yksi- ja kaksinkertaisen lauseen välilyöntien sekoittaminen saa tekstin tuntumaan yhdistetyltä eri lähteistä.", "Lukijat huomaavat epäjohdonmukaisuuden nopeasti, vaikka he eivät osaa selittää miksi.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Valitse yksi lausevälityyli.", "Normaaloi liitetty teksti ennen sen jakamista.", "Pidä valinta johdonmukainen alusta loppuun."]),
            (.comicSans, "Comic Sans ei ole kiellettyä, mutta siinä on vahva kulttuurisävy, joka usein törmää vakavaan kopioon.", "Fontit viestivät mielialasta ennen kuin lukija edes käsittelee sanoja.", "Comic Sans suunniteltiin vuonna 1994 lasten ohjelmistokäyttöliittymään ja levisi myöhemmin kauas tuon kontekstin ulkopuolelle.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Valitse viestiin sopiva kirjasintyyppi.", "Varaa leikkisät kasvot selkeästi leikkisää työtä varten.", "Poista tämä ilmaisin käytöstä, jos valinta on tahallinen."]),
            (.primeMarks, "Mittaukset, kuten jalat, tuumat, minuutit ja sekunnit, edellyttävät usein alkumerkkejä lainausmerkkien sijaan.", "Oikea merkki estää epäselvyyden ja saa teknisen tekstin näyttämään harkitummalta.", nil, "5'11\"", "5′11″", ["Käytä alku- ja kaksoisalkulukusymboleja numeroiden jälkeen.", "Katso automaattinen älykäs lainausmuunnos.", "Tarkista tiedot, valikot ja tuotteen mitat huolellisesti."]),
            (.multiplicationSign, "X-kirjain ja kertomerkki eivät ole keskenään vaihdettavissa mitoiltaan.", "X:n käyttäminen antaa tekniselle ja tuotekopiolle puhtaamman typografisen viimeistelyn.", nil, "1920x1080", "1920×1080", ["Korvaa x numeroiden välissä x:llä.", "Käytä tekstin korvaamista yleisissä kokomuodoissa.", "Tarkista tekniset tiedot ja markkinointimateriaalit johdonmukaisuuden varmistamiseksi."]),
            (.trademarkSymbol, "Lomakkeet, kuten (c), (r) ja (tm) ovat varamerkintöjä, ei hiottua lopullista kopiota.", "Oikeat symbolit säästävät tilaa ja saavat juridisen tai bränditekstin näyttämään valmiilta.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Korvaa varamerkintä merkillä ©, ® ja ™.", "Tarkista laillinen ja markkinointikopio ennen julkaisua.", "Pidä symbolien ympärillä olevat välit yhtenäisinä."])
        ])
    )

    static let czechPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Kriminální laboratoř
app.tab.case_files|Soubory případů
app.tab.learn|Učte se
app.tab.settings|Nastavení
counts.crimes_categories|Zločiny: %@ · Kategorie: %@
counts.detected_issues|Zjištěné problémy: %@
counts.entries|Záznamy: %@
counts.characters|Postavy: %@
counts.line_column|Řádek %@ · Sloupec %@
counts.crimes_verdict|Zločiny: %@ · %@
share.offense_line|• %@: %@
general.done|Hotovo
general.cancel|Zrušit
general.retry|Zkusit znovu
general.next|Další
general.skip|Přeskočit
general.got_it|Rozumím
general.coming_soon|Již brzy
general.wrong|Špatně
general.right|Správně
history.empty_title|Zatím žádné případy
history.empty_subtitle|Spusťte skenování a soubory vašich případů se zobrazí zde.
history.share|Sdílet
history.delete|Smazat
history.title|Soubory případů
history.today|DNES
history.yesterday|VČERA
history.this_week|TENTO TÝDEN
history.this_month|TENTO MĚSÍC
history.select_all|Vybrat vše
history.delete_selected|Smazat vybrané
learn.title|Právní knihovna
learn.search_prompt|Vyhledejte typy trestné činnosti
learn.empty_title|Nebyly nalezeny žádné odpovídající zločiny
learn.empty_subtitle|Zkuste jiný hledaný výraz.
learn.what_is_this|Co je to za problém?
learn.why_it_matters|Proč na tom záleží
learn.history_origin|Historie a kontext
learn.how_to_fix|Jak to opravit
learn.default_why|Dobrá typografie je systém promyšlených detailů.
learn.default_fix|Použijte správný znak a udržujte dokument konzistentní.
input.method|Metoda zadávání
input.method.paste|Vložit / Typ
input.method.camera|Kamera (OCR)
input.placeholder|Sem vložte nebo napište svůj text…
input.paste_from_clipboard|Vložit ze schránky
input.title|Předložte důkaz
input.analyze|Analyzovat
input.analyze_evidence|Analyzujte důkazy
input.camera_message|Rozpoznávání textu pomocí fotoaparátu přichází v budoucí aktualizaci. Prozatím vložte nebo zadejte text, který chcete analyzovat.
input.trimmed_warning|Text byl oříznut na 100 000 znaků.
input.clipboard_empty|Schránka je prázdná. Nejprve zkopírujte nějaký text.
input.no_text|Žádný text k analýze. Nejprve vložte nebo napište nějaký text.
home.new_investigation|Nové šetření
home.new_investigation_subtitle|Vložením nebo zadáním textu zahájíte forenzní typografickou analýzu
home.new_investigation_badge|VLOŽIT · TYP · ANALÝZA
home.recent_cases|Nedávné případy
home.see_all|Zobrazit vše →
home.empty_title|Zatím žádné případy
home.empty_subtitle|Začněte své první vyšetřování.
home.begin_investigation|Zahájit vyšetřování
home.stat.scans|Skenování
home.stat.crimes|Zločiny
home.stat.avg|Prům.
onboarding.splash_tagline|Každý glyf je důkazem.
onboarding.page1.title|Vložit. Analyzovat. Recenze.
onboarding.page1.body|Vložte libovolný text a aplikace označí typografické problémy, které se skryjí na očích.
onboarding.page2.title|Zachytili jsme, co kontrola pravopisu přehlédla
onboarding.page2.body|Zde se zobrazují rovné uvozovky, falešné elipsy, pomlčky vydávající se za pomlčky a nekonzistentní mezery.
onboarding.page3.title|Získejte své skóre kriminality
onboarding.page3.body|Podívejte se, jak čistá je vaše typografie, a pak sdílejte verdikt.
onboarding.page4.title|Učte se za pochodu
onboarding.page4.body|Otevřete jakýkoli problém, abyste viděli, proč na tom záleží a jak to opravit.
onboarding.start|Začněte zkoumat
onboarding.sample.not_em_dash|Není pomlčka
onboarding.library.investigate|Prozkoumat
onboarding.library.study|Prostudujte si pravidla
analysis.failed_title|Analýza se nezdařila
analysis.failed_body|Během skenování se něco pokazilo. Zkuste to prosím znovu.
analysis.status.scan|Vyhledávání typografických důkazů…
analysis.status.quotes|Kontrola uvozovek…
analysis.status.dashes|Kontrola využití pomlčky…
analysis.status.ellipsis|Kontrola elips…
analysis.status.spacing|Kontrola konzistence mezer…
analysis.status.layout|Kontrola vdov a sirotků…
analysis.status.comic_sans|Kontrola metadat písem…
analysis.status.compiling|Sestavování zprávy…
mugshot.title|Označeno kvůli typografickému nesprávnému chování
mugshot.body|Comic Sans byl nalezen v předložených důkazech. V hravých kontextech to může fungovat, ale ve většině produktových a redakčních nastavení se to čte jako nesoulad.
mugshot.continue|Otevřít úplný přehled →
report.breakdown|Rozdělení kriminality
report.share|Sdílet zprávu
report.new_scan|Nové skenování
report.close|Zavřít přehled
report.copy_fixed|Kopírovat pevný text
report.copy_fixed_hint|Zkopíruje aktuální opravený text.
report.clean_title|Bez poskvrny
report.clean_body|Nebyly zjištěny žádné typografické problémy. Tento text je vzorovým občanem.
report.replace_single_space|Nahradit jednou mezerou
report.fixed_text_copied|Pevný text zkopírován ✓
report.manual_rewrite|Tento problém vyžaduje ruční přepsání.
report.apply_failed|Tuto opravu nelze použít.
report.issue_fixed|Problém opraven a zpráva aktualizována ✓
report.learn_more|Další informace o tomto problému →
settings.detection_rules|Pravidla detekce
settings.scoring|Skóre
settings.strictness|Přísnost bodování
settings.dash_style|Styl Em-dash
settings.appearance|Vzhled
settings.theme|Motiv
settings.haptics|Haptická zpětná vazba
settings.sounds|Zvukové efekty
settings.data|Data
settings.clear_all|Vymazat všechny soubory případů
settings.export_all|Exportovat všechny přehledy
settings.about|O
settings.version|Verze
settings.typpo|Typpo
settings.rate_app|Hodnocení v App Store
settings.send_feedback|Odeslat zpětnou vazbu
settings.privacy|Zásady ochrany osobních údajů
settings.footer|Vyrobeno s péčí a správnými složenými uvozovkami.
settings.title|Nastavení
settings.clear_confirm_title|Vymazat všechny soubory případů?
settings.clear_confirm_message|Tuto akci nelze vrátit zpět.
settings.delete_all|Smazat vše
settings.about_body|Forenzní analýza vašeho textu. Vložte libovolný text, získejte své skóre a sdílejte verdikt.
settings.about_placeholder|Toto sestavení je plně offline a stále používá zástupné odkazy na vydání webu, zásad ochrany soukromí a cíle App Store.
settings.about_website|Web: %@
share.title|Sdílet zprávu
share.copy_report_image|Kopírovat obrázek zprávy
share.save_to_photos|Uložit do Fotek
share.copy_report_text|Kopírovat text zprávy
share.photos_needed|Je vyžadován přístup k fotografiím
share.open_settings|Otevřete Nastavení
share.photos_message|K uložení obrázku sestavy je nutný přístup k fotografiím. Otevřete Nastavení a udělte přístup.
share.primary.share_text|Sdílet text
share.primary.copy_link|Zkopírovat odkaz
share.primary.share|Sdílet
share.copied_clipboard|Zkopírováno do schránky ✓
share.deep_link_copied|Přímý odkaz zkopírován ✓
share.render_failed|Nelze vykreslit obrázek sestavy.
share.saved_photos|Uloženo do Fotek ✓
share.save_failed|Nelze uložit obrázek sestavy.
share.swipe_up|OTEVŘETE APLIKACI A ANALÝZUJTE SVŮJ VLASTNÍ TEXT
share.report_heading|Zpráva o typografii
share.score_prefix|Skóre
share.top_issues|Nejčastější problémy
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Váš text obsahuje pouze mezery. Není to trestné, ale je to podezřelé.
engine.non_latin_warning|Analýza je vyladěna pro typografii v latinském písmu. Některá pravidla pro mezery a interpunkci nemusí platit pro tento systém psaní.
engine.short_text_note|Detekce vdovy a sirotků je méně spolehlivá na velmi krátkých pasážích.
engine.fix.single_space|Za interpunkcí na konci věty použijte jednu mezeru.
engine.fix.replace_with|Nahradit %@
engine.fix.normalize_spacing|Normalizovat mezery mezi větami v celém textu.
engine.fix.rewrite_widow|Přepište nebo přeformátujte odstavec, abyste se vyhnuli jednoslovnému poslednímu řádku.
engine.fix.rewrite_orphan|Upravte blízkou kopii, abyste se vyhnuli malé linii přenosu.
engine.fix.change_font|Použijte vhodnější písmo.
engine.explain.double_space|Tato věta končí více mezerami, což je konvence z doby psacích strojů, která do proporcionální typografie nepatří.
engine.explain.straight_quotes|Tato uvozovka používá přímou formu ASCII namísto směrových složených uvozovek.
engine.explain.hyphen_dash|Toto přerušení používá znaky pomlčka-minus místo řádné pomlčky.
engine.explain.fake_ellipsis|Tento běh teček by měl být nahrazen znakem elipsy.
engine.explain.inconsistent_spacing|Tato mezera mezi větami se liší od dominantního vzoru v textu.
engine.explain.widow|Odstavec končí izolovaným slovem na posledním řádku, čímž se vytvoří viditelná vdova.
engine.explain.orphan|Tento odstavec začíná velmi krátkým řádkem po dlouhém předchozím odstavci, který se pravděpodobně čte jako sirotek.
engine.explain.comic_sans|V odeslaném formátovaném textu byla nalezena metadata Comic Sans.
engine.explain.prime_marks|Tato značka měření používá uvozovku ASCII namísto správného prvočísla.
engine.explain.multiplication_sign|Tato dimenze používá písmeno x, kde by se mělo objevit znaménko násobení.
engine.explain.trademark_symbol|Tento záložní zápis by měl být nahrazen správným symbolem.
category.punctuation|Problémy s interpunkcí
category.spacing|Problémy s mezerami
category.layout|Problémy s rozložením
category.font|Problémy s písmem
category.symbol|Problémy se symboly
severity.infraction|INFRAKCE
severity.misdemeanor|PROPADEK
severity.felony|ZLOČIN
verdict.clean|ČISTIT
verdict.infraction|INFRAKCE
verdict.misdemeanor|PROPADEK
verdict.felony|ZLOČIN
verdict.capital|KAPITÁLNÍ DELIKT
strictness.lenient|Lenient
strictness.standard|Standardní
strictness.strict|Přísné
theme.system|Systém
theme.light|Světlo
theme.dark|Tmavý
dash.spaced|Mezerník
dash.closed|Zavřeno
share_format.image|Obrázek
share_format.story|Příběh
share_format.landscape|Na šířku
share_format.text|Prostý text
share_format.link|Zkopírovat odkaz
share_format_desc.image|PNG obrázek optimalizovaný pro sociální kanály.
share_format_desc.story|Přehled 1080×1920 pro příběh.
share_format_desc.landscape|Široká karta pro náhledy článků a sociálních sítí.
share_format_desc.text|Formátované textové shrnutí.
share_format_desc.link|Kopírování přímého odkazu se zástupným symbolem.
evidence_source.typed|Zadáno
evidence_source.pasted|Vloženo
evidence_source.pasted_rich|Vložený formátovaný text
toast.load_failed|Nelze načíst uložené soubory případů.
toast.save_failed|Nelze uložit soubor případu.
toast.delete_failed|Smazání se nezdařilo.
toast.cleared|Všechny soubory případů byly vymazány.
toast.clear_failed|Nelze vymazat soubory případů.
toast.export_failed|Export se nezdařil.
"""),
        verdictShortLabels: verdictMap("""
clean|ČISTIT
infraction|INFRAKCE
misdemeanor|PROPADEK
felony|ZLOČIN
capitalOffense|KAPITÁLNÍ DELIKT
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Problémy s interpunkcí
spacing|Problémy s mezerami
layout|Problémy s rozložením
font|Problémy s písmem
symbol|Problémy se symboly
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dvojité mezery
straightQuotes|Přímé uvozovky
hyphenAsDash|Pomlčka jako pomlčka
fakeEllipsis|Falešná elipsa
widow|Vdovy
orphan|Sirotci
inconsistentSpacing|Nekonzistentní mezery
comicSans|Comic Sans
primeMarks|První známky
multiplicationSign|Chybné násobící znaménko
trademarkSymbol|Zneužití symbolu ochranné známky
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Mezery navíc za interpunkcí na konci věty.
straightQuotes|ASCII uvozovky používané tam, kde patří složené uvozovky.
hyphenAsDash|Pomlčky představují skutečnou pomlčku.
fakeEllipsis|Namísto znaku elipsy jsou použity tři tečky.
widow|Zbývá poslední řádek s pouze jedním krátkým slovem.
orphan|Malý přenosový řádek na začátku odstavce.
inconsistentSpacing|Smíšené styly mezer mezi větami v jednom textu.
comicSans|Comic Sans zjištěno v předložených důkazech.
primeMarks|ASCII uvozovky používané tam, kde patří prvočísla.
multiplicationSign|Písmeno x použité místo ×.
trademarkSymbol|Namísto ©, ® nebo ™ se používá záložní notace.
"""),
        articles: articleMap([
            (.doubleSpace, "Dvojité mezery za větou pocházejí ze zvyků psacího stroje. V moderním proporcionálním typu je jedna mezera čistším výchozím nastavením.", "Mezery navíc vytvářejí nerovnoměrný rytmus a viditelné mezery v odstavci.", "Psací stroje používaly znaky s pevnou šířkou, takže dodatečné mezery kdysi pomáhaly čtenářům vidět konce vět.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Hledejte opakované mezery po interpunkci.", "Před sdílením spusťte rychlý úklid.", "Pokud jsou dvojité mezery záměrné, udržujte je konzistentní."]),
            (.straightQuotes, "Přímé uvozovky jsou obyčejné značky ASCII. Dokončený text se obvykle lépe čte se směrovými složenými uvozovkami.", "Kudrnaté uvozovky vypadají uhlazeněji a zlepšují vizuální rytmus věty.", "Dřívější klávesnice a znakové sady uchovávaly pouze jednu jednoduchou uvozovku pro oba směry.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Pokud je to možné, zapněte chytrou interpunkci.", "Vyčistěte text vložený ze zdrojů prostého textu.", "Zkontrolujte měření, aby prvočísla zůstala správná."]),
            (.hyphenAsDash, "Pomlčky spojují slova, ale nenahrazují dlouhé pomlčky ani pomlčky.", "Správná pomlčka zlepšuje tón, rozestupy a čitelnost.", "Dvojité pomlčky byly řešením v systémech, které nemohly snadno vytvářet bohatou interpunkci.", "He paused -- dramatically.", "He paused — dramatically.", ["Použijte skutečnou pomlčku, kterou váš styl vyžaduje.", "U složenin ponechte pomlčky, nikoli zalomení vět.", "Zůstaňte konzistentní v celém dokumentu."]),
            (.fakeEllipsis, "Tři tečky mohou napodobovat elipsu, ale nejsou to stejné znaky.", "Skutečná elipsa má vyvážené mezery a chová se lépe v řádku textu.", "Mnoho pracovních postupů příležitostného psaní stále ve výchozím nastavení používá tři tečky.", "Wait...", "Wait…", ["Nahraďte tři tečky znakem elipsy.", "Pokud často píšete, použijte náhradu textu.", "Před publikováním zkontrolujte importovanou kopii."]),
            (.widow, "Vdova nechá na posledním řádku odstavce jedno krátké slovo.", "Tento slabý konec narušuje tvar a rytmus odstavce.", "Editoři a designéři upravili dlouhé konce řádků, aby se vyhnuli vdovám v tisku.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Větu mírně utáhněte nebo přepište.", "Pokud jsou k dispozici nástroje pro rozložení, upravte délku čáry.", "Považujte to za doporučení měkkého stylu."]),
            (.orphan, "Sirotek je malý přenosový řádek, který nešikovně začíná nový odstavec nebo textový blok.", "Přeruší tok čtení a způsobí, že rozložení bude méně uvážené.", "Pracovní postupy redakce tradičně opravují sirotky před zveřejněním.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Přepište blízkou frázi, abyste znovu vyvážili přestávku.", "Pokud ovládáte rozložení, mírně otevřete míru.", "Používejte jej jako varování, nikoli jako pevnou chybu."]),
            (.inconsistentSpacing, "Kombinace jednoduchých a dvojitých mezer mezi větami vytváří dojem, že text je sešitý z různých zdrojů.", "Čtenáři si rychle všimnou nekonzistence, i když nedokážou vysvětlit proč.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Vyberte jeden styl mezer mezi větami.", "Před sdílením vložený text normalizujte.", "Udržujte výběr konzistentní od začátku do konce."]),
            (.comicSans, "Comic Sans není zakázáno, ale nese silný kulturní tón, který se často střetává se seriózní kopií.", "Písma sdělují náladu dříve, než čtenář slova vůbec zpracuje.", "Comic Sans byl navržen v roce 1994 pro softwarové rozhraní pro děti a později se rozšířil daleko za tento kontext.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Vyberte typ písma, který odpovídá zprávě.", "Vyhraďte si hravé plochy displeje pro jasně hravou práci.", "Deaktivujte tento detektor, pokud je volba záměrná."]),
            (.primeMarks, "Měření, jako jsou stopy, palce, minuty a sekundy, často vyžadují prvočísla spíše než uvozovky.", "Správná značka zabraňuje nejednoznačnosti a technický text vypadá účelněji.", nil, "5'11\"", "5′11″", ["Po číslicích používejte prvočíslo a dvojité prvočíslo.", "Sledujte automatický převod chytrých nabídek.", "Pečlivě zkontrolujte specifikace, nabídky a rozměry produktu."]),
            (.multiplicationSign, "Písmeno x a znaménko násobení nejsou v rozměrech zaměnitelné.", "Použití × poskytuje technické a produktové kopii čistší typografickou úpravu.", nil, "1920x1080", "1920×1080", ["Nahraďte x mezi čísly znakem ×.", "Pro běžné formáty velikosti použijte náhradu textu.", "Zkontrolujte, zda jsou specifikace a marketingové prostředky konzistentní."]),
            (.trademarkSymbol, "Formuláře jako (c), (r) a (tm) jsou záložní notace, nikoli leštěná konečná kopie.", "Správné symboly šetří místo a dodávají právnímu nebo značkovému textu konečný vzhled.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Nahraďte nouzový zápis znaky ©, ® a ™.", "Před vydáním zkontrolujte právní a marketingovou kopii.", "Zachovejte konzistentní rozestupy kolem těchto symbolů."])
        ])
    )

    static let hungarianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Crime Lab
app.tab.case_files|Ügyfájlok
app.tab.learn|Tanuljon
app.tab.settings|Beállítások
counts.crimes_categories|Bűnügyek: %@ · Kategóriák: %@
counts.detected_issues|Észlelt problémák: %@
counts.entries|Bejegyzések: %@
counts.characters|Karakterek: %@
counts.line_column|%@ sor · %@ oszlop
counts.crimes_verdict|Bűnügyek: %@ · %@
share.offense_line|• %@: %@
general.done|Kész
general.cancel|Mégse
general.retry|Újra
general.next|Következő
general.skip|Kihagyás
general.got_it|Értem
general.coming_soon|Hamarosan
general.wrong|Rossz
general.right|Jobbra
history.empty_title|Még nincs eset
history.empty_subtitle|Futtasson le egy vizsgálatot, és itt megjelennek az ügyiratok.
history.share|Megosztás
history.delete|Törlés
history.title|Ügyfájlok
history.today|MA
history.yesterday|TEGNAP
history.this_week|EZEN A HÉTEN
history.this_month|E HÓNAPBAN
history.select_all|Összes kijelölése
history.delete_selected|Kijelöltek törlése
learn.title|A Jogi Könyvtár
learn.search_prompt|Bűnözéstípusok keresése
learn.empty_title|Nincs megfelelő bűncselekmény
learn.empty_subtitle|Próbáljon másik keresési kifejezést.
learn.what_is_this|Mi ez a probléma?
learn.why_it_matters|Miért számít?
learn.history_origin|Előzmények és kontextus
learn.how_to_fix|Hogyan lehet kijavítani
learn.default_why|A jó tipográfia átgondolt részletek rendszere.
learn.default_fix|Használja a megfelelő karaktert, és tartsa konzisztens a dokumentumot.
input.method|Beviteli mód
input.method.paste|Beillesztés/gépelés
input.method.camera|Fényképezőgép (OCR)
input.placeholder|Illessze be vagy írja be ide a szöveget…
input.paste_from_clipboard|Beillesztés a vágólapról
input.title|Bizonyíték benyújtása
input.analyze|Elemzés
input.analyze_evidence|A bizonyítékok elemzése
input.camera_message|A kamera alapú szövegfelismerés egy jövőbeli frissítésben érkezik. Egyelőre illessze be vagy írja be az elemezni kívánt szöveget.
input.trimmed_warning|A szöveg 100 000 karakterre lett levágva.
input.clipboard_empty|A vágólap üres. Először másoljon szöveget.
input.no_text|Nincs elemeznivaló szöveg. Először illesszen be vagy írjon be egy szöveget.
home.new_investigation|Új vizsgálat
home.new_investigation_subtitle|Illessze be vagy gépelje be a szöveget a kriminalisztikai tipográfiai elemzés megkezdéséhez
home.new_investigation_badge|BESZÍVÁS · TÍPUS · ELEMZÉS
home.recent_cases|Legutóbbi esetek
home.see_all|Összes megtekintése →
home.empty_title|Még nincs eset
home.empty_subtitle|Kezdje el az első vizsgálatot.
home.begin_investigation|Kezdje el a nyomozást
home.stat.scans|Szkennelések
home.stat.crimes|Bűnügyek
home.stat.avg|Átl.
onboarding.splash_tagline|Minden jelkép bizonyíték.
onboarding.page1.title|Beillesztés. Elemezze. Tekintse át.
onboarding.page1.body|Hagyjon be bármilyen szöveget, és az alkalmazás megjelöli a jól látható tipográfiai problémákat.
onboarding.page2.title|Elkapjuk, ami a helyesírás-ellenőrzésből hiányzik
onboarding.page2.body|Egyenes idézetek, hamis ellipszisek, kötőjelnek tűnő kötőjelek és következetlen szóközök jelennek meg itt.
onboarding.page3.title|Szerezze meg bűnügyi pontszámát
onboarding.page3.body|Nézze meg, mennyire tiszta a tipográfia, majd ossza meg az ítéletet.
onboarding.page4.title|Tanulj menet közben
onboarding.page4.body|Nyissa meg bármelyik problémát, hogy megtudja, miért számít, és hogyan javíthatja ki.
onboarding.start|Kezdje el a nyomozást
onboarding.sample.not_em_dash|Nem em kötőjel
onboarding.library.investigate|Vizsgálja meg
onboarding.library.study|Tanulmányozza a szabályokat
analysis.failed_title|Az elemzés sikertelen
analysis.failed_body|Valami hiba történt a vizsgálat során. Kérjük, próbálja újra.
analysis.status.scan|Tipográfiai bizonyítékok keresése…
analysis.status.quotes|Idézőjelek ellenőrzése…
analysis.status.dashes|A műszerfal használatának ellenőrzése…
analysis.status.ellipsis|Ellipszisek ellenőrzése…
analysis.status.spacing|A térközök konzisztenciájának ellenőrzése…
analysis.status.layout|Özvegyek és árvák ellenőrzése…
analysis.status.comic_sans|A betűtípus metaadatainak ellenőrzése…
analysis.status.compiling|Jelentés összeállítása…
mugshot.title|Tipográfiai vétség miatt megjelölve
mugshot.body|Comic Sans található a benyújtott bizonyítékokban. Játékos környezetben működhet, de a legtöbb termék- és szerkesztői beállításban eltérésnek tűnik.
mugshot.continue|Teljes jelentés megnyitása →
report.breakdown|Bűnözés felosztása
report.share|Jelentés megosztása
report.new_scan|Új vizsgálat
report.close|Jelentés bezárása
report.copy_fixed|Rögzített szöveg másolása
report.copy_fixed_hint|Másolja az aktuális javított szöveget.
report.clean_title|Szeplőtelen
report.clean_body|Nem észleltünk tipográfiai problémákat. Ez a szöveg egy mintapolgár.
report.replace_single_space|Csere egyetlen szóközzel
report.fixed_text_copied|Javított szöveg másolva ✓
report.manual_rewrite|Ezt a problémát manuálisan újra kell írni.
report.apply_failed|Nem sikerült alkalmazni ezt a javítást.
report.issue_fixed|A probléma kijavítva és a jelentés frissítve ✓
report.learn_more|További információ erről a problémáról →
settings.detection_rules|Érzékelési szabályok
settings.scoring|Pontozás
settings.strictness|A pontozási szigor
settings.dash_style|Em-dash stílus
settings.appearance|Megjelenés
settings.theme|Téma
settings.haptics|Haptikus visszajelzés
settings.sounds|Hangeffektusok
settings.data|Adatok
settings.clear_all|Az összes ügyfájl törlése
settings.export_all|Az összes jelentés exportálása
settings.about|Körülbelül
settings.version|Verzió
settings.typpo|Typpo
settings.rate_app|Értékelés itt: App Store
settings.send_feedback|Visszajelzés küldése
settings.privacy|Adatvédelmi irányelvek
settings.footer|Gondosan és megfelelő göndör idézőjelekkel készült.
settings.title|Beállítások
settings.clear_confirm_title|Törli az összes ügyiratot?
settings.clear_confirm_message|Ez a művelet nem vonható vissza.
settings.delete_all|Összes törlése
settings.about_body|Törvényszéki elemzés a szövegéhez. Illesszen be bármilyen szöveget, szerezze meg pontszámát, és ossza meg az ítéletet.
settings.about_placeholder|Ez a build teljesen offline, és továbbra is helyőrző kiadási hivatkozásokat használ a webhelyhez, az adatvédelmi irányelvekhez és az App Store célhoz.
settings.about_website|Webhely: %@
share.title|Jelentés megosztása
share.copy_report_image|Jelentéskép másolása
share.save_to_photos|Mentés a Fotók közé
share.copy_report_text|Jelentésszöveg másolása
share.photos_needed|A fényképekhez hozzáférés szükséges
share.open_settings|Nyissa meg a beállításokat
share.photos_message|A jelentés képének mentéséhez hozzáférés szükséges a fényképekhez. Nyissa meg a Beállításokat a hozzáférés megadásához.
share.primary.share_text|Szöveg megosztása
share.primary.copy_link|Hivatkozás másolása
share.primary.share|Megosztás
share.copied_clipboard|Vágólapra másolva ✓
share.deep_link_copied|Mélylink másolva ✓
share.render_failed|Nem sikerült megjeleníteni a jelentésképet.
share.saved_photos|Mentett a Fotók közé ✓
share.save_failed|Nem sikerült menteni a jelentésképet.
share.swipe_up|NYISSA MEG AZ ALKALMAZÁST A SAJÁT SZÖVEG ELEMZÉSÉHEZ
share.report_heading|Tipográfiai jelentés
share.score_prefix|Eredmény
share.top_issues|Legfőbb problémák
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|A szövege csak szóközt tartalmaz. Nem bűncselekmény, de gyanús.
engine.non_latin_warning|Az elemzés latin betűs tipográfiára van hangolva. Előfordulhat, hogy egyes szóköz- és írásjel-szabályok nem vonatkoznak erre az írásrendszerre.
engine.short_text_note|Az özvegy és árva észlelés kevésbé megbízható nagyon rövid szövegrészleteken.
engine.fix.single_space|Használjon egyetlen szóközt a mondatvégi írásjelek után.
engine.fix.replace_with|Csere a következőre: %@
engine.fix.normalize_spacing|A mondatközök normalizálása a szövegben.
engine.fix.rewrite_widow|Írja át vagy törje át a bekezdést, hogy elkerülje az egyszavas utolsó sort.
engine.fix.rewrite_orphan|Módosítsa a közeli példányt, hogy elkerülje az apró átviteli vonalakat.
engine.fix.change_font|Használjon megfelelőbb betűtípust.
engine.explain.double_space|Ez a mondat több szóközzel végződik, ez az írógép-korszak konvenciója, amely nem tartozik az arányos tipográfiába.
engine.explain.straight_quotes|Ez az idézőjel az egyenes ASCII formát használja az irányított göndör idézőjelek helyett.
engine.explain.hyphen_dash|Ez a megszakítás kötőjel-mínusz karaktereket használ megfelelő kötőjel helyett.
engine.explain.fake_ellipsis|Ezt a pontsorozatot el kell cserélni a hárompontos karakterrel.
engine.explain.inconsistent_spacing|Ez a mondatköz eltér a szövegben uralkodó mintától.
engine.explain.widow|A bekezdés egy elszigetelt utolsó sor szóval végződik, látható özvegyet hozva létre.
engine.explain.orphan|Ez a bekezdés egy nagyon rövid sorral kezdődik egy hosszú előző bekezdés után, amely valószínűleg árvaként jelenik meg.
engine.explain.comic_sans|Comic Sans metaadatok találhatók a beküldött formázott szövegben.
engine.explain.prime_marks|Ez a mérési jel ASCII idézőjelet használ megfelelő prímszimbólum helyett.
engine.explain.multiplication_sign|Ez a méret az x betűt használja, ahol a szorzójelnek meg kell jelennie.
engine.explain.trademark_symbol|Ezt a tartalék jelölést a megfelelő szimbólumra kell cserélni.
category.punctuation|Írásjelekkel kapcsolatos problémák
category.spacing|Térközzel kapcsolatos problémák
category.layout|Elrendezési problémák
category.font|Betűtípus-problémák
category.symbol|Szimbólumproblémák
severity.infraction|INFRAKCIÓ
severity.misdemeanor|HIBAVÉDELEM
severity.felony|FELONY
verdict.clean|TISZTA
verdict.infraction|INFRAKCIÓ
verdict.misdemeanor|HIBAVÉDELEM
verdict.felony|FELONY
verdict.capital|FŐKŐVÉDELEM
strictness.lenient|Elnéző
strictness.standard|Normál
strictness.strict|Szigorú
theme.system|Rendszer
theme.light|Fény
theme.dark|Sötét
dash.spaced|Szóközökkel
dash.closed|Zárva
share_format.image|Kép
share_format.story|Sztori
share_format.landscape|Tájkép
share_format.text|Sima szöveg
share_format.link|Link másolása
share_format_desc.image|PNG kép közösségi hírcsatornákhoz optimalizálva.
share_format_desc.story|1080 × 1920-as sztorira kész riport.
share_format_desc.landscape|Széles kártya a cikkekhez és a közösségi előnézetekhez.
share_format_desc.text|Formázott szöveges összefoglaló.
share_format_desc.link|Helyőrző mélylink másolata.
evidence_source.typed|Beírva
evidence_source.pasted|Beillesztett
evidence_source.pasted_rich|Rich Text beillesztett
toast.load_failed|Nem sikerült betölteni a mentett esetfájlokat.
toast.save_failed|Nem sikerült menteni az ügy fájlját.
toast.delete_failed|A törlés nem sikerült.
toast.cleared|Az összes ügyirat törölve.
toast.clear_failed|Nem sikerült törölni az ügyfájlokat.
toast.export_failed|Az exportálás sikertelen.
"""),
        verdictShortLabels: verdictMap("""
clean|TISZTA
infraction|INFRAKCIÓ
misdemeanor|HIBAVÉDELEM
felony|FELONY
capitalOffense|FŐKŐVÉDELEM
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Írásjelekkel kapcsolatos problémák
spacing|Térközzel kapcsolatos problémák
layout|Elrendezési problémák
font|Betűtípus-problémák
symbol|Szimbólumproblémák
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Kettős szóközök
straightQuotes|Egyenes idézetek
hyphenAsDash|kötőjel mint kötőjel
fakeEllipsis|Hamis ellipszis
widow|Özvegyek
orphan|Árvák
inconsistentSpacing|Inkonzisztens térközök
comicSans|Comic Sans
primeMarks|Prime Marks
multiplicationSign|Rossz szorzójel
trademarkSymbol|A védjegyszimbólumokkal való visszaélés
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Pontos szóközök a mondatvégi írásjelek után.
straightQuotes|ASCII idézőjel, ahol a göndör idézőjelek tartoznak.
hyphenAsDash|A kötőjelek valódi kötőjelként szolgálnak.
fakeEllipsis|Három pont használatos a hárompontos karakter helyett.
widow|Az utolsó sor csak egy rövid szóval maradt.
orphan|Egy apró átviteli sor a bekezdés elején.
inconsistentSpacing|Vegyes mondatközi stílusok egy szövegben.
comicSans|Comic Sans szerepel a benyújtott bizonyítékokban.
primeMarks|ASCII idézőjel, ahol a prím szimbólumok tartoznak.
multiplicationSign|Az × helyett használt x betű.
trademarkSymbol|A ©, ® vagy ™ helyett használt tartalék jelölés.
"""),
        articles: articleMap([
            (.doubleSpace, "A mondat utáni kettős szóköz az írógépek használatából ered. A modern arányos típusban egy szóköz a tisztább alapértelmezett.", "A plusz szóközök egyenetlen ritmust és látható hézagokat hoznak létre a bekezdésben.", "Az írógépek rögzített szélességű karaktereket használtak, így az extra szóközök egykor segítettek az olvasóknak látni a mondattöréseket.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Ismétlődő szóközök keresése az írásjelek után.", "Futtasson egy gyors takarítási kártyát a megosztás előtt.", "Ha a kettős szóközök szándékosak, tartsa őket következetesen."]),
            (.straightQuotes, "Az egyenes idézőjelek egyszerű ASCII jelek. A kész szöveg általában jobban olvasható a göndör idézőjelekkel.", "A göndör idézetek kifinomultabbak, és javítják a mondat vizuális ritmusát.", "A korai billentyűzetek és karakterkészletek csak egy egyszerű idézőjelet tartalmaztak mindkét irányban.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Ha elérhető, kapcsolja be az intelligens írásjeleket.", "Tisztítsa meg az egyszerű szöveges forrásokból beillesztett szöveget.", "Ellenőrizze a méréseket, hogy a főjelek helyesek maradjanak."]),
            (.hyphenAsDash, "A kötőjelek összekapcsolják a szavakat, de nem helyettesítik a kötőjeleket vagy a kötőjeleket.", "A megfelelő kötőjel javítja a hangszínt, a térközt és az olvashatóságot.", "A dupla kötőjelek megoldást jelentenek azokban a rendszerekben, amelyek nem tudtak könnyen gazdag írásjeleket létrehozni.", "He paused -- dramatically.", "He paused — dramatically.", ["Használja a stílusához szükséges valódi kötőjelet.", "Az összetételeknél kötőjelet tartson, ne mondattörést.", "Maradjon következetes az egész dokumentumban."]),
            (.fakeEllipsis, "Három pont utánozhat egy ellipszist, de nem ugyanaz a karakter.", "Egy igazi ellipszis kiegyensúlyozott térközzel rendelkezik, és jobban viselkedik egy szövegsorban.", "Sok hétköznapi írási munkafolyamat alapértelmezés szerint továbbra is három pontot ír be.", "Wait...", "Wait…", ["Cseréljen ki három pontot hárompontos karakterre.", "Ha gyakran írja be, használjon szövegcserét.", "Közzététel előtt ellenőrizze az importált példányt."]),
            (.widow, "Az özvegy egy rövid szót hagy a bekezdés utolsó sorában.", "Ez a gyenge befejezés megzavarja a bekezdés alakját és ritmusát.", "A szerkesztők és a tervezők hosszú ideig beállították a sortöréseket, hogy elkerüljék az özvegyeket a nyomtatásban.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Kicsit szigorítsa meg vagy írja át a mondatot.", "Ha rendelkezésre állnak elrendezési eszközök, állítsa be a vonal hosszát.", "Kezelje ezt lágy stílusjavaslatként."]),
            (.orphan, "Az árva egy apró átviteli sor, amely kínosan kezd új bekezdést vagy szövegblokkot.", "Megszakítja az olvasási folyamatot, és kevésbé érzi átgondoltnak az elrendezést.", "A szerkesztői munkafolyamatok hagyományosan a közzététel előtt javítják az árvákat.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Írjon át egy közeli kifejezést, hogy kiegyensúlyozza a szünetet.", "Nyissa meg kissé a mértéket, ha vezérli az elrendezést.", "Figyelmeztetésként használja, ne merev hibaként."]),
            (.inconsistentSpacing, "Az egy- és kettős mondatközök keverése azt eredményezi, hogy a különböző forrásokból származó szöveg összefűződik.", "Az olvasók gyorsan észreveszik a következetlenséget, még akkor is, ha nem tudják megmagyarázni, miért.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Válasszon egy mondatközi stílust.", "Normalizálja a beillesztett szöveget a megosztás előtt.", "A választás legyen következetes az elejétől a végéig."]),
            (.comicSans, "Comic Sans nem tilos, de erős kulturális hangot hordoz, amely gyakran ütközik a komoly példányokkal.", "A betűtípusok hangulatot közvetítenek, mielőtt az olvasó feldolgozná a szavakat.", "Comic Sans-t 1994-ben gyermekszoftver-felületre tervezték, és később messze túlterjedt ezen a kontextuson.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Válasszon olyan betűtípust, amely illeszkedik az üzenethez.", "Foglaljon játékos arcokat az egyértelműen játékos munkához.", "Ha a választás szándékos, tiltsa le ezt az érzékelőt."]),
            (.primeMarks, "Az olyan mérésekhez, mint a láb, hüvelyk, perc és másodperc, gyakran idézőjelek helyett prímjelekre van szükség.", "A megfelelő jelölés megakadályozza a félreérthetőséget, és a technikai szövegeket megfontoltabbá teszi.", nil, "5'11\"", "5′11″", ["Használjon prím és dupla prím szimbólumokat a számok után.", "Nézze meg az intelligens idézet automatikus konvertálását.", "Gondosan ellenőrizze a specifikációkat, a menüket és a termék méreteit."]),
            (.multiplicationSign, "Az x betű és a szorzójel méretei nem cserélhetők fel egymással.", "Az × használata tisztább tipográfiai megjelenést biztosít a műszaki és termékmásolatoknak.", nil, "1920x1080", "1920×1080", ["Cserélje ki az x-et a számok között ×-re.", "Használjon szövegcserét az általános méretformátumokhoz.", "Tekintse át a specifikációkat és a marketingeszközöket a következetesség érdekében."]),
            (.trademarkSymbol, "Az olyan űrlapok, mint a (c), (r) és (tm) tartalék jelölések, nem csiszolt végső másolat.", "A megfelelő szimbólumok helyet takarítanak meg, és a jogi vagy márkaszöveg késznek tűnik.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Cserélje ki a tartalék jelölést ©, ® és ™ jelekre.", "Kiadás előtt ellenőrizze a jogi és marketing példányt.", "A szimbólumok közötti térköz legyen egységes."])
        ])
    )

    static let romanianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laborator criminal
app.tab.case_files|Fișiere de caz
app.tab.learn|Învățați
app.tab.settings|Setări
counts.crimes_categories|Infracțiuni: %@ · Categorii: %@
counts.detected_issues|Probleme detectate: %@
counts.entries|Inregistrări: %@
counts.characters|Caractere: %@
counts.line_column|Linia %@ · Col %@
counts.crimes_verdict|Infracțiuni: %@ · %@
share.offense_line|• %@: %@
general.done|Terminat
general.cancel|Anulați
general.retry|Reîncercați
general.next|Următorul
general.skip|Omiteți
general.got_it|Am înțeles
general.coming_soon|În curând
general.wrong|Greșit
general.right|Drept
history.empty_title|Niciun caz încă
history.empty_subtitle|Executați o scanare și fișierele dvs. de caz vor apărea aici.
history.share|Distribuie
history.delete|Ștergeți
history.title|Fișiere de caz
history.today|AZI
history.yesterday|IERI
history.this_week|SĂPTĂMÂNA ACESTA
history.this_month|LUNA ACEASTA
history.select_all|Selectați toate
history.delete_selected|Ștergeți selecția
learn.title|Biblioteca de drept
learn.search_prompt|Căutați tipuri de infracțiuni
learn.empty_title|Nu s-au găsit crime care se potrivesc
learn.empty_subtitle|Încercați un alt termen de căutare.
learn.what_is_this|Care este această problemă?
learn.why_it_matters|De ce contează
learn.history_origin|Istorie și context
learn.how_to_fix|Cum să o remediați
learn.default_why|Tipografia bună este un sistem de detalii atent.
learn.default_fix|Folosiți caracterul corect și păstrați documentul consistent.
input.method|Metoda de introducere
input.method.paste|Inserați/Tastați
input.method.camera|Camera foto (OCR)
input.placeholder|Inserați sau introduceți textul aici...
input.paste_from_clipboard|Inserați din Clipboard
input.title|Trimiteți dovezi
input.analyze|Analizați
input.analyze_evidence|Analizați dovezile
input.camera_message|Recunoașterea textului bazată pe cameră vine într-o actualizare viitoare. Deocamdată, inserați sau introduceți textul pentru a-l analiza.
input.trimmed_warning|Textul a fost tăiat la 100.000 de caractere.
input.clipboard_empty|Clipboardul este gol. Copiați mai întâi un text.
input.no_text|Niciun text de analizat. Lipiți sau introduceți mai întâi un text.
home.new_investigation|O nouă investigație
home.new_investigation_subtitle|Inserați sau introduceți text pentru a începe analiza tipografiei criminalistice
home.new_investigation_badge|PASTE · TIP · ANALIZA
home.recent_cases|Cazuri recente
home.see_all|Vedeți toate →
home.empty_title|Niciun caz încă
home.empty_subtitle|Începeți prima investigație.
home.begin_investigation|Începe investigația
home.stat.scans|Scanări
home.stat.crimes|Infracțiuni
home.stat.avg|Media
onboarding.splash_tagline|Fiecare glifă este o dovadă.
onboarding.page1.title|Lipiți. Analiza. Revizuire.
onboarding.page1.body|Puneți orice text și aplicația va semnala problemele tipografice care se ascund la vedere.
onboarding.page2.title|Prindem ce ratează verificarea ortografică
onboarding.page2.body|Aici apar ghilimele drepte, elipse false, cratimele care se prefac a fi liniuțe și spațierea inconsecventă.
onboarding.page3.title|Obțineți scorul de criminalitate
onboarding.page3.body|Vedeți cât de curată este tipografia dvs., apoi transmiteți verdictul.
onboarding.page4.title|Învățați pe măsură ce mergeți
onboarding.page4.body|Deschideți orice problemă pentru a vedea de ce este importantă și cum să o remediați.
onboarding.start|Începeți Investigarea
onboarding.sample.not_em_dash|Nu o liniuță
onboarding.library.investigate|Investigați
onboarding.library.study|Studiați regulile
analysis.failed_title|Analiza eșuată
analysis.failed_body|Ceva a mers prost în timpul scanării. Vă rugăm să încercați din nou.
analysis.status.scan|Se scanează pentru dovezi tipografice...
analysis.status.quotes|Se verifică ghilimele...
analysis.status.dashes|Se verifică utilizarea liniuței...
analysis.status.ellipsis|Se verifică elipsele...
analysis.status.spacing|Se verifică consistența spațierilor...
analysis.status.layout|Verificarea văduvelor și orfanilor...
analysis.status.comic_sans|Se verifică metadatele fontului...
analysis.status.compiling|Compilarea raportului...
mugshot.title|Semnalat pentru comportament greșit tipografic
mugshot.body|Comic Sans a fost găsit în probele depuse. În contexte jucăușe, poate funcționa, dar în majoritatea setărilor de produs și editoriale se citește ca o nepotrivire.
mugshot.continue|Deschideți raportul complet →
report.breakdown|Defalcarea criminalității
report.share|Distribuiți raportul
report.new_scan|Scanare nouă
report.close|Închidere raport
report.copy_fixed|Copiați textul fix
report.copy_fixed_hint|Copiază textul corectat curent.
report.clean_title|Nepătat
report.clean_body|Nu au fost detectate probleme de tipar. Acest text este un cetățean model.
report.replace_single_space|Înlocuiți cu un singur spațiu
report.fixed_text_copied|Textul corectat a fost copiat ✓
report.manual_rewrite|Această problemă necesită o rescrie manuală.
report.apply_failed|Nu s-a putut aplica această remediere.
report.issue_fixed|Problema remediată și raportul actualizat ✓
report.learn_more|Aflați mai multe despre această problemă →
settings.detection_rules|Reguli de detectare
settings.scoring|Notare
settings.strictness|Strictețea punctajului
settings.dash_style|Stil Em-dash
settings.appearance|Aspect
settings.theme|Temă
settings.haptics|Feedback haptic
settings.sounds|Efecte de sunet
settings.data|Date
settings.clear_all|Ștergeți toate fișierele de caz
settings.export_all|Exportați toate rapoartele
settings.about|Despre
settings.version|Versiune
settings.typpo|Typpo
settings.rate_app|Evaluați pe App Store
settings.send_feedback|Trimiteți feedback
settings.privacy|Politica de confidențialitate
settings.footer|Făcut cu grijă și cu ghilimele ondulate adecvate.
settings.title|Setări
settings.clear_confirm_title|Ștergeți toate fișierele de caz?
settings.clear_confirm_message|Această acțiune nu poate fi anulată.
settings.delete_all|Ștergeți tot
settings.about_body|Analiza criminalistică pentru textul dvs. Lipiți orice text, obțineți scorul și distribuiți verdictul.
settings.about_placeholder|Această versiune este complet offline și încă folosește linkuri de lansare a substituentului pentru site-ul web, politica de confidențialitate și destinația App Store.
settings.about_website|Site web: %@
share.title|Distribuiți raportul
share.copy_report_image|Copiați imaginea raportului
share.save_to_photos|Salvați în Fotografii
share.copy_report_text|Copiați textul raportului
share.photos_needed|Este necesar accesul la fotografii
share.open_settings|Deschide Setări
share.photos_message|Este necesar accesul la fotografii pentru a salva imaginea raportului. Deschide Setări pentru a acorda acces.
share.primary.share_text|Partajați text
share.primary.copy_link|Copiați linkul
share.primary.share|Distribuie
share.copied_clipboard|Copiat în clipboard ✓
share.deep_link_copied|Legătura profundă a fost copiată ✓
share.render_failed|Imaginea raportului nu a putut fi redată.
share.saved_photos|Salvat în Fotografii ✓
share.save_failed|Imaginea raportului nu a putut fi salvată.
share.swipe_up|DESCHIDEȚI APLICAȚIA PENTRU A ANALIZA PROPRIUL TEXT
share.report_heading|Raport de tipografie
share.score_prefix|Scor
share.top_issues|Probleme de top
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Textul dvs. conține doar spații albe. Nu este criminal, dar este suspect.
engine.non_latin_warning|Analiza este reglată pentru tipografia în grafie latină. Este posibil ca anumite reguli de spațiere și punctuație să nu se aplice acestui sistem de scriere.
engine.short_text_note|Detecția văduvelor și orfanilor este mai puțin sigură pe pasaje foarte scurte.
engine.fix.single_space|Folosiți un singur spațiu după punctuația de la sfârșitul propoziției.
engine.fix.replace_with|Înlocuiți cu %@
engine.fix.normalize_spacing|Normalizează spațierea dintre propoziții în tot textul.
engine.fix.rewrite_widow|Rescrieți sau redistribuiți paragraful pentru a evita un rând final de un singur cuvânt.
engine.fix.rewrite_orphan|Ajustați copia din apropiere pentru a evita o linie mică de transfer.
engine.fix.change_font|Folosiți un font mai potrivit.
engine.explain.double_space|Această propoziție se termină cu mai multe spații, o convenție din epoca mașinii de scris care nu aparține tipografiei proporționale.
engine.explain.straight_quotes|Acest ghilimele folosește forma dreaptă ASCII în loc de ghilimele direcționale.
engine.explain.hyphen_dash|Această întrerupere folosește caractere cu cratima minus în loc de o liniuță adecvată.
engine.explain.fake_ellipsis|Această serie de puncte ar trebui înlocuită cu caracterul de suspensie.
engine.explain.inconsistent_spacing|Această spațiere a propozițiilor diferă de modelul dominant din text.
engine.explain.widow|Paragraful se termină cu un cuvânt izolat de linie finală, creând o văduvă vizibilă.
engine.explain.orphan|Acest paragraf începe cu un rând foarte scurt după un paragraf lung anterior, care probabil se citește ca orfan.
engine.explain.comic_sans|Metadatele Comic Sans au fost găsite în textul îmbogățit trimis.
engine.explain.prime_marks|Acest semn de măsurare folosește un ghilimeleu ASCII în loc de un simbol prim adecvat.
engine.explain.multiplication_sign|Această dimensiune folosește litera x unde ar trebui să apară semnul înmulțirii.
engine.explain.trademark_symbol|Această notație alternativă ar trebui înlocuită cu simbolul corespunzător.
category.punctuation|Probleme de punctuație
category.spacing|Probleme de spațiere
category.layout|Probleme de aspect
category.font|Probleme de font
category.symbol|Probleme cu simboluri
severity.infraction|INFRACȚIA
severity.misdemeanor|CONVENIUNEA
severity.felony|FELONIE
verdict.clean|CURAT
verdict.infraction|INFRACȚIA
verdict.misdemeanor|CONVENIUNEA
verdict.felony|FELONIE
verdict.capital|INFRACȚIUNEA CAPITALĂ
strictness.lenient|Indulgent
strictness.standard|Standard
strictness.strict|Strict
theme.system|Sistem
theme.light|Lumina
theme.dark|Întuneric
dash.spaced|Spațiat
dash.closed|Închis
share_format.image|Imagine
share_format.story|Povestea
share_format.landscape|Peisaj
share_format.text|Text simplu
share_format.link|Copiați linkul
share_format_desc.image|PNG imagine optimizată pentru feeduri sociale.
share_format_desc.story|Raport gata pentru poveste 1080×1920.
share_format_desc.landscape|Carte largă pentru previzualizări ale articolelor și rețelelor sociale.
share_format_desc.text|Rezumat textual formatat.
share_format_desc.link|Copie link profund pentru substituent.
evidence_source.typed|Tastat
evidence_source.pasted|Inserat
evidence_source.pasted_rich|Text îmbogățit inserat
toast.load_failed|Nu s-au putut încărca fișierele de caz salvate.
toast.save_failed|Nu s-a putut salva fișierul cazului.
toast.delete_failed|Ștergerea nu a reușit.
toast.cleared|Toate dosarele au fost șterse.
toast.clear_failed|Nu s-au putut șterge dosarele.
toast.export_failed|Exportul a eșuat.
"""),
        verdictShortLabels: verdictMap("""
clean|CURAT
infraction|INFRACȚIA
misdemeanor|CONVENIUNEA
felony|FELONIE
capitalOffense|INFRACȚIUNEA CAPITALĂ
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Probleme de punctuație
spacing|Probleme de spațiere
layout|Probleme de aspect
font|Probleme de font
symbol|Probleme cu simboluri
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Spatii duble
straightQuotes|Citate drepte
hyphenAsDash|Crătima ca liniuță
fakeEllipsis|Elipse false
widow|Văduve
orphan|Orfani
inconsistentSpacing|Spațiere inconsecventă
comicSans|Comic Sans
primeMarks|Marcă principală
multiplicationSign|Semn de multiplicare greșit
trademarkSymbol|Utilizarea greșită a simbolului mărcii comerciale
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Spatii suplimentare după punctuația de la sfârșitul propoziției.
straightQuotes|ASCII ghilimele folosite acolo unde aparțin ghilimelele.
hyphenAsDash|Cratimele în locul unei liniuțe adevărate.
fakeEllipsis|Se folosesc trei puncte în locul caracterului de suspensie.
widow|Un ultim rând rămas cu un singur cuvânt scurt.
orphan|O mică linie reportată la începutul unui paragraf.
inconsistentSpacing|Stiluri mixte de spațiere a propozițiilor într-un singur text.
comicSans|Comic Sans detectat în probele prezentate.
primeMarks|ASCII ghilimele folosite acolo unde apar simbolurile prime.
multiplicationSign|Litera x folosită în loc de ×.
trademarkSymbol|Se folosește notația de rezervă în loc de ©, ® sau ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Spatiile duble după o propoziție provin din obiceiurile de mașină de scris. În tipul proporțional modern, un spațiu este implicit mai curat.", "Spatiile suplimentare creează ritm neuniform și goluri vizibile într-un paragraf.", "Mașinile de scris foloseau caractere cu lățime fixă, așa că spațierea suplimentară a ajutat odată cititorii să vadă întreruperile de propoziție.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Căutați spații repetate după semne de punctuație.", "Efectuați o trecere rapidă de curățare înainte de a partaja.", "Dacă spațiile duble sunt intenționate, păstrați-le consistente."]),
            (.straightQuotes, "Gulimelele drepte sunt semne simple ASCII. Textul final se citește de obicei mai bine cu ghilimele direcționale.", "Citatele crete par mai rafinate și îmbunătățesc ritmul vizual al unei propoziții.", "Tastaturile și seturile de caractere timpurii au păstrat un singur semn de ghilimele simple pentru ambele direcții.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Activați semnele de punctuație inteligente acolo unde sunt disponibile.", "Curăță textul lipit din surse de text simplu.", "Verificați măsurătorile astfel încât semnele prime să rămână corecte."]),
            (.hyphenAsDash, "Cratimele unesc cuvintele, dar nu înlocuiesc liniuțele em sau liniuțele en.", "Linieta corectă îmbunătățește tonul, spațierea și lizibilitatea.", "Cratimele duble erau o soluție de soluție în sistemele care nu puteau produce cu ușurință semne de punctuație bogate.", "He paused -- dramatically.", "He paused — dramatically.", ["Folosește caracterul liniuță real pe care stilul tău îl cere.", "Păstrați cratime pentru compuși, nu pauze de propoziție.", "Păstrați consecvență în întregul document."]),
            (.fakeEllipsis, "Trei puncte pot imita o elipsă, dar nu sunt același caracter.", "O elipsă reală are spațiere echilibrată și se comportă mai bine într-o linie de text.", "Multe fluxuri de lucru de scriere ocazională încă introduc în mod prestabilit trei puncte.", "Wait...", "Wait…", ["Înlocuiți trei puncte cu caracterul elipsă.", "Folosiți înlocuirea textului dacă îl introduceți des.", "Verificați copia importată înainte de publicare."]),
            (.widow, "O văduvă lasă un cuvânt scurt blocat pe ultimul rând al unui paragraf.", "Acel final slab perturbă forma și ritmul paragrafului.", "Editorii și designerii au întreruperi de rând ajustate îndelung pentru a evita văduvele în tipărire.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Strângeți sau rescrieți ușor propoziția.", "Ajustați lungimea liniei dacă instrumentele de aspect sunt disponibile.", "Tratați acest lucru ca pe o recomandare de stil moale."]),
            (.orphan, "Un orfan este o linie minusculă care începe un nou paragraf sau bloc de text în mod ciudat.", "Întrerupe fluxul de citire și face ca aspectul să fie mai puțin luat în considerare.", "Fluxurile de lucru editoriale remediază în mod tradițional orfanii înainte de publicare.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Rescrieți o frază din apropiere pentru a reechilibra pauză.", "Deschideți ușor măsura dacă controlați aspectul.", "Folosiți-l ca un avertisment, nu o eroare rigidă."]),
            (.inconsistentSpacing, "Combinând spațierea dintre propoziții simple și duble, textul se simte îmbinat din surse diferite.", "Cititorii observă incoerența rapid, chiar și atunci când nu pot explica de ce.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Alegeți un stil de spațiere a propozițiilor.", "Normalizează textul lipit înainte de a-l partaja.", "Păstrați alegerea consecventă de la început până la sfârșit."]),
            (.comicSans, "Comic Sans nu este interzis, dar poartă un ton cultural puternic, care adesea se ciocnește cu copierea serioasă.", "Fonturile comunică starea de spirit înainte ca un cititor să prelucreze cuvintele.", "Comic Sans a fost conceput în 1994 pentru o interfață software pentru copii și s-a răspândit ulterior cu mult dincolo de acest context.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Alegeți un tip de literă care se potrivește mesajului.", "Rezervați fețele de afișare jucăușe pentru o muncă clar jucăușă.", "Dezactivați acest detector dacă alegerea este intenționată."]),
            (.primeMarks, "Măsurătorile precum picioarele, centimetrii, minutele și secundele necesită adesea simboluri principale în loc de ghilimele.", "Marca corectă previne ambiguitatea și face textul tehnic să pară mai deliberat.", nil, "5'11\"", "5′11″", ["Folosiți simboluri prim și dublu după numere.", "Urmăriți conversia automată a cotațiilor inteligente.", "Verificați cu atenție specificațiile, meniurile și dimensiunile produsului."]),
            (.multiplicationSign, "Litera x și semnul înmulțirii nu sunt interschimbabile ca dimensiuni.", "Folosirea × oferă copiei tehnice și ale produsului un finisaj tipografic mai curat.", nil, "1920x1080", "1920×1080", ["Înlocuiește x între numere cu ×.", "Utilizați înlocuirea textului pentru formatele de dimensiune obișnuite.", "Examinați specificațiile și elementele de marketing pentru consecvență."]),
            (.trademarkSymbol, "Formele precum (c), (r) și (tm) sunt notații alternative, nu o copie finală lustruită.", "Simbolurile adecvate economisesc spațiu și fac ca textul legal sau al mărcii să pară terminat.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Înlocuiți notația de rezervă cu ©, ® și ™.", "Verificați documentul legal și de marketing înainte de lansare.", "Păstrați spațierea în jurul acelor simboluri consecvente."])
        ])
    )

    static let greekPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Crime Lab
app.tab.case_files|Αρχεία υπόθεσης
app.tab.learn|Μάθετε
app.tab.settings|Ρυθμίσεις
counts.crimes_categories|Εγκλήματα: %@ · Κατηγορίες: %@
counts.detected_issues|Εντοπίστηκαν προβλήματα: %@
counts.entries|Εγγραφές: %@
counts.characters|Χαρακτήρες: %@
counts.line_column|Γραμμή %@ · Συνταγματάρχης %@
counts.crimes_verdict|Εγκλήματα: %@ · %@
share.offense_line|• %@: %@
general.done|Τέλος
general.cancel|Ακύρωση
general.retry|Επανάληψη
general.next|Επόμενο
general.skip|Παράλειψη
general.got_it|Το κατάλαβα
general.coming_soon|Σύντομα
general.wrong|Λάθος
general.right|Σωστά
history.empty_title|Δεν υπάρχουν ακόμη περιπτώσεις
history.empty_subtitle|Εκτελέστε μια σάρωση και τα αρχεία της υπόθεσής σας θα εμφανιστούν εδώ.
history.share|Κοινή χρήση
history.delete|Διαγραφή
history.title|Αρχεία υπόθεσης
history.today|ΣΗΜΕΡΑ
history.yesterday|ΧΘΕΣ
history.this_week|ΑΥΤΗ ΤΗΝ ΕΒΔΟΜΑΔΑ
history.this_month|ΑΥΤΟΝ ΤΟ ΜΗΝΑ
history.select_all|Επιλογή όλων
history.delete_selected|Διαγραφή επιλεγμένων
learn.title|Η Νομική Βιβλιοθήκη
learn.search_prompt|Αναζήτηση τύπων εγκλημάτων
learn.empty_title|Δεν βρέθηκαν εγκλήματα που να ταιριάζουν
learn.empty_subtitle|Δοκιμάστε έναν διαφορετικό όρο αναζήτησης.
learn.what_is_this|Τι είναι αυτό το ζήτημα;
learn.why_it_matters|Γιατί έχει σημασία
learn.history_origin|Ιστορικό και πλαίσιο
learn.how_to_fix|Πώς να το διορθώσετε
learn.default_why|Η καλή τυπογραφία είναι ένα σύστημα προσεκτικών λεπτομερειών.
learn.default_fix|Χρησιμοποιήστε τον σωστό χαρακτήρα και διατηρήστε το έγγραφο συνεπές.
input.method|Μέθοδος εισαγωγής
input.method.paste|Επικόλληση / Τύπος
input.method.camera|Κάμερα (OCR)
input.placeholder|Επικολλήστε ή πληκτρολογήστε το κείμενό σας εδώ…
input.paste_from_clipboard|Επικόλληση από το Πρόχειρο
input.title|Υποβολή αποδεικτικών στοιχείων
input.analyze|Ανάλυση
input.analyze_evidence|Ανάλυση αποδεικτικών στοιχείων
input.camera_message|Η αναγνώριση κειμένου βάσει κάμερας έρχεται σε μελλοντική ενημέρωση. Προς το παρόν, επικολλήστε ή πληκτρολογήστε το κείμενό σας για ανάλυση.
input.trimmed_warning|Το κείμενο περικόπηκε σε 100.000 χαρακτήρες.
input.clipboard_empty|Το πρόχειρο είναι κενό. Αντιγράψτε πρώτα λίγο κείμενο.
input.no_text|Δεν υπάρχει κείμενο για ανάλυση. Επικολλήστε ή πληκτρολογήστε πρώτα κάποιο κείμενο.
home.new_investigation|Νέα έρευνα
home.new_investigation_subtitle|Επικολλήστε ή πληκτρολογήστε κείμενο για να ξεκινήσετε την ανάλυση της εγκληματολογικής τυπογραφίας
home.new_investigation_badge|ΕΠΑΚΛΗΣΗ · ΤΥΠΟΣ · ΑΝΑΛΥΣΗ
home.recent_cases|Πρόσφατες περιπτώσεις
home.see_all|Δείτε όλα →
home.empty_title|Δεν υπάρχουν ακόμη περιπτώσεις
home.empty_subtitle|Ξεκινήστε την πρώτη σας έρευνα.
home.begin_investigation|Έναρξη έρευνας
home.stat.scans|Σαρώνει
home.stat.crimes|Εγκλήματα
home.stat.avg|Μέσο
onboarding.splash_tagline|Κάθε γλύφος είναι απόδειξη.
onboarding.page1.title|Επικόλληση. Αναλύω. Αξιολόγηση.
onboarding.page1.body|Αποθέστε οποιοδήποτε κείμενο και η εφαρμογή θα επισημάνει τυπογραφικά ζητήματα που κρύβονται σε κοινή θέα.
onboarding.page2.title|Καταλαβαίνουμε τι λείπει από τον ορθογραφικό έλεγχο
onboarding.page2.body|Εύθετα εισαγωγικά, ψεύτικες ελλείψεις, παύλες που προσποιούνται ότι είναι em παύλες και ασυνεπή διαστήματα εμφανίζονται όλα εδώ.
onboarding.page3.title|Λάβετε τη βαθμολογία του εγκλήματος σας
onboarding.page3.body|Δείτε πόσο καθαρή είναι η τυπογραφία σας και, στη συνέχεια, μοιραστείτε την ετυμηγορία.
onboarding.page4.title|Μάθετε όσο πηγαίνετε
onboarding.page4.body|Ανοίξτε οποιοδήποτε πρόβλημα για να δείτε γιατί είναι σημαντικό και πώς να το διορθώσετε.
onboarding.start|Ξεκινήστε τη διερεύνηση
onboarding.sample.not_em_dash|Όχι παύλα
onboarding.library.investigate|Διερεύνηση
onboarding.library.study|Μελετήστε τους κανόνες
analysis.failed_title|Η ανάλυση απέτυχε
analysis.failed_body|Κάτι πήγε στραβά κατά τη σάρωση. Δοκιμάστε ξανά.
analysis.status.scan|Σάρωση για τυπογραφικά στοιχεία…
analysis.status.quotes|Έλεγχος εισαγωγικών…
analysis.status.dashes|Έλεγχος χρήσης παύλας…
analysis.status.ellipsis|Έλεγχος ελλείψεων…
analysis.status.spacing|Έλεγχος συνοχής διαστημάτων…
analysis.status.layout|Έλεγχος χήρων και ορφανών…
analysis.status.comic_sans|Έλεγχος μεταδεδομένων γραμματοσειράς…
analysis.status.compiling|Σύνταξη αναφοράς…
mugshot.title|Επισημάνθηκε για τυπογραφικό λάθος
mugshot.body|Comic Sans βρέθηκε στα υποβληθέντα στοιχεία. Σε παιχνιδιάρικα περιβάλλοντα μπορεί να λειτουργήσει, αλλά στις περισσότερες ρυθμίσεις προϊόντων και σύνταξης διαβάζεται ως αναντιστοιχία.
mugshot.continue|Άνοιγμα πλήρους αναφοράς →
report.breakdown|Ανάλυση εγκλήματος
report.share|Κοινή χρήση αναφοράς
report.new_scan|Νέα σάρωση
report.close|Κλείσιμο αναφοράς
report.copy_fixed|Αντιγραφή σταθερού κειμένου
report.copy_fixed_hint|Αντιγράφει το τρέχον διορθωμένο κείμενο.
report.clean_title|Απεντακάθαρο
report.clean_body|Δεν εντοπίστηκαν τυπογραφικά προβλήματα. Αυτό το κείμενο είναι πρότυπο πολίτη.
report.replace_single_space|Αντικαταστήστε με ένα μόνο διάστημα
report.fixed_text_copied|Το διορθωμένο κείμενο αντιγράφηκε ✓
report.manual_rewrite|Αυτό το ζήτημα χρειάζεται χειροκίνητη επανεγγραφή.
report.apply_failed|Δεν ήταν δυνατή η εφαρμογή αυτής της επιδιόρθωσης.
report.issue_fixed|Το πρόβλημα διορθώθηκε και η αναφορά ενημερώθηκε ✓
report.learn_more|Μάθετε περισσότερα για αυτό το ζήτημα →
settings.detection_rules|Κανόνες ανίχνευσης
settings.scoring|Βαθμολογία
settings.strictness|Αυστηρότητα βαθμολογίας
settings.dash_style|Στιλ Em-dash
settings.appearance|Εμφάνιση
settings.theme|Θέμα
settings.haptics|Haptic Feedback
settings.sounds|Ηχητικά εφέ
settings.data|Δεδομένα
settings.clear_all|Διαγραφή όλων των αρχείων υπόθεσης
settings.export_all|Εξαγωγή όλων των αναφορών
settings.about|Περί
settings.version|Έκδοση
settings.typpo|Typpo
settings.rate_app|Βαθμολογήστε στο App Store
settings.send_feedback|Αποστολή σχολίων
settings.privacy|Πολιτική απορρήτου
settings.footer|Φτιαγμένο με προσοχή και σωστά σγουρά εισαγωγικά.
settings.title|Ρυθμίσεις
settings.clear_confirm_title|Διαγραφή όλων των αρχείων υπόθεσης;
settings.clear_confirm_message|Δεν είναι δυνατή η αναίρεση αυτής της ενέργειας.
settings.delete_all|Διαγραφή όλων
settings.about_body|Ιατροδικαστική ανάλυση για το κείμενό σας. Επικολλήστε οποιοδήποτε κείμενο, λάβετε τη βαθμολογία σας και μοιραστείτε την ετυμηγορία.
settings.about_placeholder|Αυτή η έκδοση είναι εντελώς εκτός σύνδεσης και εξακολουθεί να χρησιμοποιεί συνδέσμους έκδοσης κράτησης θέσης για τον ιστότοπο, την πολιτική απορρήτου και τον προορισμό App Store.
settings.about_website|Ιστότοπος: %@
share.title|Κοινή χρήση αναφοράς
share.copy_report_image|Αντιγραφή εικόνας αναφοράς
share.save_to_photos|Αποθήκευση στις Φωτογραφίες
share.copy_report_text|Αντιγραφή κειμένου αναφοράς
share.photos_needed|Απαιτείται πρόσβαση στις φωτογραφίες
share.open_settings|Ανοίξτε τις Ρυθμίσεις
share.photos_message|Απαιτείται πρόσβαση στις φωτογραφίες για την αποθήκευση της εικόνας αναφοράς. Ανοίξτε τις Ρυθμίσεις για να παραχωρήσετε πρόσβαση.
share.primary.share_text|Κοινή χρήση κειμένου
share.primary.copy_link|Αντιγραφή συνδέσμου
share.primary.share|Κοινή χρήση
share.copied_clipboard|Αντιγράφηκε στο πρόχειρο ✓
share.deep_link_copied|Ο σύνδεσμος σε βάθος αντιγράφηκε ✓
share.render_failed|Δεν ήταν δυνατή η απόδοση της εικόνας της αναφοράς.
share.saved_photos|Αποθηκεύτηκε στις Φωτογραφίες ✓
share.save_failed|Δεν ήταν δυνατή η αποθήκευση της εικόνας αναφοράς.
share.swipe_up|ΑΝΟΙΞΤΕ ΤΗΝ ΕΦΑΡΜΟΓΗ ΓΙΑ ΝΑ ΑΝΑΛΥΣΤΕ ΤΟ ΔΙΚΟ ΣΑΣ ΚΕΙΜΕΝΟ
share.report_heading|Αναφορά τυπογραφίας
share.score_prefix|Βαθμολογία
share.top_issues|Κορυφαία ζητήματα
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Το κείμενό σας περιέχει μόνο κενά. Δεν είναι εγκληματικό, αλλά είναι ύποπτο.
engine.non_latin_warning|Η ανάλυση είναι συντονισμένη για τυπογραφία λατινικής γραφής. Ορισμένοι κανόνες απόστασης και στίξης ενδέχεται να μην ισχύουν για αυτό το σύστημα γραφής.
engine.short_text_note|Ο εντοπισμός χηρείας και ορφανού είναι λιγότερο αξιόπιστος σε πολύ σύντομα αποσπάσματα.
engine.fix.single_space|Χρησιμοποιήστε ένα κενό διάστημα μετά τα σημεία στίξης που τελειώνουν τις προτάσεις.
engine.fix.replace_with|Αντικατάσταση με %@
engine.fix.normalize_spacing|Ομαλοποιήστε την απόσταση προτάσεων σε όλο το κείμενο.
engine.fix.rewrite_widow|Ξαναγράψτε ή επαναλάβετε τη ροή της παραγράφου για να αποφύγετε μια μονολεκτική τελική γραμμή.
engine.fix.rewrite_orphan|Προσαρμόστε το κοντινό αντίγραφο για να αποφύγετε μια μικροσκοπική γραμμή μεταφοράς.
engine.fix.change_font|Χρησιμοποιήστε μια πιο κατάλληλη γραμματοσειρά.
engine.explain.double_space|Αυτή η πρόταση τελειώνει με πολλά κενά, μια σύμβαση της εποχής της γραφομηχανής που δεν ανήκει στην αναλογική τυπογραφία.
engine.explain.straight_quotes|Αυτό το εισαγωγικό χρησιμοποιεί την ευθεία μορφή ASCII αντί για κατευθυντικά σγουρά εισαγωγικά.
engine.explain.hyphen_dash|Αυτή η διακοπή χρησιμοποιεί χαρακτήρες παύλα-μείον αντί για σωστή παύλα.
engine.explain.fake_ellipsis|Αυτή η σειρά περιόδων θα πρέπει να αντικατασταθεί με τον χαρακτήρα έλλειψης.
engine.explain.inconsistent_spacing|Αυτή η απόσταση προτάσεων διαφέρει από το κυρίαρχο μοτίβο στο κείμενο.
engine.explain.widow|Η παράγραφος τελειώνει με μια μεμονωμένη λέξη τελικής γραμμής, δημιουργώντας μια ορατή χήρα.
engine.explain.orphan|Αυτή η παράγραφος ξεκινά με μια πολύ σύντομη γραμμή μετά από μια μεγάλη προηγούμενη παράγραφο, η οποία πιθανότατα διαβάζεται ως ορφανή.
engine.explain.comic_sans|Comic Sans μεταδεδομένα βρέθηκαν στο εμπλουτισμένο κείμενο που υποβλήθηκε.
engine.explain.prime_marks|Αυτή η ένδειξη μέτρησης χρησιμοποιεί ένα εισαγωγικό ASCII αντί για ένα σωστό πρώτο σύμβολο.
engine.explain.multiplication_sign|Αυτή η διάσταση χρησιμοποιεί το γράμμα x όπου πρέπει να εμφανίζεται το σύμβολο πολλαπλασιασμού.
engine.explain.trademark_symbol|Αυτή η εναλλακτική σημείωση θα πρέπει να αντικατασταθεί με το κατάλληλο σύμβολο.
category.punctuation|Ζητήματα στίξης
category.spacing|Προβλήματα διαστήματος
category.layout|Προβλήματα διάταξης
category.font|Προβλήματα γραμματοσειράς
category.symbol|Ζητήματα συμβόλων
severity.infraction|ΠΑΡΑΒΙΑΣΗ
severity.misdemeanor|ΠΑΡΑΚΛΗΜΑ
severity.felony|FELONY
verdict.clean|ΚΑΘΑΡΙΣΜΟΣ
verdict.infraction|ΠΡΟΣΒΑΣΗ
verdict.misdemeanor|ΠΑΡΑΚΛΗΜΑ
verdict.felony|FELONY
verdict.capital|ΚΕΦΑΛΑΙΟΝ ΑΠΟΒΛΗΜΑ
strictness.lenient|Επιεικής
strictness.standard|Τυπικό
strictness.strict|Αυστηρή
theme.system|Σύστημα
theme.light|Φως
theme.dark|Σκοτεινό
dash.spaced|Διάστημα
dash.closed|Κλειστό
share_format.image|Εικόνα
share_format.story|Ιστορία
share_format.landscape|Τοπίο
share_format.text|Απλό κείμενο
share_format.link|Αντιγραφή συνδέσμου
share_format_desc.image|PNG εικόνα βελτιστοποιημένη για ροές κοινωνικής δικτύωσης.
share_format_desc.story|Αναφορά έτοιμη για ιστορία 1080×1920.
share_format_desc.landscape|Ευρεία κάρτα για προεπισκοπήσεις άρθρων και κοινωνικών δικτύων.
share_format_desc.text|Μορφοποιημένη σύνοψη κειμένου.
share_format_desc.link|Αντιγραφή σε βάθος συνδέσμου κράτησης θέσης.
evidence_source.typed|Δακτυλογραφημένο
evidence_source.pasted|Επικολλήθηκε
evidence_source.pasted_rich|Επικολλήθηκε εμπλουτισμένο κείμενο
toast.load_failed|Δεν ήταν δυνατή η φόρτωση των αποθηκευμένων αρχείων υπόθεσης.
toast.save_failed|Δεν ήταν δυνατή η αποθήκευση του αρχείου υπόθεσης.
toast.delete_failed|Η διαγραφή απέτυχε.
toast.cleared|Όλα τα αρχεία υποθέσεων διαγράφηκαν.
toast.clear_failed|Δεν ήταν δυνατή η εκκαθάριση των αρχείων υπόθεσης.
toast.export_failed|Η εξαγωγή απέτυχε.
"""),
        verdictShortLabels: verdictMap("""
clean|ΚΑΘΑΡΙΣΜΟΣ
infraction|ΠΡΟΣΒΑΣΗ
misdemeanor|ΠΑΡΑΚΛΗΜΑ
felony|FELONY
capitalOffense|ΚΕΦΑΛΑΙΟΝ ΑΠΟΒΛΗΜΑ
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Προβλήματα στίξης
spacing|Προβλήματα διαστήματος
layout|Ζητήματα διάταξης
font|Προβλήματα γραμματοσειράς
symbol|Ζητήματα συμβόλων
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Διπλά κενά
straightQuotes|Κατάλληλα εισαγωγικά
hyphenAsDash|Παύλα ως παύλα
fakeEllipsis|Ψεύτικη έλλειψη
widow|Χήρες
orphan|Ορφανά
inconsistentSpacing|Ασυνεπής απόσταση
comicSans|Comic Sans
primeMarks|Κύρια σημάδια
multiplicationSign|Λάθος πρόσημο πολλαπλασιασμού
trademarkSymbol|Κακή χρήση συμβόλου εμπορικού σήματος
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Επιπλέον κενά μετά τα σημεία στίξης που τελειώνουν τις προτάσεις.
straightQuotes|ASCII εισαγωγικά που χρησιμοποιούνται όπου ανήκουν τα σγουρά εισαγωγικά.
hyphenAsDash|Οι παύλες αντιπροσωπεύουν μια πραγματική παύλα.
fakeEllipsis|Χρησιμοποιήθηκαν τρεις τελείες αντί του χαρακτήρα έλλειψης.
widow|Έχει απομείνει μια τελευταία γραμμή με μία μόνο σύντομη λέξη.
orphan|Μια μικροσκοπική γραμμή μεταφοράς στην αρχή μιας παραγράφου.
inconsistentSpacing|Μικτά στυλ διάστιχου προτάσεων σε ένα κείμενο.
comicSans|Comic Sans εντοπίστηκε στα υποβληθέντα στοιχεία.
primeMarks|ASCII εισαγωγικά που χρησιμοποιούνται όπου ανήκουν τα πρώτα σύμβολα.
multiplicationSign|Το γράμμα x χρησιμοποιείται αντί του ×.
trademarkSymbol|Χρησιμοποιείται εναλλακτική σημείωση αντί για ©, ® ή ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Τα διπλά κενά μετά από μια πρόταση προέρχονται από τις συνήθειες της γραφομηχανής. Στο σύγχρονο αναλογικό τύπο, ένα διάστημα είναι η πιο καθαρή προεπιλογή.", "Τα επιπλέον κενά δημιουργούν ανομοιόμορφο ρυθμό και ορατά κενά σε μια παράγραφο.", "Οι γραφομηχανές χρησιμοποιούσαν χαρακτήρες σταθερού πλάτους, επομένως η πρόσθετη απόσταση κάποτε βοηθούσε τους αναγνώστες να βλέπουν διαλείμματα προτάσεων.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Αναζητήστε επαναλαμβανόμενα κενά μετά τα σημεία στίξης.", "Εκτελέστε ένα γρήγορο πάσο καθαρισμού πριν από την κοινή χρήση.", "Εάν τα διπλά κενά είναι σκόπιμα, διατηρήστε τα συνεπή."]),
            (.straightQuotes, "Τα ίσια εισαγωγικά είναι απλά ASCII σημάδια. Το ολοκληρωμένο κείμενο συνήθως διαβάζεται καλύτερα με κατευθυντικά σγουρά εισαγωγικά.", "Τα σγουρά εισαγωγικά φαίνονται πιο εκλεπτυσμένα και βελτιώνουν τον οπτικό ρυθμό μιας πρότασης.", "Τα πρώτα πληκτρολόγια και τα σύνολα χαρακτήρων διατήρησαν μόνο ένα απλό εισαγωγικό και για τις δύο κατευθύνσεις.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Ενεργοποιήστε τα έξυπνα σημεία στίξης όπου είναι διαθέσιμα.", "Εκκαθάριση κειμένου που έχει επικολληθεί από πηγές απλού κειμένου.", "Ελέγξτε τις μετρήσεις για να παραμείνουν σωστές οι κύριες ενδείξεις."]),
            (.hyphenAsDash, "Οι παύλες ενώνουν λέξεις, αλλά δεν υποκαθιστούν τις παύλες em ή τις παύλες en.", "Η σωστή παύλα βελτιώνει τον τόνο, την απόσταση και την αναγνωσιμότητα.", "Οι διπλές παύλες ήταν μια λύση σε συστήματα που δεν μπορούσαν εύκολα να παράγουν πλούσια σημεία στίξης.", "He paused -- dramatically.", "He paused — dramatically.", ["Χρησιμοποιήστε τον πραγματικό χαρακτήρα παύλας που απαιτεί το στυλ σας.", "Διατηρήστε παύλες για σύνθετα, όχι διαλείμματα προτάσεων.", "Μείνετε συνεπείς σε ολόκληρο το έγγραφο."]),
            (.fakeEllipsis, "Τρεις περίοδοι μπορούν να μιμηθούν μια έλλειψη, αλλά δεν είναι ο ίδιος χαρακτήρας.", "Μια πραγματική έλλειψη έχει ισορροπημένη απόσταση και συμπεριφέρεται καλύτερα σε μια γραμμή κειμένου.", "Πολλές ροές εργασίας περιστασιακής γραφής εξακολουθούν να πληκτρολογούν τρεις περιόδους από προεπιλογή.", "Wait...", "Wait…", ["Αντικαταστήστε τρεις τελείες με τον χαρακτήρα έλλειψης.", "Χρησιμοποιήστε αντικατάσταση κειμένου εάν το πληκτρολογείτε συχνά.", "Ελέγξτε το εισαγόμενο αντίγραφο πριν από τη δημοσίευση."]),
            (.widow, "Μια χήρα αφήνει μια σύντομη λέξη στην τελευταία γραμμή μιας παραγράφου.", "Αυτό το αδύναμο τέλος διαταράσσει το σχήμα και το ρυθμό της παραγράφου.", "Οι συντάκτες και οι σχεδιαστές έχουν προσαρμόσει εδώ και καιρό τις αλλαγές γραμμής για να αποφύγουν τις χήρες στην έντυπη έκδοση.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Σφίξτε ή ξαναγράψτε ελαφρώς την πρόταση.", "Προσαρμόστε το μήκος γραμμής εάν υπάρχουν διαθέσιμα εργαλεία διάταξης.", "Αντιμετώπισέ το ως μια σύσταση απαλού στυλ."]),
            (.orphan, "Το ορφανό είναι μια μικροσκοπική γραμμή μεταφοράς που ξεκινά άβολα μια νέα παράγραφο ή μπλοκ κειμένου.", "Διαταράσσει τη ροή ανάγνωσης και κάνει τη διάταξη να φαίνεται λιγότερο μελετημένη.", "Οι ροές εργασιών σύνταξης παραδοσιακά διορθώνουν τα ορφανά πριν από τη δημοσίευση.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Ξαναγράψτε μια κοντινή φράση για να εξισορροπήσετε ξανά το διάλειμμα.", "Ανοίξτε ελαφρά το μέτρο εάν ελέγχετε τη διάταξη.", "Χρησιμοποιήστε το ως προειδοποίηση, όχι ως άκαμπτο σφάλμα."]),
            (.inconsistentSpacing, "Η ανάμειξη μονής και διπλής απόστασης προτάσεων κάνει το κείμενο να αισθάνεται ραμμένο από διαφορετικές πηγές.", "Οι αναγνώστες παρατηρούν την ασυνέπεια γρήγορα, ακόμη και όταν δεν μπορούν να εξηγήσουν το γιατί.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Επιλέξτε ένα στυλ διάστιχου προτάσεων.", "Κανονικοποιήστε το επικολλημένο κείμενο πριν το μοιραστείτε.", "Διατηρήστε την επιλογή συνεπή από την αρχή μέχρι το τέλος."]),
            (.comicSans, "Comic Sans δεν απαγορεύεται, αλλά έχει έντονο πολιτιστικό τόνο που συχνά έρχεται σε σύγκρουση με σοβαρή αντιγραφή.", "Οι γραμματοσειρές μεταδίδουν τη διάθεση πριν καν ο αναγνώστης επεξεργαστεί τις λέξεις.", "Comic Sans σχεδιάστηκε το 1994 για μια διεπαφή λογισμικού για παιδιά και αργότερα εξαπλώθηκε πολύ πέρα από αυτό το πλαίσιο.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Επιλέξτε μια γραμματοσειρά που ταιριάζει στο μήνυμα.", "Διατηρήστε τα παιχνιδιάρικα πρόσωπα για ξεκάθαρα παιχνιδιάρικη δουλειά.", "Απενεργοποιήστε αυτόν τον ανιχνευτή εάν η επιλογή είναι σκόπιμη."]),
            (.primeMarks, "Οι μετρήσεις όπως τα πόδια, οι ίντσες, τα λεπτά και τα δευτερόλεπτα χρειάζονται συχνά πρωταρχικά σύμβολα αντί για εισαγωγικά.", "Η σωστή ένδειξη αποτρέπει την ασάφεια και κάνει το τεχνικό κείμενο να φαίνεται πιο σκόπιμο.", nil, "5'11\"", "5′11″", ["Χρησιμοποιήστε σύμβολα πρώτου και διπλού πρώτου μετά τους αριθμούς.", "Παρακολουθήστε την αυτόματη μετατροπή έξυπνης προσφοράς.", "Ελέγξτε προσεκτικά τις προδιαγραφές, τα μενού και τις διαστάσεις του προϊόντος."]),
            (.multiplicationSign, "Το γράμμα x και το σύμβολο του πολλαπλασιασμού δεν είναι εναλλάξιμα σε διαστάσεις.", "Η χρήση του × δίνει στο τεχνικό αντίγραφο και στο αντίγραφο προϊόντος ένα πιο καθαρό τυπογραφικό φινίρισμα.", nil, "1920x1080", "1920×1080", ["Αντικαταστήστε το x μεταξύ των αριθμών με ×.", "Χρησιμοποιήστε αντικατάσταση κειμένου για συνήθεις μορφές μεγέθους.", "Ελέγξτε τις προδιαγραφές και τα στοιχεία μάρκετινγκ για συνέπεια."]),
            (.trademarkSymbol, "Οι φόρμες όπως (c), (r) και (tm) αποτελούν εναλλακτική σημείωση, όχι γυαλισμένο τελικό αντίγραφο.", "Τα κατάλληλα σύμβολα εξοικονομούν χώρο και κάνουν το νομικό κείμενο ή το κείμενο επωνυμίας να φαίνεται ολοκληρωμένο.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Αντικαταστήστε τον εναλλακτικό συμβολισμό με ©, ® και ™.", "Ελέγξτε το νόμιμο αντίγραφο και το μάρκετινγκ πριν από την κυκλοφορία.", "Διατηρήστε την απόσταση γύρω από αυτά τα σύμβολα συνεπή."])
        ])
    )
}
