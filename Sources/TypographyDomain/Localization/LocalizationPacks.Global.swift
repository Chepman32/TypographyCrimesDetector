import Foundation

extension L10n {
    static let arabicPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|مختبر الجريمة
app.tab.case_files|ملفات الحالة
app.tab.learn|تعلم
app.tab.settings|الإعدادات
counts.crimes_categories|الجرائم: %@ · الفئات: %@
counts.detected_issues|المشكلات التي تم اكتشافها: %@
counts.entries|الإدخالات: %@
counts.characters|الشخصيات: %@
counts.line_column|السطر %@ · العمود %@
counts.crimes_verdict|الجرائم: %@ · %@
share.offense_line|• %@: %@
general.done|تم
general.cancel|إلغاء
general.retry|إعادة المحاولة
general.next|التالي
general.skip|تخطي
general.got_it|فهمت
general.coming_soon|قريبًا
general.wrong|خطأ
general.right|يمين
history.empty_title|لا توجد حالات حتى الآن
history.empty_subtitle|قم بإجراء فحص وستظهر ملفات حالتك هنا.
history.share|مشاركة
history.delete|حذف
history.title|ملفات القضية
history.today|اليوم
history.yesterday|أمس
history.this_week|هذا الأسبوع
history.this_month|هذا الشهر
history.select_all|حدد الكل
history.delete_selected|حذف المحدد
learn.title|المكتبة القانونية
learn.search_prompt|البحث عن أنواع الجرائم
learn.empty_title|لم يتم العثور على جرائم مطابقة
learn.empty_subtitle|جرّب مصطلح بحث مختلف.
learn.what_is_this|ما هذه المشكلة؟
learn.why_it_matters|سبب أهميته
learn.history_origin|التاريخ والسياق
learn.how_to_fix|كيفية إصلاحها
learn.default_why|الطباعة الجيدة هي نظام من التفاصيل المدروسة.
learn.default_fix|استخدم الحرف الصحيح وحافظ على اتساق المستند.
input.method|أسلوب الإدخال
input.method.paste|لصق / كتابة
input.method.camera|الكاميرا (OCR)
input.placeholder|الصق أو اكتب النص الخاص بك هنا...
input.paste_from_clipboard|لصق من الحافظة
input.title|إرسال الأدلة
input.analyze|تحليل
input.analyze_evidence|تحليل الأدلة
input.camera_message|سيأتي التعرف على النص المعتمد على الكاميرا في تحديث مستقبلي. في الوقت الحالي، الصق النص أو اكتبه لتحليله.
input.trimmed_warning|تم اقتطاع النص إلى 100000 حرف.
input.clipboard_empty|الحافظة فارغة. انسخ بعض النص أولاً.
input.no_text|لا يوجد نص لتحليله. الصق أو اكتب بعض النص أولاً.
home.new_investigation|تحقيق جديد
home.new_investigation_subtitle|الصق النص أو اكتبه لبدء تحليل الطباعة الجنائية
home.new_investigation_badge|لصق · النوع · التحليل
home.recent_cases|الحالات الأخيرة
home.see_all|رؤية الكل →
home.empty_title|لا توجد حالات حتى الآن
home.empty_subtitle|ابدأ التحقيق الأول.
home.begin_investigation|بدء التحقيق
home.stat.scans|عمليات المسح
home.stat.crimes|الجرائم
home.stat.avg|المتوسط
onboarding.splash_tagline|كل حرف رسومي هو دليل.
onboarding.page1.title|لصق. تحليل. مراجعة.
onboarding.page1.body|أدخل أي نص وسيقوم التطبيق بوضع علامة على المشكلات المطبعية المخفية على مرأى من الجميع.
onboarding.page2.title|نحن نلاحظ ما يخطئه التدقيق الإملائي
onboarding.page2.body|تظهر هنا علامات الاقتباس المستقيمة، وعلامات الحذف الزائفة، والواصلات التي تبدو وكأنها شرطات ممتدة، والمسافات غير المتناسقة.
onboarding.page3.title|احصل على نتيجة جريمتك
onboarding.page3.body|تعرف على مدى نظافة أسلوب الطباعة لديك، ثم شارك الحكم.
onboarding.page4.title|التعلم أثناء التقدم
onboarding.page4.body|افتح أي مشكلة لمعرفة سبب أهميتها وكيفية حلها.
onboarding.start|بدء التحقيق
onboarding.sample.not_em_dash|ليست شرطة طويلة
onboarding.library.investigate|تحقيق
onboarding.library.study|ادرس القواعد
analysis.failed_title|فشل التحليل
analysis.failed_body|حدث خطأ ما أثناء الفحص. يرجى المحاولة مرة أخرى.
analysis.status.scan|البحث عن الأدلة المطبعية...
analysis.status.quotes|التحقق من علامات الاقتباس...
analysis.status.dashes|التحقق من استخدام الشرطة…
analysis.status.ellipsis|التحقق من علامات الحذف...
analysis.status.spacing|التحقق من تناسق التباعد...
analysis.status.layout|فحص الأرامل والأيتام…
analysis.status.comic_sans|التحقق من البيانات الوصفية للخط...
analysis.status.compiling|تجميع التقرير...
mugshot.title|تم وضع علامة سوء السلوك المطبعي عليه
mugshot.body|تم العثور على Comic Sans في الأدلة المقدمة. يمكن أن ينجح هذا الأمر في السياقات المرحة، ولكن في معظم إعدادات المنتج والتحرير، يُنظر إليه على أنه غير متطابق.
mugshot.continue|فتح التقرير الكامل →
report.breakdown|انهيار الجريمة
report.share|مشاركة التقرير
report.new_scan|فحص جديد
report.close|إغلاق التقرير
report.copy_fixed|نسخ النص الثابت
report.copy_fixed_hint|نسخ النص المصحح الحالي.
report.clean_title|ناصعة
report.clean_body|لم يتم اكتشاف أية مشكلات مطبعية. هذا النص هو المواطن النموذجي.
report.replace_single_space|استبدل بمسافة واحدة
report.fixed_text_copied|تم نسخ النص الثابت ✓
report.manual_rewrite|تحتاج هذه المشكلة إلى إعادة كتابة يدوية.
report.apply_failed|تعذر تطبيق هذا الإصلاح.
report.issue_fixed|تم إصلاح المشكلة وتحديث التقرير ✓
report.learn_more|مزيد من المعلومات حول هذه المشكلة →
settings.detection_rules|قواعد الكشف
settings.scoring|التسجيل
settings.strictness|صرامة التسجيل
settings.dash_style|نمط شرطة ممتدة
settings.appearance|المظهر
settings.theme|الموضوع
settings.haptics|الملاحظات اللمسية
settings.sounds|مؤثرات صوتية
settings.data|البيانات
settings.clear_all|مسح كافة ملفات الحالة
settings.export_all|تصدير كافة التقارير
settings.about|حول
settings.version|الإصدار
settings.typpo|Typpo
settings.rate_app|السعر على App Store
settings.send_feedback|إرسال تعليقات
settings.privacy|سياسة الخصوصية
settings.footer|مصنوع بعناية ومع اقتباسات مجعدة مناسبة.
settings.title|الإعدادات
settings.clear_confirm_title|مسح كافة ملفات القضية؟
settings.clear_confirm_message|لا يمكن التراجع عن هذا الإجراء.
settings.delete_all|حذف الكل
settings.about_body|تحليل الطب الشرعي للنص الخاص بك. الصق أي نص واحصل على نتيجتك وشارك الحكم.
settings.about_placeholder|هذا الإصدار غير متصل بالإنترنت بشكل كامل ولا يزال يستخدم روابط إصدار العنصر النائب لموقع الويب، وسياسة الخصوصية، ووجهة App Store.
settings.about_website|الموقع الإلكتروني: %@
share.title|مشاركة التقرير
share.copy_report_image|نسخ صورة التقرير
share.save_to_photos|حفظ في الصور
share.copy_report_text|نسخ نص التقرير
share.photos_needed|يلزم الوصول إلى الصور
share.open_settings|افتح الإعدادات
share.photos_message|يلزم الوصول إلى الصور لحفظ صورة التقرير. افتح الإعدادات لمنح حق الوصول.
share.primary.share_text|مشاركة النص
share.primary.copy_link|انسخ الرابط
share.primary.share|مشاركة
share.copied_clipboard|تم النسخ إلى الحافظة ✓
share.deep_link_copied|تم نسخ الرابط العميق ✓
share.render_failed|تعذر عرض صورة التقرير.
share.saved_photos|تم الحفظ في الصور ✓
share.save_failed|تعذر حفظ صورة التقرير.
share.swipe_up|افتح التطبيق لتحليل النص الخاص بك
share.report_heading|تقرير الطباعة
share.score_prefix|النتيجة
share.top_issues|أهم المشكلات
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|يحتوي النص الخاص بك على مسافة بيضاء فقط. إنها ليست إجرامية، ولكنها مشبوهة.
engine.non_latin_warning|تم ضبط التحليل ليناسب أسلوب الطباعة بالأحرف اللاتينية. قد لا تنطبق بعض قواعد المسافات وعلامات الترقيم على نظام الكتابة هذا.
engine.short_text_note|يكون اكتشاف الأرملة والأيتام أقل موثوقية في المقاطع القصيرة جدًا.
engine.fix.single_space|استخدم مسافة واحدة بعد علامات الترقيم في نهاية الجملة.
engine.fix.replace_with|استبدل بـ %@
engine.fix.normalize_spacing|تطبيع المسافات بين الجمل في النص بأكمله.
engine.fix.rewrite_widow|أعد كتابة الفقرة أو أعد تدفقها لتجنب السطر الأخير المكون من كلمة واحدة.
engine.fix.rewrite_orphan|اضبط النسخة القريبة لتجنب وجود خط ترحيل صغير.
engine.fix.change_font|استخدم خطًا أكثر ملاءمة.
engine.explain.double_space|تنتهي هذه الجملة بمسافات متعددة، وهو تقليد لعصر الآلة الكاتبة ولا ينتمي إلى الطباعة المتناسبة.
engine.explain.straight_quotes|تستخدم علامة الاقتباس هذه نموذج ASCII المستقيم بدلاً من علامات الاقتباس المتعرجة الاتجاهية.
engine.explain.hyphen_dash|تستخدم هذه المقاطعة أحرف واصلة ناقص بدلاً من شرطة مناسبة.
engine.explain.fake_ellipsis|يجب استبدال سلسلة النقاط هذه بحرف القطع.
engine.explain.inconsistent_spacing|يختلف تباعد الجملة هذا عن النمط السائد في النص.
engine.explain.widow|تنتهي الفقرة بكلمة معزولة في السطر الأخير، مما يؤدي إلى إنشاء أرملة مرئية.
engine.explain.orphan|تبدأ هذه الفقرة بسطر قصير جدًا بعد فقرة طويلة سابقة، والتي من المحتمل أن تُقرأ على أنها يتيمة.
engine.explain.comic_sans|تم العثور على البيانات الوصفية Comic Sans في النص المنسق المقدم.
engine.explain.prime_marks|تستخدم علامة القياس هذه علامة الاقتباس ASCII بدلاً من الرمز الأولي المناسب.
engine.explain.multiplication_sign|يستخدم هذا البعد الحرف x حيث يجب أن تظهر علامة الضرب.
engine.explain.trademark_symbol|يجب استبدال هذا الترميز الاحتياطي بالرمز المناسب.
category.punctuation|مشكلات علامات الترقيم
category.spacing|مشكلات التباعد
category.layout|مشكلات التخطيط
category.font|مشكلات الخط
category.symbol|مشكلات الرموز
severity.infraction|مخالفة
severity.misdemeanor|جنحة
severity.felony|جناية
verdict.clean|نظيف
verdict.infraction|مخالفة
verdict.misdemeanor|جنحة
verdict.felony|جناية
verdict.capital|جريمة كبرى
strictness.lenient|متساهل
strictness.standard|قياسي
strictness.strict|صارم
theme.system|النظام
theme.light|الضوء
theme.dark|مظلم
dash.spaced|متباعدة
dash.closed|مغلق
share_format.image|صورة
share_format.story|القصة
share_format.landscape|المناظر الطبيعية
share_format.text|نص عادي
share_format.link|انسخ الرابط
share_format_desc.image|صورة PNG محسنة للخلاصات الاجتماعية.
share_format_desc.story|تقرير جاهز للقصة مقاس 1080×1920.
share_format_desc.landscape|بطاقة عريضة للمقالات والمعاينات الاجتماعية.
share_format_desc.text|ملخص نصي منسق.
share_format_desc.link|نسخة رابط عميق للعنصر النائب.
evidence_source.typed|مكتوب
evidence_source.pasted|تم اللصق
evidence_source.pasted_rich|تم لصق نص منسق
toast.load_failed|تعذر تحميل ملفات الحالة المحفوظة.
toast.save_failed|تعذر حفظ ملف الحالة.
toast.delete_failed|فشل الحذف.
toast.cleared|تم مسح كافة ملفات القضية.
toast.clear_failed|تعذر مسح ملفات الحالة.
toast.export_failed|فشل التصدير.
"""),
        verdictShortLabels: verdictMap("""
clean|نظيف
infraction|مخالفة
misdemeanor|جنحة
felony|جناية
capitalOffense|جريمة كبرى
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|مشكلات علامات الترقيم
spacing|مشكلات التباعد
layout|مشكلات التخطيط
font|مشكلات الخط
symbol|مشكلات الرموز
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|المسافات المزدوجة
straightQuotes|الاقتباسات المستقيمة
hyphenAsDash|الواصلة مثل الشرطة
fakeEllipsis|حذف مزيف
widow|الأرامل
orphan|الأيتام
inconsistentSpacing|تباعد غير متناسق
comicSans|Comic Sans
primeMarks|العلامات الأولية
multiplicationSign|علامة الضرب خاطئة
trademarkSymbol|إساءة استخدام رمز العلامة التجارية
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|المسافات الزائدة بعد علامات الترقيم في نهاية الجملة.
straightQuotes|ASCII علامات الاقتباس المستخدمة حيث تنتمي علامات الاقتباس المتعرجة.
hyphenAsDash|الواصلات تمثل شرطة حقيقية.
fakeEllipsis|تم استخدام ثلاث نقاط بدلاً من حرف القطع.
widow|يتبقى سطر أخير بكلمة قصيرة واحدة فقط.
orphan|سطر ترحيل صغير في بداية الفقرة.
inconsistentSpacing|أنماط تباعد الجمل المختلطة في نص واحد.
comicSans|تم اكتشاف Comic Sans في الأدلة المقدمة.
primeMarks|ASCII علامات الاقتباس المستخدمة حيث تنتمي الرموز الأولية.
multiplicationSign|تم استخدام الحرف x بدلاً من ×.
trademarkSymbol|يتم استخدام الترميز الاحتياطي بدلاً من © أو ® أو ™.
"""),
        articles: articleMap([
            (.doubleSpace, "المسافات المزدوجة بعد الجملة تأتي من عادات الآلة الكاتبة. في الكتابة المتناسبة الحديثة، مسافة واحدة هي المسافة الافتراضية الأنظف.", "تؤدي المسافات الزائدة إلى إنشاء إيقاع غير متساوٍ وفجوات مرئية في الفقرة.", "تستخدم الآلات الكاتبة أحرفًا ذات عرض ثابت، لذلك تساعد المسافات الإضافية القراء على رؤية فواصل الجمل.", "The case is closed.  Move on.", "The case is closed. Move on.", ["البحث عن المسافات المتكررة بعد علامات الترقيم.", "قم بتشغيل تمريرة تنظيف سريعة قبل المشاركة.", "إذا كانت المسافات المزدوجة مقصودة، فاجعلها متسقة."]),
            (.straightQuotes, "علامات الاقتباس المستقيمة هي علامات ASCII عادية. عادةً ما تتم قراءة النص النهائي بشكل أفضل مع علامات الاقتباس المتعرجة الاتجاهية.", "تبدو علامات الاقتباس المتعرجة أكثر صقلًا وتحسن الإيقاع البصري للجملة.", "احتفظت لوحات المفاتيح ومجموعات الأحرف المبكرة بعلامة اقتباس بسيطة واحدة فقط لكلا الاتجاهين.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["قم بتشغيل علامات الترقيم الذكية حيثما كان ذلك متاحًا.", "تنظيف النص الملصق من مصادر النص العادي.", "تحقق من القياسات حتى تظل العلامات الأولية صحيحة."]),
            (.hyphenAsDash, "تربط الواصلات الكلمات، ولكنها ليست بديلاً للشرطات الطويلة أو الشرطات القصيرة.", "تعمل الشرطة الصحيحة على تحسين النغمة والتباعد وسهولة القراءة.", "كانت الواصلات المزدوجة بمثابة حل بديل في الأنظمة التي لا يمكنها إنتاج علامات ترقيم غنية بسهولة.", "He paused -- dramatically.", "He paused — dramatically.", ["استخدم حرف الشرطة الحقيقي الذي يتطلبه أسلوبك.", "احتفظ بالواصلات للمركبات، وليس فواصل الجمل.", "حافظ على الاتساق عبر المستند بأكمله."]),
            (.fakeEllipsis, "يمكن لثلاث نقاط أن تحاكي علامة الحذف، ولكنها ليست نفس الحرف.", "تحتوي علامات الحذف الحقيقية على مسافات متوازنة وتعمل بشكل أفضل في سطر النص.", "لا يزال العديد من سير عمل الكتابة غير الرسمي يكتب ثلاث فترات بشكل افتراضي.", "Wait...", "Wait…", ["استبدل ثلاث نقاط بحرف القطع.", "استخدم استبدال النص إذا كنت تكتبه كثيرًا.", "التحقق من النسخة المستوردة قبل النشر."]),
            (.widow, "تترك الأرملة كلمة قصيرة عالقة في السطر الأخير من الفقرة.", "تؤدي هذه النهاية الضعيفة إلى تعطيل شكل وإيقاع الفقرة.", "قام المحررون والمصممون بتعديل فواصل الأسطر الطويلة لتجنب الترمل في الطباعة.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["قم بتشديد الجملة أو إعادة كتابتها قليلاً.", "اضبط طول السطر إذا كانت أدوات التخطيط متاحة.", "تعامل مع هذا باعتباره توصية ذات أسلوب ناعم."]),
            (.orphan, "الخط اليتيم هو سطر صغير يتم ترحيله ويبدأ فقرة جديدة أو كتلة نصية بشكل غريب.", "إنه يعطل تدفق القراءة ويجعل التخطيط يبدو أقل اهتمامًا.", "عادةً ما تعمل عمليات سير العمل التحريري على إصلاح المشكلات المعزولة قبل النشر.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["أعد كتابة عبارة قريبة لإعادة التوازن إلى الفاصل.", "افتح المقياس قليلاً إذا كنت تتحكم في التخطيط.", "استخدمه كتحذير، وليس كخطأ صارم."]),
            (.inconsistentSpacing, "يؤدي المزج بين المسافات بين الجمل المفردة والمزدوجة إلى جعل النص يبدو متماسكًا معًا من مصادر مختلفة.", "يلاحظ القراء عدم الاتساق بسرعة، حتى عندما لا يستطيعون تفسير السبب.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["اختر نمطًا واحدًا لتباعد الجمل.", "تطبيع النص الملصق قبل مشاركته.", "حافظ على اتساق الاختيار من البداية إلى النهاية."]),
            (.comicSans, "Comic Sans ليس ممنوعًا، لكنه يحمل نبرة ثقافية قوية غالبًا ما تتعارض مع النسخ الجادة.", "تقوم الخطوط بتوصيل الحالة المزاجية قبل أن يعالج القارئ الكلمات.", "تم تصميم Comic Sans في عام 1994 لواجهة برامج الأطفال وانتشرت لاحقًا إلى ما هو أبعد من هذا السياق.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["اختر محرفًا يناسب الرسالة.", "احتفظ بوجوه العرض المرحة للعمل المرح بشكل واضح.", "قم بتعطيل هذا الكاشف إذا كان الاختيار مقصودًا."]),
            (.primeMarks, "غالبًا ما تحتاج القياسات مثل القدم والبوصة والدقائق والثواني إلى رموز أولية بدلاً من علامات الاقتباس.", "العلامة الصحيحة تمنع الغموض وتجعل النص الفني يبدو أكثر تعمدًا.", nil, "5'11\"", "5′11″", ["استخدم الرموز الأولية والمزدوجة بعد الأرقام.", "راقب التحويل التلقائي لعروض الأسعار الذكية.", "تحقق بعناية من المواصفات والقوائم وأبعاد المنتج."]),
            (.multiplicationSign, "لا يمكن تبديل أبعاد الحرف x وعلامة الضرب.", "يعطي استخدام × نسخة فنية ونسخة المنتج لمسة نهائية مطبعية أكثر وضوحًا.", nil, "1920x1080", "1920×1080", ["استبدل x بين الأرقام بـ ×.", "استخدم استبدال النص لتنسيقات الحجم الشائع.", "راجع المواصفات والأصول التسويقية للتأكد من اتساقها."]),
            (.trademarkSymbol, "النماذج مثل (c)، و(r)، و(tm) هي تدوين احتياطي، وليست نسخة نهائية مصقولة.", "توفر الرموز المناسبة المساحة وتجعل النص القانوني أو نص العلامة التجارية يبدو مكتملاً.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["استبدل التدوين الاحتياطي بـ © و® و™.", "التحقق من النسخة القانونية والتسويقية قبل الإصدار.", "حافظ على اتساق المسافات حول هذه الرموز."])
        ])
    )

    static let hindiPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|क्राइम लैब
app.tab.case_files|केस फ़ाइलें
app.tab.learn|सीखें
app.tab.settings|सेटिंग्स
counts.crimes_categories|अपराध: %@ · श्रेणियाँ: %@
counts.detected_issues|पता चली समस्याएं: %@
counts.entries|प्रविष्टियाँ: %@
counts.characters|अक्षर: %@
counts.line_column|लाइन %@ · कर्नल %@
counts.crimes_verdict|अपराध: %@ · %@
share.offense_line|• %@: %@
general.done|हो गया
general.cancel|रद्द करें
general.retry|पुनः प्रयास करें
general.next|अगला
general.skip|छोड़ें
general.got_it|समझ गया
general.coming_soon|जल्द ही आ रहा है
general.wrong|गलत
general.right|सही
history.empty_title|अभी तक कोई मामला नहीं
history.empty_subtitle|एक स्कैन चलाएं और आपकी केस फ़ाइलें यहां दिखाई देंगी।
history.share|साझा करें
history.delete|हटाएं
history.title|केस फ़ाइलें
history.today|आज
history.yesterday|कल
history.this_week|इस सप्ताह
history.this_month|इस महीने
history.select_all|सभी का चयन करें
history.delete_selected|चयनित हटाएं
learn.title|द लॉ लाइब्रेरी
learn.search_prompt|अपराध के प्रकार खोजें
learn.empty_title|कोई मेल खाता अपराध नहीं मिला
learn.empty_subtitle|कोई भिन्न खोज शब्द आज़माएँ।
learn.what_is_this|यह समस्या क्या है?
learn.why_it_matters|यह क्यों मायने रखता है
learn.history_origin|इतिहास और संदर्भ
learn.how_to_fix|इसे कैसे ठीक करें
learn.default_why|अच्छी टाइपोग्राफी विचारशील विवरणों की एक प्रणाली है।
learn.default_fix|सही वर्ण का उपयोग करें और दस्तावेज़ को सुसंगत रखें।
input.method|इनपुट विधि
input.method.paste|चिपकाएँ / टाइप करें
input.method.camera|कैमरा (OCR)
input.placeholder|अपना टेक्स्ट यहां पेस्ट करें या टाइप करें...
input.paste_from_clipboard|क्लिपबोर्ड से चिपकाएँ
input.title|साक्ष्य जमा करें
input.analyze|विश्लेषण करें
input.analyze_evidence|साक्ष्य का विश्लेषण करें
input.camera_message|कैमरा-आधारित टेक्स्ट पहचान भविष्य के अपडेट में आ रही है। अभी के लिए, विश्लेषण करने के लिए अपना टेक्स्ट पेस्ट करें या टाइप करें।
input.trimmed_warning|पाठ को 100,000 वर्णों तक छोटा कर दिया गया।
input.clipboard_empty|क्लिपबोर्ड खाली है. पहले कुछ टेक्स्ट कॉपी करें.
input.no_text|विश्लेषण के लिए कोई पाठ नहीं। पहले कुछ टेक्स्ट पेस्ट करें या टाइप करें।
home.new_investigation|नई जांच
home.new_investigation_subtitle|फोरेंसिक टाइपोग्राफी विश्लेषण शुरू करने के लिए टेक्स्ट पेस्ट करें या टाइप करें
home.new_investigation_badge|चिपकाएं · प्रकार · विश्लेषण करें
home.recent_cases|हाल के मामले
home.see_all|सभी देखें →
home.empty_title|अभी तक कोई मामला नहीं
home.empty_subtitle|अपनी पहली जांच शुरू करें।
home.begin_investigation|जांच शुरू करें
home.stat.scans|स्कैन
home.stat.crimes|अपराध
home.stat.avg|औसत
onboarding.splash_tagline|प्रत्येक ग्लिफ़ साक्ष्य है।
onboarding.page1.title|चिपकाएं. विश्लेषण करें. समीक्षा.
onboarding.page1.body|किसी भी टेक्स्ट को डालें और ऐप सादे दृश्य में छिपी हुई टाइपोग्राफ़िक समस्याओं को चिह्नित करेगा।
onboarding.page2.title|हम वह पकड़ लेते हैं जो वर्तनी जांच में छूट जाता है
onboarding.page2.body|सीधे उद्धरण, नकली दीर्घवृत्त, उन्हें डैश दिखाने वाले हाइफ़न और असंगत रिक्ति सभी यहां दिखाई देते हैं।
onboarding.page3.title|अपना अपराध स्कोर प्राप्त करें
onboarding.page3.body|देखें कि आपकी टाइपोग्राफी कितनी साफ़ है, फिर निर्णय साझा करें।
onboarding.page4.title|जैसे-जैसे आप आगे बढ़ते हैं, सीखते जाएं
onboarding.page4.body|यह देखने के लिए कोई भी समस्या खोलें कि यह क्यों महत्वपूर्ण है और इसे कैसे ठीक किया जाए।
onboarding.start|जांच शुरू करें
onboarding.sample.not_em_dash|एम डैश नहीं
onboarding.library.investigate|जांच
onboarding.library.study|नियमों का अध्ययन करें
analysis.failed_title|विश्लेषण विफल
analysis.failed_body|स्कैन के दौरान कुछ गड़बड़ हो गई। कृपया पुनः प्रयास करें.
analysis.status.scan|टाइपोग्राफ़िक साक्ष्य के लिए स्कैनिंग...
analysis.status.quotes|उद्धरण चिह्नों की जाँच कर रहा है...
analysis.status.dashes|डैश उपयोग की जाँच कर रहा है...
analysis.status.ellipsis|दीर्घवृत्त की जाँच हो रही है...
analysis.status.spacing|स्पेसिंग कंसिस्टेंसी की जांच की जा रही है...
analysis.status.layout|विधवाओं और अनाथों की जाँच…
analysis.status.comic_sans|फ़ॉन्ट मेटाडेटा की जाँच कर रहा है…
analysis.status.compiling|रिपोर्ट संकलित की जा रही है...
mugshot.title|टाइपोग्राफ़िक कदाचार के लिए चिह्नित
mugshot.body|प्रस्तुत साक्ष्य में Comic Sans पाया गया। चंचल संदर्भों में यह काम कर सकता है, लेकिन अधिकांश उत्पाद और संपादकीय सेटिंग्स में यह एक बेमेल के रूप में पढ़ा जाता है।
mugshot.continue|पूरी रिपोर्ट खोलें →
report.breakdown|अपराध विश्लेषण
report.share|रिपोर्ट साझा करें
report.new_scan|नया स्कैन
report.close|रिपोर्ट बंद करें
report.copy_fixed|निश्चित पाठ को कॉपी करें
report.copy_fixed_hint|वर्तमान संशोधित पाठ की प्रतिलिपि बनाता है।
report.clean_title|बेदाग
report.clean_body|कोई मुद्रण संबंधी समस्या नहीं पाई गई। यह पाठ एक आदर्श नागरिक है.
report.replace_single_space|एकल स्थान से बदलें
report.fixed_text_copied|निश्चित पाठ कॉपी किया गया ✓
report.manual_rewrite|इस समस्या को मैन्युअल रूप से पुनः लिखने की आवश्यकता है।
report.apply_failed|यह सुधार लागू नहीं किया जा सका.
report.issue_fixed|समस्या ठीक कर दी गई है और रिपोर्ट अपडेट कर दी गई है ✓
report.learn_more|इस समस्या के बारे में और जानें →
settings.detection_rules|पता लगाने के नियम
settings.scoring|स्कोरिंग
settings.strictness|स्कोरिंग सख्ती
settings.dash_style|एम-डैश स्टाइल
settings.appearance|सूरत
settings.theme|थीम
settings.haptics|हैप्टिक फीडबैक
settings.sounds|ध्वनि प्रभाव
settings.data|डेटा
settings.clear_all|सभी केस फ़ाइलें साफ़ करें
settings.export_all|सभी रिपोर्ट निर्यात करें
settings.about|के बारे में
settings.version|संस्करण
settings.typpo|Typpo
settings.rate_app|App Store पर रेट करें
settings.send_feedback|प्रतिक्रिया भेजें
settings.privacy|गोपनीयता नीति
settings.footer|सावधानीपूर्वक और उचित घुंघराले उद्धरणों के साथ बनाया गया।
settings.title|सेटिंग्स
settings.clear_confirm_title|सभी केस फ़ाइलें साफ़ करें?
settings.clear_confirm_message|यह क्रिया पूर्ववत नहीं की जा सकती.
settings.delete_all|सभी हटाएं
settings.about_body|आपके पाठ के लिए फोरेंसिक विश्लेषण। कोई भी टेक्स्ट चिपकाएँ, अपना स्कोर प्राप्त करें, और निर्णय साझा करें।
settings.about_placeholder|यह बिल्ड पूरी तरह से ऑफ़लाइन है और अभी भी वेबसाइट, गोपनीयता नीति और App Store गंतव्य के लिए प्लेसहोल्डर रिलीज़ लिंक का उपयोग करता है।
settings.about_website|वेबसाइट: %@
share.title|रिपोर्ट साझा करें
share.copy_report_image|रिपोर्ट छवि कॉपी करें
share.save_to_photos|फ़ोटो में सहेजें
share.copy_report_text|रिपोर्ट टेक्स्ट कॉपी करें
share.photos_needed|फ़ोटो एक्सेस की आवश्यकता है
share.open_settings|सेटिंग्स खोलें
share.photos_message|रिपोर्ट छवि को सहेजने के लिए फ़ोटो एक्सेस की आवश्यकता है। पहुंच प्रदान करने के लिए सेटिंग्स खोलें।
share.primary.share_text|पाठ साझा करें
share.primary.copy_link|लिंक कॉपी करें
share.primary.share|साझा करें
share.copied_clipboard|क्लिपबोर्ड पर कॉपी किया गया ✓
share.deep_link_copied|डीप लिंक कॉपी किया गया ✓
share.render_failed|रिपोर्ट छवि प्रस्तुत नहीं कर सका।
share.saved_photos|फ़ोटो में सहेजा गया ✓
share.save_failed|रिपोर्ट छवि सहेजी नहीं जा सकी.
share.swipe_up|अपने पाठ का विश्लेषण करने के लिए ऐप खोलें
share.report_heading|टाइपोग्राफी रिपोर्ट
share.score_prefix|स्कोर
share.top_issues|प्रमुख मुद्दे
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|आपके पाठ में केवल रिक्त स्थान है। यह आपराधिक नहीं है, लेकिन संदिग्ध है.
engine.non_latin_warning|विश्लेषण को लैटिन-लिपि टाइपोग्राफी के लिए ट्यून किया गया है। कुछ रिक्ति और विराम चिह्न नियम इस लेखन प्रणाली पर लागू नहीं हो सकते हैं।
engine.short_text_note|बहुत छोटे अंशों में विधवा और अनाथ का पता लगाना कम विश्वसनीय है।
engine.fix.single_space|वाक्य के अंत में विराम चिह्न के बाद एकल स्थान का उपयोग करें।
engine.fix.replace_with|%@ से बदलें
engine.fix.normalize_spacing|पूरे पाठ में वाक्य रिक्ति को सामान्य करें।
engine.fix.rewrite_widow|एक शब्द वाली अंतिम पंक्ति से बचने के लिए पैराग्राफ को दोबारा लिखें या दोबारा प्रवाहित करें।
engine.fix.rewrite_orphan|छोटी कैरी-ओवर लाइन से बचने के लिए पास की कॉपी को समायोजित करें।
engine.fix.change_font|अधिक उपयुक्त फ़ॉन्ट का उपयोग करें।
engine.explain.double_space|यह वाक्य कई स्थानों के साथ समाप्त होता है, एक टाइपराइटर-युग परंपरा जो आनुपातिक टाइपोग्राफी से संबंधित नहीं है।
engine.explain.straight_quotes|यह उद्धरण चिह्न दिशात्मक घुंघराले उद्धरण चिह्नों के बजाय सीधे ASCII फ़ॉर्म का उपयोग करता है।
engine.explain.hyphen_dash|यह व्यवधान उचित डैश के बजाय हाइफ़न-माइनस वर्णों का उपयोग करता है।
engine.explain.fake_ellipsis|पीरियड्स के इस क्रम को इलिप्सिस कैरेक्टर से बदला जाना चाहिए।
engine.explain.inconsistent_spacing|यह वाक्य रिक्ति पाठ में प्रमुख पैटर्न से भिन्न है।
engine.explain.widow|पैराग्राफ एक अलग अंतिम पंक्ति के शब्द के साथ समाप्त होता है, जो एक दृश्यमान विधवा बनाता है।
engine.explain.orphan|यह पैराग्राफ एक लंबे पूर्ववर्ती पैराग्राफ के बाद एक बहुत छोटी पंक्ति से शुरू होता है, जो संभवतः एक अनाथ के रूप में पढ़ा जाता है।
engine.explain.comic_sans|Comic Sans मेटाडेटा सबमिट किए गए रिच टेक्स्ट में पाया गया।
engine.explain.prime_marks|यह माप चिह्न उचित अभाज्य प्रतीक के बजाय ASCII उद्धरण का उपयोग करता है।
engine.explain.multiplication_sign|यह आयाम अक्षर x का उपयोग करता है जहां गुणन चिह्न दिखाई देना चाहिए।
engine.explain.trademark_symbol|इस फ़ॉलबैक नोटेशन को उचित प्रतीक के साथ प्रतिस्थापित किया जाना चाहिए।
category.punctuation|विराम चिह्न मुद्दे
category.spacing|स्पेसिंग संबंधी समस्याएं
category.layout|लेआउट मुद्दे
category.font|फ़ॉन्ट समस्याएँ
category.symbol|प्रतीक मुद्दे
severity.infraction|उल्लंघन
severity.misdemeanor|दुर्व्यवहार
severity.felony|गुंडागर्दी
verdict.clean|साफ करें
verdict.infraction|उल्लंघन
verdict.misdemeanor|दुर्व्यवहार
verdict.felony|गुंडागर्दी
verdict.capital|पूंजीगत अपराध
strictness.lenient|उदार
strictness.standard|मानक
strictness.strict|सख्त
theme.system|प्रणाली
theme.light|रोशनी
theme.dark|अंधेरा
dash.spaced|अंतराल
dash.closed|बंद
share_format.image|छवि
share_format.story|कहानी
share_format.landscape|परिदृश्य
share_format.text|सादा पाठ
share_format.link|लिंक कॉपी करें
share_format_desc.image|PNG छवि सामाजिक फ़ीड के लिए अनुकूलित।
share_format_desc.story|1080×1920 कहानी-तैयार रिपोर्ट।
share_format_desc.landscape|लेख और सामाजिक पूर्वावलोकन के लिए विस्तृत कार्ड।
share_format_desc.text|स्वरूपित पाठ्य सारांश।
share_format_desc.link|प्लेसहोल्डर डीप लिंक कॉपी.
evidence_source.typed|टाइप किया गया
evidence_source.pasted|चिपकाया गया
evidence_source.pasted_rich|रिच टेक्स्ट चिपकाया गया
toast.load_failed|सहेजी गई केस फ़ाइलें लोड नहीं हो सकीं।
toast.save_failed|केस फ़ाइल को सहेजा नहीं जा सका.
toast.delete_failed|हटाना विफल.
toast.cleared|सभी केस फ़ाइलें साफ़ कर दी गईं।
toast.clear_failed|केस फ़ाइलों को साफ़ नहीं किया जा सका.
toast.export_failed|निर्यात विफल.
"""),
        verdictShortLabels: verdictMap("""
clean|साफ करें
infraction|उल्लंघन
misdemeanor|दुर्व्यवहार
felony|गुंडागर्दी
capitalOffense|पूंजीगत अपराध
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|विराम चिह्न मुद्दे
spacing|स्पेसिंग संबंधी समस्याएं
layout|लेआउट मुद्दे
font|फ़ॉन्ट समस्याएँ
symbol|प्रतीक मुद्दे
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|डबल स्पेस
straightQuotes|सीधे उद्धरण
hyphenAsDash|डैश के रूप में हाइफ़न
fakeEllipsis|नकली इलिप्सिस
widow|विधवाएँ
orphan|अनाथ
inconsistentSpacing|असंगत रिक्ति
comicSans|Comic Sans
primeMarks|प्राइम मार्क्स
multiplicationSign|गलत गुणन चिन्ह
trademarkSymbol|ट्रेडमार्क प्रतीक का दुरुपयोग
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|वाक्य के अंत में विराम चिह्न के बाद अतिरिक्त रिक्त स्थान।
straightQuotes|ASCII उद्धरण का उपयोग वहां किया जाता है जहां घुंघराले उद्धरण होते हैं।
hyphenAsDash|हाइफ़न वास्तविक डैश के लिए खड़े हैं।
fakeEllipsis|इलिप्सिस वर्ण के स्थान पर तीन अवधियों का उपयोग किया गया।
widow|केवल एक छोटे शब्द के साथ अंतिम पंक्ति बची है।
orphan|पैराग्राफ की शुरुआत में एक छोटी कैरी-ओवर लाइन।
inconsistentSpacing|एक पाठ में मिश्रित वाक्य-रिक्ति शैलियाँ।
comicSans|Comic Sans प्रस्तुत साक्ष्य में पाया गया।
primeMarks|ASCII उद्धरण का उपयोग वहां किया जाता है जहां अभाज्य प्रतीक होते हैं।
multiplicationSign|× के स्थान पर अक्षर x का उपयोग किया गया।
trademarkSymbol|©, ®, या ™ के बजाय फ़ॉलबैक नोटेशन का उपयोग किया जाता है।
"""),
        articles: articleMap([
            (.doubleSpace, "एक वाक्य के बाद दोहरे स्थान टाइपराइटर की आदतों से आते हैं। आधुनिक आनुपातिक प्रकार में, एक स्थान क्लीनर डिफ़ॉल्ट है।", "अतिरिक्त स्थान पैराग्राफ में असमान लय और दृश्यमान अंतराल बनाते हैं।", "टाइपराइटर निश्चित-चौड़ाई वाले वर्णों का उपयोग करते थे, इसलिए अतिरिक्त रिक्ति से पाठकों को वाक्य विराम देखने में मदद मिलती थी।", "The case is closed.  Move on.", "The case is closed. Move on.", ["विराम चिह्न के बाद दोहराए गए रिक्त स्थान खोजें।", "साझा करने से पहले एक त्वरित क्लीन-अप पास चलाएँ।", "यदि दोहरे स्थान जानबूझकर हैं, तो उन्हें सुसंगत रखें।"]),
            (.straightQuotes, "सीधे उद्धरण सादे ASCII चिह्न हैं। समाप्त पाठ आमतौर पर दिशात्मक घुंघराले उद्धरणों के साथ बेहतर पढ़ा जाता है।", "घुंघराले उद्धरण अधिक परिष्कृत दिखते हैं और वाक्य की दृश्य लय में सुधार करते हैं।", "प्रारंभिक कीबोर्ड और कैरेक्टर सेट दोनों दिशाओं के लिए केवल एक सरल उद्धरण चिह्न रखते थे।", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["जहां उपलब्ध हो वहां स्मार्ट विराम चिह्न चालू करें।", "सादे-पाठ स्रोतों से चिपकाए गए पाठ को साफ़ करें।", "माप की जांच करें ताकि अभाज्य चिह्न सही रहें।"]),
            (.hyphenAsDash, "हाइफ़न शब्दों को जोड़ते हैं, लेकिन वे एम डैश या एन डैश के विकल्प नहीं हैं।", "सही डैश टोन, रिक्ति और पठनीयता में सुधार करता है।", "डबल हाइफ़न उन प्रणालियों में एक समाधान था जो आसानी से समृद्ध विराम चिह्न उत्पन्न नहीं कर सकते थे।", "He paused -- dramatically.", "He paused — dramatically.", ["अपनी शैली के लिए आवश्यक वास्तविक डैश वर्ण का उपयोग करें।", "संयुक्तों के लिए हाइफ़न रखें, वाक्य विराम नहीं।", "संपूर्ण दस्तावेज़ में एक समान रहें।"]),
            (.fakeEllipsis, "तीन आवर्त एक दीर्घवृत्त की नकल कर सकते हैं, लेकिन वे एक ही वर्ण नहीं हैं।", "एक वास्तविक दीर्घवृत्त में संतुलित अंतर होता है और पाठ की एक पंक्ति में बेहतर व्यवहार होता है।", "कई आकस्मिक लेखन वर्कफ़्लो अभी भी तीन अवधियों में टाइप करने के लिए डिफ़ॉल्ट हैं।", "Wait...", "Wait…", ["तीन अवधियों को इलिप्सिस वर्ण से बदलें।", "यदि आप अक्सर टेक्स्ट टाइप करते हैं तो उसे बदलने का उपयोग करें।", "प्रकाशन से पहले आयातित प्रति की जाँच करें।"]),
            (.widow, "एक विधवा पैराग्राफ की आखिरी पंक्ति में एक छोटा शब्द फंसा छोड़ देती है।", "वह कमज़ोर अंत अनुच्छेद के आकार और लय को बाधित करता है।", "संपादकों और डिज़ाइनरों ने प्रिंट में विधवाओं से बचने के लिए लंबे समय तक समायोजित लाइन ब्रेक रखे हैं।", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["वाक्य को थोड़ा कसें या दोबारा लिखें।", "यदि लेआउट उपकरण उपलब्ध हैं तो लाइन की लंबाई समायोजित करें।", "इसे एक सॉफ्ट स्टाइल अनुशंसा के रूप में मानें।"]),
            (.orphan, "एक अनाथ एक छोटी कैरी-ओवर लाइन है जो एक नए पैराग्राफ या टेक्स्ट ब्लॉक को अजीब तरह से शुरू करती है।", "यह पढ़ने के प्रवाह को तोड़ देता है और लेआउट पर कम विचार किया जाता है।", "संपादकीय वर्कफ़्लो परंपरागत रूप से प्रकाशन से पहले अनाथों को ठीक करते हैं।", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["ब्रेक को पुनर्संतुलित करने के लिए पास के वाक्यांश को फिर से लिखें।", "यदि आप लेआउट को नियंत्रित करते हैं तो माप को थोड़ा खोलें।", "इसे एक चेतावनी के रूप में उपयोग करें, कठोर त्रुटि के रूप में नहीं।"]),
            (.inconsistentSpacing, "एकल और दोहरे वाक्य के अंतर को मिलाने से पाठ विभिन्न स्रोतों से एक साथ जुड़ा हुआ महसूस होता है।", "पाठक असंगतता को तुरंत नोटिस कर लेते हैं, भले ही वे इसका कारण नहीं बता पाते हों।", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["एक वाक्य-रिक्ति शैली चुनें।", "साझा करने से पहले चिपकाए गए टेक्स्ट को सामान्य करें।", "चयन को शुरू से अंत तक एक समान रखें।"]),
            (.comicSans, "Comic Sans निषिद्ध नहीं है, लेकिन इसमें एक मजबूत सांस्कृतिक स्वर है जो अक्सर गंभीर प्रतिलिपि से टकराता है।", "फ़ॉन्ट पाठक के शब्दों को संसाधित करने से पहले ही उसकी मनोदशा बता देते हैं।", "Comic Sans को 1994 में बच्चों के सॉफ़्टवेयर इंटरफ़ेस के लिए डिज़ाइन किया गया था और बाद में उस संदर्भ से कहीं आगे फैल गया।", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["ऐसा टाइपफेस चुनें जो संदेश के अनुकूल हो।", "स्पष्ट रूप से चंचल कार्य के लिए चंचल प्रदर्शन चेहरों को आरक्षित करें।", "यदि चुनाव जानबूझकर किया गया है तो इस डिटेक्टर को अक्षम करें।"]),
            (.primeMarks, "फ़ुट, इंच, मिनट और सेकंड जैसे मापों के लिए अक्सर उद्धरण चिह्नों के बजाय अभाज्य प्रतीकों की आवश्यकता होती है।", "सही चिह्न अस्पष्टता को रोकता है और तकनीकी पाठ को अधिक विचारशील बनाता है।", nil, "5'11\"", "5′11″", ["अंकों के बाद प्राइम और डबल-प्राइम प्रतीकों का उपयोग करें।", "स्वचालित स्मार्ट-कोट रूपांतरण पर नजर रखें।", "विशेषताओं, मेनू और उत्पाद आयामों की सावधानीपूर्वक जांच करें।"]),
            (.multiplicationSign, "अक्षर x और गुणन चिह्न आयामों में विनिमेय नहीं हैं।", "× का उपयोग करने से तकनीकी और उत्पाद कॉपी को एक साफ़ टाइपोग्राफ़िक फ़िनिश मिलती है।", nil, "1920x1080", "1920×1080", ["संख्याओं के बीच x को × से बदलें।", "सामान्य आकार प्रारूपों के लिए टेक्स्ट प्रतिस्थापन का उपयोग करें।", "स्थिरता के लिए विशिष्टताओं और विपणन परिसंपत्तियों की समीक्षा करें।"]),
            (.trademarkSymbol, "(सी), (आर), और (टीएम) जैसे फॉर्म फ़ॉलबैक नोटेशन हैं, पॉलिश की गई अंतिम प्रतिलिपि नहीं।", "उचित प्रतीक स्थान बचाते हैं और कानूनी या ब्रांड टेक्स्ट को पूर्ण बनाते हैं।", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["फ़ॉलबैक नोटेशन को ©, ®, और ™ से बदलें।", "रिलीज से पहले कानूनी और मार्केटिंग कॉपी की जांच करें।", "उन प्रतीकों के आसपास रिक्ति को एक समान रखें।"])
        ])
    )

    static let hebrewPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|מעבדת פשע
app.tab.case_files|קבצי מקרה
app.tab.learn|למד
app.tab.settings|הגדרות
counts.crimes_categories|פשעים: %@ · קטגוריות: %@
counts.detected_issues|בעיות שזוהו: %@
counts.entries|ערכים: %@
counts.characters|תווים: %@
counts.line_column|קו %@ · קול %@
counts.crimes_verdict|פשעים: %@ · %@
share.offense_line|• %@: %@
general.done|בוצע
general.cancel|בטל
general.retry|נסה שוב
general.next|הבא
general.skip|דלג
general.got_it|הבנתי
general.coming_soon|בקרוב
general.wrong|שגוי
general.right|נכון
history.empty_title|עדיין אין מקרים
history.empty_subtitle|הפעל סריקה וקובצי התיק שלך יופיעו כאן.
history.share|שתף
history.delete|מחק
history.title|קבצי מקרה
history.today|היום
history.yesterday|אתמול
history.this_week|השבוע
history.this_month|החודש
history.select_all|בחר הכל
history.delete_selected|מחק את נבחרות
learn.title|ספריית המשפטים
learn.search_prompt|חפש סוגי פשיעה
learn.empty_title|לא נמצאו פשעים תואמים
learn.empty_subtitle|נסה מונח חיפוש אחר.
learn.what_is_this|מה הבעיה הזו?
learn.why_it_matters|למה זה חשוב
learn.history_origin|היסטוריה והקשר
learn.how_to_fix|כיצד לתקן את זה
learn.default_why|טיפוגרפיה טובה היא מערכת של פרטים מתחשבים.
learn.default_fix|השתמש בתו הנכון ושמור על עקביות במסמך.
input.method|שיטת קלט
input.method.paste|הדבק / הקלד
input.method.camera|מצלמה (OCR)
input.placeholder|הדבק או הקלד את הטקסט שלך כאן...
input.paste_from_clipboard|הדבק מהלוח
input.title|שלח הוכחות
input.analyze|נתח
input.analyze_evidence|נתח עדויות
input.camera_message|זיהוי טקסט מבוסס מצלמה מגיע בעדכון עתידי. לעת עתה, הדבק או הקלד את הטקסט שלך לניתוח.
input.trimmed_warning|הטקסט נחתך ל-100,000 תווים.
input.clipboard_empty|הלוח ריק. תחילה העתק טקסט כלשהו.
input.no_text|אין טקסט לנתח. תחילה הדבק או הקלד טקסט כלשהו.
home.new_investigation|חקירה חדשה
home.new_investigation_subtitle|הדבק או הקלד טקסט כדי להתחיל בניתוח טיפוגרפיה משפטית
home.new_investigation_badge|הדבק · סוג · ניתוח
home.recent_cases|מקרים אחרונים
home.see_all|ראה הכל →
home.empty_title|עדיין אין מקרים
home.empty_subtitle|התחל את החקירה הראשונה שלך.
home.begin_investigation|התחל בחקירה
home.stat.scans|סריקות
home.stat.crimes|פשעים
home.stat.avg|ממוצע
onboarding.splash_tagline|כל גליף הוא ראיה.
onboarding.page1.title|הדבק. לְנַתֵחַ. סקירה.
onboarding.page1.body|הכנס כל טקסט והאפליקציה תסמן בעיות טיפוגרפיות שמתחבאות לעין.
onboarding.page2.title|אנחנו תופסים את מה שבדיקת האיות מחמיצה
onboarding.page2.body|מירכאות ישרות, אליפסות מזויפות, מקפים המעמידים פנים שהם מקפים ורווחים לא עקביים כולם מופיעים כאן.
onboarding.page3.title|קבל את ציון הפשע שלך
onboarding.page3.body|ראה עד כמה הטיפוגרפיה שלך נקייה, ולאחר מכן שתף את פסק הדין.
onboarding.page4.title|למד תוך כדי
onboarding.page4.body|פתח כל בעיה כדי לראות מדוע היא חשובה וכיצד לתקן אותה.
onboarding.start|התחל לחקור
onboarding.sample.not_em_dash|לא מקף em
onboarding.library.investigate|חקר
onboarding.library.study|למד את הכללים
analysis.failed_title|ניתוח נכשל
analysis.failed_body|משהו השתבש במהלך הסריקה. אנא נסה שוב.
analysis.status.scan|סורק אחר עדויות טיפוגרפיות...
analysis.status.quotes|בודק מרכאות...
analysis.status.dashes|בודק שימוש במקף...
analysis.status.ellipsis|בודק אליפסות...
analysis.status.spacing|בודק את עקביות המרווחים...
analysis.status.layout|בודקים אלמנות ויתומים...
analysis.status.comic_sans|בודק מטא נתונים של גופנים...
analysis.status.compiling|מגבש דוח...
mugshot.title|סומן בשל התנהגות לא הולמת טיפוגרפית
mugshot.body|Comic Sans נמצאה בראיות שהוגשו. בהקשרים משעשעים זה יכול לעבוד, אבל ברוב הגדרות המוצר והעריכה זה נראה כאי התאמה.
mugshot.continue|פתח את הדוח המלא →
report.breakdown|התמוטטות פשיעה
report.share|שתף דוח
report.new_scan|סריקה חדשה
report.close|סגור דוח
report.copy_fixed|העתק טקסט קבוע
report.copy_fixed_hint|מעתיק את הטקסט המתוקן הנוכחי.
report.clean_title|ללא רבב
report.clean_body|לא זוהו בעיות טיפוגרפיות. הטקסט הזה הוא אזרח למופת.
report.replace_single_space|החלף ברווח בודד
report.fixed_text_copied|טקסט קבוע הועתק ✓
report.manual_rewrite|נושא זה דורש שכתוב ידני.
report.apply_failed|לא ניתן להחיל תיקון זה.
report.issue_fixed|הבעיה תוקנה והדיווח עודכן ✓
report.learn_more|למידע נוסף על בעיה זו →
settings.detection_rules|כללי זיהוי
settings.scoring|ניקוד
settings.strictness|הקפדה על הניקוד
settings.dash_style|סגנון Em-dash
settings.appearance|מראה
settings.theme|עיצוב
settings.haptics|משוב הפטי
settings.sounds|אפקטים קוליים
settings.data|נתונים
settings.clear_all|נקה את כל קבצי התיק
settings.export_all|ייצא את כל הדוחות
settings.about|אודות
settings.version|גרסה
settings.typpo|Typpo
settings.rate_app|דרג ב-App Store
settings.send_feedback|שלח משוב
settings.privacy|מדיניות פרטיות
settings.footer|נוצר בזהירות ובציטוטים מתולתלים נאותים.
settings.title|הגדרות
settings.clear_confirm_title|לנקות את כל תיקי התיקים?
settings.clear_confirm_message|לא ניתן לבטל פעולה זו.
settings.delete_all|מחק הכל
settings.about_body|ניתוח משפטי עבור הטקסט שלך. הדבק כל טקסט, קבל את הניקוד שלך ושתף את פסק הדין.
settings.about_placeholder|מבנה זה אינו מקוון לחלוטין ועדיין משתמש בקישורי שחרור מצייני מיקום עבור האתר, מדיניות הפרטיות ויעד App Store.
settings.about_website|אתר: %@
share.title|שתף דוח
share.copy_report_image|העתק תמונת דוח
share.save_to_photos|שמור בתמונות
share.copy_report_text|העתק את טקסט הדוח
share.photos_needed|נדרשת גישה לתמונות
share.open_settings|פתח את ההגדרות
share.photos_message|יש צורך בגישה לתמונות כדי לשמור את תמונת הדוח. פתח את ההגדרות כדי להעניק גישה.
share.primary.share_text|שתף טקסט
share.primary.copy_link|העתק קישור
share.primary.share|שתף
share.copied_clipboard|הועתק ללוח ✓
share.deep_link_copied|קישור עומק הועתק ✓
share.render_failed|לא ניתן היה להציג את תמונת הדוח.
share.saved_photos|נשמר בתמונות ✓
share.save_failed|לא ניתן לשמור את תמונת הדוח.
share.swipe_up|פתח את האפליקציה כדי לנתח את הטקסט שלך
share.report_heading|דוח טיפוגרפיה
share.score_prefix|ציון
share.top_issues|בעיות מובילות
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|הטקסט שלך מכיל רק רווח לבן. זה לא פלילי, אבל זה חשוד.
engine.non_latin_warning|ניתוח מכוון לטיפוגרפיה בכתב לטיני. ייתכן שחלק מכללי המרווחים והפיסוק לא יחולו על מערכת הכתיבה הזו.
engine.short_text_note|זיהוי אלמנות ויתומים פחות אמין בקטעים קצרים מאוד.
engine.fix.single_space|השתמש ברווח בודד לאחר סימני פיסוק עם סיום המשפט.
engine.fix.replace_with|החלף ב-%@
engine.fix.normalize_spacing|התקן את מרווח המשפטים לאורך הטקסט.
engine.fix.rewrite_widow|כתוב מחדש או הזרם מחדש של הפסקה כדי למנוע שורה אחרונה של מילה אחת.
engine.fix.rewrite_orphan|התאם את העותק הסמוך כדי למנוע קו העברה זעיר.
engine.fix.change_font|השתמש בגופן מתאים יותר.
engine.explain.double_space|משפט זה מסתיים במספר רווחים, מוסכמה מתקופת מכונת הכתיבה שאינה שייכת לטיפוגרפיה פרופורציונלית.
engine.explain.straight_quotes|מרכאות זה משתמש בצורת ASCII הישר במקום במירכאות מתולתלות כיווניות.
engine.explain.hyphen_dash|ההפרעה הזו משתמשת בתווים מקף מינוס במקום מקף מתאים.
engine.explain.fake_ellipsis|יש להחליף את רצף התקופות הזה בתו האליפסיס.
engine.explain.inconsistent_spacing|ריווח משפטי זה שונה מהתבנית הדומיננטית בטקסט.
engine.explain.widow|הפסקה מסתיימת במילה מבודדת בשורה האחרונה, היוצרת אלמנה גלויה.
engine.explain.orphan|פסקה זו מתחילה בשורה קצרה מאוד אחרי פסקה ארוכה שקדמה, שכנראה נקראת כיתום.
engine.explain.comic_sans|Comic Sans מטא נתונים נמצאו בטקסט העשיר שנשלח.
engine.explain.prime_marks|סימן מדידה זה משתמש במירכאות ASCII במקום בסמל ראשוני תקין.
engine.explain.multiplication_sign|מימד זה משתמש באות x שבה אמור להופיע סימן הכפל.
engine.explain.trademark_symbol|יש להחליף את סימון החלפה הזה בסמל המתאים.
category.punctuation|בעיות בסימני פיסוק
category.spacing|בעיות מרווח
category.layout|בעיות פריסה
category.font|בעיות גופנים
category.symbol|בעיות סמל
severity.infraction|שבירה
severity.misdemeanor|שגיאה
severity.felony|פלוניה
verdict.clean|נקה
verdict.infraction|שבירה
verdict.misdemeanor|עבירה
verdict.felony|פלוניה
verdict.capital|עבירת הון
strictness.lenient|קלה
strictness.standard|סטנדרטי
strictness.strict|קפדני
theme.system|מערכת
theme.light|אור
theme.dark|כהה
dash.spaced|מרווח
dash.closed|סגור
share_format.image|תמונה
share_format.story|סיפור
share_format.landscape|נוף
share_format.text|טקסט רגיל
share_format.link|העתק קישור
share_format_desc.image|PNG תמונה מותאמת לעדכונים חברתיים.
share_format_desc.story|דוח מוכן לסיפור 1080×1920.
share_format_desc.landscape|כרטיס רחב לתצוגה מקדימה של מאמר וחברתי.
share_format_desc.text|סיכום טקסטואלי מעוצב.
share_format_desc.link|עותק קישור עמוק של בעל מקום.
evidence_source.typed|הקלד
evidence_source.pasted|הודבק
evidence_source.pasted_rich|הודבק טקסט עשיר
toast.load_failed|לא ניתן לטעון קבצי מקרה שמורים.
toast.save_failed|לא ניתן לשמור את קובץ התיק.
toast.delete_failed|המחיקה נכשלה.
toast.cleared|כל תיקי התיקים נוקו.
toast.clear_failed|לא ניתן היה לנקות את תיקי התיקים.
toast.export_failed|הייצוא נכשל.
"""),
        verdictShortLabels: verdictMap("""
clean|נקה
infraction|שבירה
misdemeanor|עבירה
felony|פלוניה
capitalOffense|עבירת הון
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|בעיות בסימני פיסוק
spacing|בעיות מרווח
layout|בעיות פריסה
font|בעיות גופנים
symbol|בעיות סמל
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|רווחים כפולים
straightQuotes|מרכאות ישרות
hyphenAsDash|מקף כמקף
fakeEllipsis|אליפסיס מזויף
widow|אלמנות
orphan|יתומים
inconsistentSpacing|ריווח לא עקבי
comicSans|Comic Sans
primeMarks|סימנים ראשוניים
multiplicationSign|סימן כפל שגוי
trademarkSymbol|שימוש לרעה בסמל סימן מסחרי
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|רווחים נוספים לאחר פיסוק סיום המשפט.
straightQuotes|ASCII מרכאות בשימוש היכן שייכים מרכאות מתולתלות.
hyphenAsDash|מקפים המייצגים מקף אמיתי.
fakeEllipsis|השתמשו בשלוש נקודות במקום התו האליפסי.
widow|נותרה שורה אחרונה עם מילה אחת קצרה בלבד.
orphan|שורת העברה זעירה בתחילת פסקה.
inconsistentSpacing|סגנונות מרווחים בין משפטים בטקסט אחד.
comicSans|Comic Sans זוהה בראיות שהוגשו.
primeMarks|ASCII מרכאות בשימוש היכן שייכים סמלים ראשוניים.
multiplicationSign|האות x בשימוש במקום ×.
trademarkSymbol|השימוש בסימון החלפה במקום ©, ® או ™.
"""),
        articles: articleMap([
            (.doubleSpace, "רווחים כפולים אחרי משפט באים מהרגלי מכונת כתיבה. בסוג פרופורציונלי מודרני, רווח אחד הוא ברירת המחדל המנקה יותר.", "רווחים נוספים יוצרים קצב לא אחיד ופערים גלויים בפיסקה.", "מכונת כתיבה השתמשו בתווים ברוחב קבוע, כך שרווח נוסף עזר פעם לקוראים לראות מעברי משפטים.", "The case is closed.  Move on.", "The case is closed. Move on.", ["חפש רווחים חוזרים לאחר סימני פיסוק.", "הפעל מעבר ניקוי מהיר לפני השיתוף.", "אם רווחים כפולים הם בכוונה, שמור אותם עקביים."]),
            (.straightQuotes, "מרכאות ישרות הן סימני ASCII רגילים. טקסט מוגמר בדרך כלל נקרא טוב יותר עם מרכאות מתולתלות כיווניות.", "מרכאות מתולתלות נראים מלוטשים יותר ומשפרים את הקצב החזותי של משפט.", "מקלדות וקבוצות תווים מוקדמות שמרו רק מרכאה אחת פשוטה לשני הכיוונים.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["הפעל סימני פיסוק חכמים במידת האפשר.", "נקה טקסט שהודבק ממקורות טקסט רגיל.", "בדוק מידות כדי שסימני היסוד יישארו נכונים."]),
            (.hyphenAsDash, "מקפים מצטרפים למילים, אך הם אינם תחליף למקפים em או מקפים en.", "הקף הנכון משפר את הטון, המרווחים והקריאה.", "מקפים כפולים היו פתרון עוקף במערכות שלא יכלו לייצר בקלות סימני פיסוק עשירים.", "He paused -- dramatically.", "He paused — dramatically.", ["השתמש בדמות המקף האמיתית שהסגנון שלך דורש.", "שמור מקפים עבור תרכובות, לא הפסקות משפטים.", "הישאר עקבי בכל המסמך."]),
            (.fakeEllipsis, "שלוש נקודות יכולות לחקות אליפסיס, אך הן אינן אותו תו.", "לאליפסיס אמיתי יש מרווח מאוזן ומתנהג טוב יותר בשורת טקסט.", "זרימות עבודה רבות של כתיבה סתמית עדיין ברירת המחדל להקלדה של שלוש נקודות.", "Wait...", "Wait…", ["החלף שלוש נקודות בתו האליפסי.", "השתמש בהחלפת טקסט אם אתה מקליד אותו לעתים קרובות.", "בדוק את העותק המיובא לפני הפרסום."]),
            (.widow, "אלמנה משאירה מילה אחת קצרה תקועה בשורה האחרונה של פסקה.", "הסוף החלש הזה משבש את הצורה והקצב של הפסקה.", "עורכים ומעצבים התאימו ארוכות מעברי שורות כדי למנוע אלמנות בדפוס.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["הדק או כתוב מעט את המשפט.", "התאם את אורך השורה אם כלי פריסה זמינים.", "התייחס לזה כהמלצה בסגנון רך."]),
            (.orphan, "יתום הוא שורת העברה זעירה שמתחילה פסקה חדשה או בלוק טקסט בצורה מביכה.", "זה שובר את זרימת הקריאה וגורם לפריסה להרגיש פחות נחשבת.", "זרימות עבודה של עריכה מתקנים באופן מסורתי יתומים לפני הפרסום.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["כתוב מחדש ביטוי קרוב כדי לאזן מחדש את ההפסקה.", "פתח מעט את המידה אם אתה שולט בפריסה.", "השתמש בו כאזהרה, לא כשגיאה נוקשה."]),
            (.inconsistentSpacing, "שילוב של ריווח משפטי בודד וכפול גורם לטקסט להרגיש תפור יחד ממקורות שונים.", "קוראים מבחינים בחוסר עקביות במהירות, גם כאשר הם אינם יכולים להסביר מדוע.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["בחר סגנון אחד של ריווח משפטים.", "התקן טקסט מודבק לפני שיתוףו.", "שמור על בחירה עקבית מתחילתו ועד סופו."]),
            (.comicSans, "Comic Sans אינה אסורה, אך היא נושאת גוון תרבותי חזק שלעתים קרובות מתנגש עם העתקה רצינית.", "גופנים מתקשרים למצב רוח עוד לפני שהקורא מעבד את המילים.", "Comic Sans תוכנן בשנת 1994 עבור ממשק תוכנה לילדים ולאחר מכן התפשט הרבה מעבר להקשר זה.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["בחר בגופן המתאים להודעה.", "שמור פרצופים לתצוגה שובבים לעבודה שובבה בבירור.", "השבת גלאי זה אם הבחירה היא מכוונת."]),
            (.primeMarks, "מדידות כגון רגל, אינצ'ים, דקות ושניות זקוקות לרוב לסמלים ראשוניים ולא במרכאות.", "הסימן הנכון מונע אי בהירות וגורם לטקסט הטכני להיראות מכוון יותר.", nil, "5'11\"", "5′11″", ["השתמש בסמלים ראשוניים וכפולים אחרי ספרות.", "צפו בהמרת ציטוט חכם אוטומטי.", "בדוק היטב את המפרט, התפריטים וממדי המוצר."]),
            (.multiplicationSign, "האות x וסימן הכפל אינם ניתנים להחלפה במידות.", "השימוש ב× מעניק לעותק טכני ולמוצר גימור טיפוגרפי נקי יותר.", nil, "1920x1080", "1920×1080", ["החלף את x בין מספרים ב-×.", "השתמש בהחלפת טקסט עבור פורמטים נפוצים בגודל.", "עיין במפרטים ונכסי שיווק לצורך עקביות."]),
            (.trademarkSymbol, "טפסים כגון (c), (r) ו-(tm) הם סימון חלופי, לא עותק סופי מלוטש.", "הסמלים המתאימים חוסכים מקום וגורמים לטקסט משפטי או מותג להיראות גמור.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["החלף את סימון החלפה ב-©, ® ו-™.", "בדוק עותק משפטי ושיווקי לפני הפרסום.", "שמור על המרווח סביב הסמלים האלה עקביים."])
        ])
    )

    static let thaiPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|ห้องปฏิบัติการอาชญากรรม
app.tab.case_files|ไฟล์เคส
app.tab.learn|เรียนรู้
app.tab.settings|การตั้งค่า
counts.crimes_categories|อาชญากรรม: %@ · หมวดหมู่: %@
counts.detected_issues|ปัญหาที่ตรวจพบ: %@
counts.entries|รายการ: %@
counts.characters|อักขระ: %@
counts.line_column|บรรทัด %@ · Col %@
counts.crimes_verdict|อาชญากรรม: %@ · %@
share.offense_line|• %@: %@
general.done|เสร็จสิ้น
general.cancel|ยกเลิก
general.retry|ลองอีกครั้ง
general.next|ถัดไป
general.skip|ข้าม
general.got_it|เข้าใจแล้ว
general.coming_soon|เร็วๆ นี้
general.wrong|ผิด
general.right|ถูกต้อง
history.empty_title|ยังไม่มีกรณี
history.empty_subtitle|เรียกใช้การสแกน และไฟล์เคสของคุณจะปรากฏที่นี่
history.share|แบ่งปัน
history.delete|ลบ
history.title|ไฟล์เคส
history.today|วันนี้
history.yesterday|เมื่อวานนี้
history.this_week|สัปดาห์นี้
history.this_month|เดือนนี้
history.select_all|เลือกทั้งหมด
history.delete_selected|ลบที่เลือก
learn.title|ห้องสมุดกฎหมาย
learn.search_prompt|ค้นหาประเภทอาชญากรรม
learn.empty_title|ไม่พบอาชญากรรมที่ตรงกัน
learn.empty_subtitle|ลองใช้ข้อความค้นหาอื่น
learn.what_is_this|ปัญหานี้คืออะไร
learn.why_it_matters|เหตุใดจึงสำคัญ
learn.history_origin|ประวัติและบริบท
learn.how_to_fix|วิธีแก้ไข
learn.default_why|การออกแบบตัวอักษรที่ดีคือระบบของรายละเอียดที่รอบคอบ
learn.default_fix|ใช้อักขระที่ถูกต้องและทำให้เอกสารสอดคล้องกัน
input.method|วิธีการป้อนข้อมูล
input.method.paste|วาง / พิมพ์
input.method.camera|กล้อง (OCR)
input.placeholder|วางหรือพิมพ์ข้อความของคุณที่นี่…
input.paste_from_clipboard|วางจากคลิปบอร์ด
input.title|ส่งหลักฐาน
input.analyze|วิเคราะห์
input.analyze_evidence|วิเคราะห์หลักฐาน
input.camera_message|การจดจำข้อความด้วยกล้องกำลังมาในการอัปเดตในอนาคต สำหรับตอนนี้ ให้วางหรือพิมพ์ข้อความของคุณเพื่อวิเคราะห์
input.trimmed_warning|ข้อความถูกตัดเหลือ 100,000 อักขระ
input.clipboard_empty|คลิปบอร์ดว่างเปล่า คัดลอกข้อความก่อน
input.no_text|ไม่มีข้อความให้วิเคราะห์ วางหรือพิมพ์ข้อความก่อน
home.new_investigation|การสืบสวนใหม่
home.new_investigation_subtitle|วางหรือพิมพ์ข้อความเพื่อเริ่มการวิเคราะห์การพิมพ์ทางนิติเวช
home.new_investigation_badge|วาง · ประเภท · วิเคราะห์
home.recent_cases|กรณีล่าสุด
home.see_all|ดูทั้งหมด →
home.empty_title|ยังไม่มีกรณี
home.empty_subtitle|เริ่มการตรวจสอบครั้งแรกของคุณ
home.begin_investigation|เริ่มต้นการตรวจสอบ
home.stat.scans|สแกน
home.stat.crimes|อาชญากรรม
home.stat.avg|เฉลี่ย
onboarding.splash_tagline|ทุกสัญลักษณ์คือหลักฐาน
onboarding.page1.title|วาง วิเคราะห์. รีวิว
onboarding.page1.body|ใส่ข้อความลงไปแล้วแอปจะแจ้งปัญหาการพิมพ์ที่ซ่อนอยู่ให้มองเห็นได้
onboarding.page2.title|เราตรวจจับสิ่งที่ตรวจการสะกดพลาดไป
onboarding.page2.body|เครื่องหมายคำพูดแบบตรง วงรีปลอม ยัติภังค์ที่ทำเป็นเครื่องหมายขีดยาว และการเว้นวรรคที่ไม่สอดคล้องกันทั้งหมดจะแสดงที่นี่
onboarding.page3.title|รับคะแนนอาชญากรรมของคุณ
onboarding.page3.body|ดูว่าตัวพิมพ์ของคุณสะอาดแค่ไหน จากนั้นแชร์คำตัดสิน
onboarding.page4.title|เรียนรู้ไปพร้อมๆ กัน
onboarding.page4.body|เปิดปัญหาเพื่อดูว่าเหตุใดจึงสำคัญและจะแก้ไขอย่างไร
onboarding.start|เริ่มการตรวจสอบ
onboarding.sample.not_em_dash|ไม่ใช่เครื่องหมายขีดกลาง
onboarding.library.investigate|ตรวจสอบ
onboarding.library.study|ศึกษากฎเกณฑ์
analysis.failed_title|การวิเคราะห์ล้มเหลว
analysis.failed_body|มีบางอย่างผิดพลาดระหว่างการสแกน โปรดลองอีกครั้ง
analysis.status.scan|กำลังสแกนหาหลักฐานการพิมพ์…
analysis.status.quotes|กำลังตรวจสอบเครื่องหมายคำพูด…
analysis.status.dashes|กำลังตรวจสอบการใช้งานเส้นประ…
analysis.status.ellipsis|กำลังตรวจสอบจุดไข่ปลา…
analysis.status.spacing|กำลังตรวจสอบความสอดคล้องของระยะห่าง…
analysis.status.layout|ตรวจสอบหญิงม่ายและเด็กกำพร้า…
analysis.status.comic_sans|กำลังตรวจสอบข้อมูลเมตาของแบบอักษร…
analysis.status.compiling|กำลังรวบรวมรายงาน…
mugshot.title|ถูกติดธงเนื่องจากการประพฤติมิชอบด้านการพิมพ์
mugshot.body|Comic Sans ถูกพบในหลักฐานที่ส่งมา ในบริบทที่สนุกสนาน อาจใช้ได้ผล แต่ในการตั้งค่าผลิตภัณฑ์และบรรณาธิการส่วนใหญ่ถือว่าไม่ตรงกัน
mugshot.continue|เปิดรายงานฉบับเต็ม →
report.breakdown|รายละเอียดอาชญากรรม
report.share|แชร์รายงาน
report.new_scan|สแกนใหม่
report.close|ปิดรายงาน
report.copy_fixed|คัดลอกข้อความคงที่
report.copy_fixed_hint|คัดลอกข้อความที่แก้ไขในปัจจุบัน
report.clean_title|ไร้ที่ติ
report.clean_body|ไม่พบปัญหาด้านการพิมพ์ ข้อความนี้เป็นพลเมืองตัวอย่าง
report.replace_single_space|แทนที่ด้วยช่องว่างเดียว
report.fixed_text_copied|คัดลอกข้อความคงที่แล้ว ✓
report.manual_rewrite|ปัญหานี้จำเป็นต้องเขียนใหม่ด้วยตนเอง
report.apply_failed|ไม่สามารถใช้การแก้ไขนี้ได้
report.issue_fixed|ปัญหาได้รับการแก้ไขและรายงานอัปเดตแล้ว ✓
report.learn_more|เรียนรู้เพิ่มเติมเกี่ยวกับปัญหานี้ →
settings.detection_rules|กฎการตรวจจับ
settings.scoring|การให้คะแนน
settings.strictness|ความเข้มงวดในการให้คะแนน
settings.dash_style|สไตล์เส้นประ
settings.appearance|รูปลักษณ์
settings.theme|ธีม
settings.haptics|การตอบสนองแบบสัมผัส
settings.sounds|เอฟเฟกต์เสียง
settings.data|ข้อมูล
settings.clear_all|ล้างไฟล์เคสทั้งหมด
settings.export_all|ส่งออกรายงานทั้งหมด
settings.about|เกี่ยวกับ
settings.version|เวอร์ชัน
settings.typpo|Typpo
settings.rate_app|ให้คะแนนบน App Store
settings.send_feedback|ส่งคำติชม
settings.privacy|นโยบายความเป็นส่วนตัว
settings.footer|สร้างขึ้นด้วยความเอาใจใส่และเครื่องหมายคำพูดแบบโค้งที่เหมาะสม
settings.title|การตั้งค่า
settings.clear_confirm_title|ล้างไฟล์เคสทั้งหมดหรือไม่
settings.clear_confirm_message|การดำเนินการนี้ไม่สามารถยกเลิกได้
settings.delete_all|ลบทั้งหมด
settings.about_body|การวิเคราะห์ทางนิติเวชสำหรับข้อความของคุณ วางข้อความ รับคะแนน และแบ่งปันคำตัดสิน
settings.about_placeholder|โครงสร้างนี้ออฟไลน์โดยสมบูรณ์และยังคงใช้ลิงก์การเผยแพร่ตัวยึดตำแหน่งสำหรับเว็บไซต์ นโยบายความเป็นส่วนตัว และปลายทาง App Store
settings.about_website|เว็บไซต์: %@
share.title|แบ่งปันรายงาน
share.copy_report_image|คัดลอกรูปภาพรายงาน
share.save_to_photos|บันทึกลงในรูปภาพ
share.copy_report_text|คัดลอกข้อความรายงาน
share.photos_needed|จำเป็นต้องเข้าถึงรูปภาพ
share.open_settings|เปิดการตั้งค่า
share.photos_message|จำเป็นต้องเข้าถึงรูปภาพเพื่อบันทึกรูปภาพรายงาน เปิดการตั้งค่าเพื่อให้สิทธิ์การเข้าถึง
share.primary.share_text|แบ่งปันข้อความ
share.primary.copy_link|คัดลอกลิงก์
share.primary.share|แบ่งปัน
share.copied_clipboard|คัดลอกไปยังคลิปบอร์ด ✓
share.deep_link_copied|คัดลอกลิงก์ในรายละเอียดแล้ว ✓
share.render_failed|ไม่สามารถแสดงภาพรายงานได้
share.saved_photos|บันทึกลงในรูปภาพ ✓
share.save_failed|ไม่สามารถบันทึกรูปภาพรายงานได้
share.swipe_up|เปิดแอปเพื่อวิเคราะห์ข้อความของคุณเอง
share.report_heading|รายงานการพิมพ์
share.score_prefix|คะแนน
share.top_issues|ประเด็นยอดนิยม
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|ข้อความของคุณมีเพียงช่องว่างเท่านั้น ไม่ใช่ความผิดทางอาญา แต่เป็นเรื่องที่น่าสงสัย
engine.non_latin_warning|การวิเคราะห์ได้รับการปรับแต่งสำหรับการพิมพ์ด้วยอักษรละติน กฎการเว้นวรรคและเครื่องหมายวรรคตอนบางข้ออาจไม่ใช้กับระบบการเขียนนี้
engine.short_text_note|การตรวจจับหญิงม่ายและเด็กกำพร้ามีความน่าเชื่อถือน้อยกว่าในข้อความที่สั้นมาก
engine.fix.single_space|ใช้ช่องว่างเดียวหลังเครื่องหมายวรรคตอนลงท้ายประโยค
engine.fix.replace_with|แทนที่ด้วย %@
engine.fix.normalize_spacing|ปรับระยะห่างระหว่างประโยคให้เป็นปกติทั่วทั้งข้อความ
engine.fix.rewrite_widow|เขียนใหม่หรือจัดเรียงย่อหน้าใหม่เพื่อหลีกเลี่ยงบรรทัดสุดท้ายที่มีเพียงคำเดียว
engine.fix.rewrite_orphan|ปรับสำเนาใกล้เคียงเพื่อหลีกเลี่ยงเส้นยกเล็กๆ
engine.fix.change_font|ใช้แบบอักษรที่เหมาะสมกว่านี้
engine.explain.double_space|ประโยคนี้ลงท้ายด้วยการเว้นวรรคหลายช่อง ซึ่งเป็นแบบแผนของยุคเครื่องพิมพ์ดีดที่ไม่อยู่ในรูปแบบการพิมพ์ตามสัดส่วน
engine.explain.straight_quotes|เครื่องหมายคำพูดนี้ใช้รูปแบบ ASCII แบบตรงแทนเครื่องหมายคำพูดแบบโค้ง
engine.explain.hyphen_dash|การหยุดชะงักนี้ใช้อักขระยัติภังค์-ลบแทนการใช้ขีดกลางที่เหมาะสม
engine.explain.fake_ellipsis|การเรียกใช้รอบระยะเวลานี้ควรแทนที่ด้วยอักขระจุดไข่ปลา
engine.explain.inconsistent_spacing|การเว้นวรรคประโยคนี้แตกต่างจากรูปแบบที่โดดเด่นในข้อความ
engine.explain.widow|ย่อหน้าลงท้ายด้วยคำบรรทัดสุดท้ายที่แยกออกมา ทำให้เกิดเป็นม่ายที่มองเห็นได้
engine.explain.orphan|ย่อหน้านี้เริ่มต้นด้วยบรรทัดที่สั้นมากหลังจากย่อหน้าก่อนหน้าอันยาวเหยียด ซึ่งอาจอ่านได้ว่าเป็นเด็กกำพร้า
engine.explain.comic_sans|Comic Sans พบข้อมูลเมตาใน Rich Text ที่ส่งมา
engine.explain.prime_marks|เครื่องหมายการวัดนี้ใช้เครื่องหมายคำพูด ASCII แทนสัญลักษณ์เฉพาะที่เหมาะสม
engine.explain.multiplication_sign|มิตินี้ใช้ตัวอักษร x ในจุดที่เครื่องหมายคูณควรปรากฏ
engine.explain.trademark_symbol|สัญกรณ์ทางเลือกนี้ควรแทนที่ด้วยสัญลักษณ์ที่เหมาะสม
category.punctuation|ปัญหาเครื่องหมายวรรคตอน
category.spacing|ปัญหาการเว้นวรรค
category.layout|ปัญหาเค้าโครง
category.font|ปัญหาแบบอักษร
category.symbol|ปัญหาเกี่ยวกับสัญลักษณ์
severity.infraction|การละเมิด
severity.misdemeanor|การกระทำผิด
severity.felony|ความผิดทางอาญา
verdict.clean|สะอาด
verdict.infraction|การละเมิด
verdict.misdemeanor|การกระทำผิด
verdict.felony|ความผิดทางอาญา
verdict.capital|ความผิดฐานทุน
strictness.lenient|ผ่อนปรน
strictness.standard|มาตรฐาน
strictness.strict|เข้มงวด
theme.system|ระบบ
theme.light|แสง
theme.dark|มืด
dash.spaced|เว้นวรรค
dash.closed|ปิด
share_format.image|รูปภาพ
share_format.story|เรื่องราว
share_format.landscape|แนวนอน
share_format.text|ข้อความธรรมดา
share_format.link|คัดลอกลิงก์
share_format_desc.image|PNG รูปภาพที่ปรับให้เหมาะสมสำหรับฟีดโซเชียล
share_format_desc.story|รายงานพร้อมเรื่องราวขนาด 1080×1920
share_format_desc.landscape|การ์ดแบบกว้างสำหรับตัวอย่างบทความและโซเชียล
share_format_desc.text|สรุปข้อความที่จัดรูปแบบ
share_format_desc.link|สำเนาลิงก์ในรายละเอียดตัวยึดตำแหน่ง
evidence_source.typed|พิมพ์แล้ว
evidence_source.pasted|วางแล้ว
evidence_source.pasted_rich|วาง Rich Text
toast.load_failed|ไม่สามารถโหลดไฟล์เคสที่บันทึกไว้ได้
toast.save_failed|ไม่สามารถบันทึกไฟล์เคสได้
toast.delete_failed|การลบล้มเหลว
toast.cleared|เคลียร์ไฟล์เคสทั้งหมดแล้ว
toast.clear_failed|ไม่สามารถล้างไฟล์เคสได้
toast.export_failed|การส่งออกล้มเหลว
"""),
        verdictShortLabels: verdictMap("""
clean|สะอาด
infraction|การละเมิด
misdemeanor|การกระทำผิด
felony|ความผิดทางอาญา
capitalOffense|ความผิดฐานทุน
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|ปัญหาเครื่องหมายวรรคตอน
spacing|ปัญหาการเว้นวรรค
layout|ปัญหาเกี่ยวกับเค้าโครง
font|ปัญหาแบบอักษร
symbol|ปัญหาเกี่ยวกับสัญลักษณ์
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|ช่องว่างคู่
straightQuotes|ราคาตรง
hyphenAsDash|ยัติภังค์เป็นเส้นประ
fakeEllipsis|จุดไข่ปลาปลอม
widow|แม่ม่าย
orphan|เด็กกำพร้า
inconsistentSpacing|การเว้นวรรคไม่สอดคล้องกัน
comicSans|Comic Sans
primeMarks|ไพรม์มาร์ก
multiplicationSign|เครื่องหมายคูณผิด
trademarkSymbol|การใช้สัญลักษณ์เครื่องหมายการค้าในทางที่ผิด
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|เว้นวรรคเพิ่มเติมหลังเครื่องหมายวรรคตอนลงท้ายประโยค
straightQuotes|ASCII เครื่องหมายคำพูดที่ใช้โดยมีเครื่องหมายคำพูดแบบโค้งอยู่
hyphenAsDash|ยัติภังค์หมายถึงเส้นประที่แท้จริง
fakeEllipsis|ใช้จุดสามจุดแทนอักขระจุดไข่ปลา
widow|บรรทัดสุดท้ายเหลือเพียงคำสั้นๆ เพียงคำเดียว
orphan|บรรทัดยกยอดเล็กๆ ที่จุดเริ่มต้นของย่อหน้า
inconsistentSpacing|รูปแบบการเว้นวรรคประโยคแบบผสมในข้อความเดียว
comicSans|Comic Sans ตรวจพบในหลักฐานที่ส่งมา
primeMarks|ASCII เครื่องหมายคำพูดที่ใช้โดยมีสัญลักษณ์เฉพาะอยู่
multiplicationSign|ตัวอักษร x ใช้แทน ×
trademarkSymbol|สัญลักษณ์ทางเลือกที่ใช้แทน ©, ® หรือ ™
"""),
        articles: articleMap([
            (.doubleSpace, "การเว้นวรรคสองครั้งหลังประโยคมาจากนิสัยของเครื่องพิมพ์ดีด ในประเภทสัดส่วนสมัยใหม่ ช่องว่างหนึ่งช่องเป็นค่าเริ่มต้นที่สะอาดกว่า", "การเว้นวรรคเพิ่มเติมทำให้เกิดจังหวะที่ไม่สม่ำเสมอและมองเห็นช่องว่างในย่อหน้า", "เครื่องพิมพ์ดีดใช้อักขระที่มีความกว้างคงที่ ดังนั้นการเว้นวรรคเพิ่มเติมจึงช่วยให้ผู้อ่านเห็นการแบ่งประโยค", "The case is closed.  Move on.", "The case is closed. Move on.", ["ค้นหาการเว้นวรรคซ้ำหลังเครื่องหมายวรรคตอน", "เรียกใช้บัตรทำความสะอาดด่วนก่อนแชร์", "หากตั้งใจเว้นวรรคสองครั้ง ให้เว้นวรรคให้สอดคล้องกัน"]),
            (.straightQuotes, "เครื่องหมายคำพูดแบบตรงเป็นเครื่องหมาย ASCII ธรรมดา ข้อความที่เสร็จแล้วมักจะอ่านได้ดีกว่าด้วยเครื่องหมายคำพูดแบบโค้ง", "เครื่องหมายคำพูดแบบโค้งดูสวยงามยิ่งขึ้นและปรับปรุงจังหวะการมองเห็นของประโยค", "คีย์บอร์ดและชุดอักขระในยุคแรกๆ ใช้เครื่องหมายคำพูดธรรมดาเพียงตัวเดียวสำหรับทั้งสองทิศทาง", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["เปิดเครื่องหมายวรรคตอนอัจฉริยะ หากมี", "ล้างข้อความที่วางจากแหล่งข้อความธรรมดา", "ตรวจสอบการวัดเพื่อให้เครื่องหมายเฉพาะถูกต้อง"]),
            (.hyphenAsDash, "ยัติภังค์เชื่อมคำ แต่ไม่สามารถใช้แทนเครื่องหมายขีดกลางหรือขีดกลางได้", "ขีดกลางที่ถูกต้องช่วยปรับปรุงโทนเสียง การเว้นวรรค และความสามารถในการอ่าน", "เครื่องหมายยัติภังค์คู่เป็นวิธีการแก้ปัญหาในระบบที่ไม่สามารถสร้างเครื่องหมายวรรคตอนที่สมบูรณ์ได้ง่าย", "He paused -- dramatically.", "He paused — dramatically.", ["ใช้อักขระเส้นประจริงตามสไตล์ที่คุณต้องการ", "เก็บเครื่องหมายยัติภังค์ไว้สำหรับคำประสม ไม่ใช่ตัวแบ่งประโยค", "คงความสม่ำเสมอทั่วทั้งเอกสาร"]),
            (.fakeEllipsis, "จุดสามจุดสามารถเลียนแบบจุดไข่ปลาได้ แต่ไม่ใช่อักขระเดียวกัน", "จุดไข่ปลาจริงมีระยะห่างที่สมดุลและทำงานได้ดีกว่าในบรรทัดข้อความ", "ขั้นตอนการเขียนแบบทั่วไปจำนวนมากยังคงใช้ค่าเริ่มต้นในการพิมพ์สามจุด", "Wait...", "Wait…", ["แทนที่จุดสามจุดด้วยอักขระจุดไข่ปลา", "ใช้การแทนที่ข้อความหากคุณพิมพ์บ่อยๆ", "ตรวจสอบสำเนาที่นำเข้าก่อนเผยแพร่"]),
            (.widow, "หญิงม่ายปล่อยให้คำสั้นๆ หนึ่งคำติดอยู่ที่บรรทัดสุดท้ายของย่อหน้า", "ตอนจบที่อ่อนแอนั้นรบกวนรูปร่างและจังหวะของย่อหน้า", "บรรณาธิการและนักออกแบบได้ปรับการขึ้นบรรทัดใหม่เป็นเวลานานเพื่อหลีกเลี่ยงปัญหาม่ายในการพิมพ์", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["กระชับหรือเขียนประโยคใหม่เล็กน้อย", "ปรับความยาวบรรทัดหากมีเครื่องมือเค้าโครง", "ถือเป็นคำแนะนำสไตล์ที่นุ่มนวล"]),
            (.orphan, "เด็กกำพร้าเป็นบรรทัดเล็กๆ ที่ลากไปเริ่มย่อหน้าใหม่หรือบล็อกข้อความอย่างเชื่องช้า", "ทำให้การอ่านหยุดชะงักและทำให้เลย์เอาต์รู้สึกว่าถูกมองข้าม", "ขั้นตอนการทำงานด้านบรรณาธิการมักจะแก้ไขเด็กกำพร้าก่อนเผยแพร่", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["เขียนวลีใกล้เคียงใหม่เพื่อปรับสมดุลช่วงพัก", "เปิดการวัดเล็กน้อยหากคุณควบคุมเค้าโครง", "ใช้เป็นคำเตือน ไม่ใช่ข้อผิดพลาดร้ายแรง"]),
            (.inconsistentSpacing, "การผสมการเว้นวรรคประโยคเดี่ยวและคู่จะทำให้ข้อความเชื่อมโยงกันจากแหล่งที่มาต่างๆ", "ผู้อ่านสังเกตเห็นความไม่สอดคล้องกันอย่างรวดเร็ว แม้ว่าพวกเขาจะอธิบายสาเหตุไม่ได้ก็ตาม", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["เลือกรูปแบบการเว้นวรรคประโยคหนึ่งรูปแบบ", "ปรับข้อความที่วางให้เป็นมาตรฐานก่อนแชร์", "รักษาตัวเลือกให้สอดคล้องกันตั้งแต่ต้นจนจบ"]),
            (.comicSans, "Comic Sans ไม่ได้ถูกห้าม แต่มีน้ำเสียงทางวัฒนธรรมที่เข้มแข็งซึ่งมักจะขัดแย้งกับการคัดลอกที่จริงจัง", "แบบอักษรสื่อสารอารมณ์ก่อนที่ผู้อ่านจะประมวลผลคำศัพท์", "Comic Sans ได้รับการออกแบบในปี 1994 สำหรับอินเทอร์เฟซซอฟต์แวร์สำหรับเด็ก และต่อมาแพร่หลายไปไกลกว่าบริบทนั้น", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["เลือกแบบอักษรที่เหมาะกับข้อความ", "สงวนการแสดงใบหน้าที่สนุกสนานเพื่อการทำงานที่สนุกสนานอย่างชัดเจน", "ปิดใช้งานตัวตรวจจับนี้หากตัวเลือกมีเจตนา"]),
            (.primeMarks, "หน่วยวัด เช่น ฟุต นิ้ว นาที และวินาที มักต้องใช้สัญลักษณ์เฉพาะมากกว่าเครื่องหมายคำพูด", "เครื่องหมายที่ถูกต้องช่วยป้องกันความคลุมเครือและทำให้ข้อความทางเทคนิคดูมีเจตนามากขึ้น", nil, "5'11\"", "5′11″", ["ใช้สัญลักษณ์ไพรม์และดับเบิ้ลไพรม์หลังตัวเลข", "รับชมการแปลงคำพูดอัจฉริยะอัตโนมัติ", "ตรวจสอบข้อมูลจำเพาะ เมนู และขนาดผลิตภัณฑ์อย่างละเอียด"]),
            (.multiplicationSign, "ตัวอักษร x และเครื่องหมายคูณไม่สามารถใช้แทนกันได้ในมิติ", "การใช้ × ช่วยให้สำเนาทางเทคนิคและผลิตภัณฑ์มีการพิมพ์ที่สะอาดตายิ่งขึ้น", nil, "1920x1080", "1920×1080", ["แทนที่ x ระหว่างตัวเลขด้วย ×", "ใช้การแทนที่ข้อความสำหรับรูปแบบขนาดทั่วไป", "ตรวจสอบข้อกำหนดและเนื้อหาทางการตลาดเพื่อความสอดคล้อง"]),
            (.trademarkSymbol, "แบบฟอร์มต่างๆ เช่น (c), (r) และ (tm) เป็นรูปแบบสำรอง ไม่ใช่สำเนาขั้นสุดท้ายที่สวยงาม", "สัญลักษณ์ที่เหมาะสมช่วยประหยัดพื้นที่และทำให้ข้อความทางกฎหมายหรือแบรนด์ดูสมบูรณ์", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["แทนที่สัญลักษณ์ทางเลือกด้วย ©, ® และ ™", "ตรวจสอบสำเนาทางกฎหมายและการตลาดก่อนเผยแพร่", "รักษาระยะห่างรอบสัญลักษณ์เหล่านั้นให้สอดคล้องกัน"])
        ])
    )

    static let vietnamesePack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Phòng thí nghiệm tội phạm
app.tab.case_files|Hồ sơ vụ án
app.tab.learn|Tìm hiểu
app.tab.settings|Cài đặt
counts.crimes_categories|Tội ác: %@ · Danh mục: %@
counts.detected_issues|Sự cố đã phát hiện: %@
counts.entries|Bài viết: %@
counts.characters|Nhân vật: %@
counts.line_column|Dòng %@ · Cột %@
counts.crimes_verdict|Tội ác: %@ · %@
share.offense_line|%@: %@
general.done|Xong
general.cancel|Hủy
general.retry|Thử lại
general.next|Tiếp theo
general.skip|Bỏ qua
general.got_it|Hiểu rồi
general.coming_soon|Sắp ra mắt
general.wrong|Sai
general.right|Đúng rồi
history.empty_title|Chưa có trường hợp nào
history.empty_subtitle|Chạy quét và hồ sơ vụ án của bạn sẽ xuất hiện ở đây.
history.share|Chia sẻ
history.delete|Xóa
history.title|Hồ sơ vụ án
history.today|HÔM NAY
history.yesterday|NGÀY HÔM NAY
history.this_week|TUẦN NÀY
history.this_month|THÁNG NÀY
history.select_all|Chọn tất cả
history.delete_selected|Xóa đã chọn
learn.title|Thư viện pháp luật
learn.search_prompt|Tìm kiếm các loại tội phạm
learn.empty_title|Không tìm thấy tội phạm nào phù hợp
learn.empty_subtitle|Thử cụm từ tìm kiếm khác.
learn.what_is_this|Vấn đề này là gì?
learn.why_it_matters|Tại sao nó lại quan trọng
learn.history_origin|Lịch sử và bối cảnh
learn.how_to_fix|Cách khắc phục
learn.default_why|Kiểu chữ đẹp là một hệ thống các chi tiết chu đáo.
learn.default_fix|Sử dụng đúng ký tự và giữ cho tài liệu nhất quán.
input.method|Phương thức nhập
input.method.paste|Dán/Gõ
input.method.camera|Máy ảnh (OCR)
input.placeholder|Dán hoặc nhập văn bản của bạn vào đây…
input.paste_from_clipboard|Dán từ Clipboard
input.title|Gửi bằng chứng
input.analyze|Phân tích
input.analyze_evidence|Phân tích bằng chứng
input.camera_message|Tính năng nhận dạng văn bản dựa trên máy ảnh sẽ có trong bản cập nhật trong tương lai. Hiện tại, hãy dán hoặc nhập văn bản của bạn để phân tích.
input.trimmed_warning|Văn bản được cắt bớt còn 100.000 ký tự.
input.clipboard_empty|Bảng tạm trống. Trước tiên hãy sao chép một số văn bản.
input.no_text|Không có văn bản để phân tích. Trước tiên hãy dán hoặc nhập một số văn bản.
home.new_investigation|Điều tra mới
home.new_investigation_subtitle|Dán hoặc nhập văn bản để bắt đầu phân tích kiểu chữ pháp y
home.new_investigation_badge|DÁN · LOẠI · PHÂN TÍCH
home.recent_cases|Các trường hợp gần đây
home.see_all|Xem tất cả →
home.empty_title|Chưa có trường hợp nào
home.empty_subtitle|Bắt đầu cuộc điều tra đầu tiên của bạn.
home.begin_investigation|Bắt đầu điều tra
home.stat.scans|Quét
home.stat.crimes|Tội ác
home.stat.avg|Trung bình
onboarding.splash_tagline|Mọi hình tượng đều là bằng chứng.
onboarding.page1.title|Dán. Phân tích. Đánh giá.
onboarding.page1.body|Thả bất kỳ văn bản nào vào và ứng dụng sẽ gắn cờ các vấn đề về lỗi chính tả ẩn trong tầm nhìn rõ ràng.
onboarding.page2.title|Chúng tôi phát hiện những gì kiểm tra chính tả bỏ sót
onboarding.page2.body|Dấu ngoặc kép, dấu chấm lửng giả, dấu gạch nối giả làm dấu gạch ngang và dấu cách không nhất quán đều hiển thị ở đây.
onboarding.page3.title|Nhận điểm tội phạm của bạn
onboarding.page3.body|Hãy xem kiểu chữ của bạn rõ ràng đến mức nào rồi chia sẻ nhận định.
onboarding.page4.title|Học theo tiến trình của bạn
onboarding.page4.body|Mở vấn đề bất kỳ để xem lý do tại sao và cách khắc phục.
onboarding.start|Bắt đầu điều tra
onboarding.sample.not_em_dash|Không phải dấu gạch ngang
onboarding.library.investigate|Điều tra
onboarding.library.study|Nghiên cứu nội quy
analysis.failed_title|Phân tích thất bại
analysis.failed_body|Đã xảy ra lỗi trong quá trình quét. Vui lòng thử lại.
analysis.status.scan|Đang quét tìm bằng chứng về lỗi đánh máy…
analysis.status.quotes|Đang kiểm tra dấu ngoặc kép…
analysis.status.dashes|Đang kiểm tra mức sử dụng dấu gạch ngang…
analysis.status.ellipsis|Đang kiểm tra hình elip…
analysis.status.spacing|Kiểm tra tính nhất quán về khoảng cách…
analysis.status.layout|Kiểm tra góa phụ và trẻ mồ côi…
analysis.status.comic_sans|Đang kiểm tra siêu dữ liệu phông chữ…
analysis.status.compiling|Tổng hợp báo cáo…
mugshot.title|Bị gắn cờ vì lỗi đánh máy
mugshot.body|Comic Sans được tìm thấy trong bằng chứng được gửi. Trong những bối cảnh vui nhộn, nó có thể hoạt động, nhưng trong hầu hết các cài đặt về sản phẩm và biên tập, nó được coi là không khớp.
mugshot.continue|Mở báo cáo đầy đủ →
report.breakdown|Sự cố tội phạm
report.share|Chia sẻ báo cáo
report.new_scan|Quét mới
report.close|Đóng báo cáo
report.copy_fixed|Sao chép văn bản cố định
report.copy_fixed_hint|Sao chép văn bản đã sửa hiện tại.
report.clean_title|Không tì vết
report.clean_body|Không phát hiện thấy vấn đề về lỗi chính tả. Văn bản này là một công dân kiểu mẫu.
report.replace_single_space|Thay thế bằng một khoảng trắng
report.fixed_text_copied|Đã sửa lỗi sao chép văn bản ✓
report.manual_rewrite|Vấn đề này cần được viết lại thủ công.
report.apply_failed|Không thể áp dụng bản sửa lỗi này.
report.issue_fixed|Đã khắc phục sự cố và cập nhật báo cáo ✓
report.learn_more|Tìm hiểu thêm về vấn đề này →
settings.detection_rules|Quy tắc phát hiện
settings.scoring|Tính điểm
settings.strictness|Tính điểm nghiêm ngặt
settings.dash_style|Phong cách gạch ngang
settings.appearance|Diện mạo
settings.theme|Chủ đề
settings.haptics|Phản hồi xúc giác
settings.sounds|Hiệu ứng âm thanh
settings.data|Dữ liệu
settings.clear_all|Xóa tất cả hồ sơ vụ án
settings.export_all|Xuất tất cả báo cáo
settings.about|Giới thiệu
settings.version|Phiên bản
settings.typpo|Typpo
settings.rate_app|Đánh giá trên App Store
settings.send_feedback|Gửi phản hồi
settings.privacy|Chính sách quyền riêng tư
settings.footer|Được thực hiện một cách cẩn thận và có những trích dẫn xoăn thích hợp.
settings.title|Cài đặt
settings.clear_confirm_title|Xóa tất cả hồ sơ vụ án?
settings.clear_confirm_message|Không thể hoàn tác hành động này.
settings.delete_all|Xóa tất cả
settings.about_body|Phân tích pháp y cho văn bản của bạn. Dán bất kỳ văn bản nào, nhận điểm và chia sẻ phán quyết.
settings.about_placeholder|Bản dựng này hoàn toàn ngoại tuyến và vẫn sử dụng các liên kết phát hành giữ chỗ cho trang web, chính sách quyền riêng tư và đích App Store.
settings.about_website|Trang web: %@
share.title|Chia sẻ báo cáo
share.copy_report_image|Sao chép hình ảnh báo cáo
share.save_to_photos|Lưu vào Ảnh
share.copy_report_text|Sao chép văn bản báo cáo
share.photos_needed|Cần có quyền truy cập ảnh
share.open_settings|Mở cài đặt
share.photos_message|Cần có quyền truy cập ảnh để lưu ảnh báo cáo. Mở Cài đặt để cấp quyền truy cập.
share.primary.share_text|Chia sẻ văn bản
share.primary.copy_link|Sao chép liên kết
share.primary.share|Chia sẻ
share.copied_clipboard|Đã sao chép vào bảng nhớ tạm ✓
share.deep_link_copied|Đã sao chép liên kết sâu ✓
share.render_failed|Không thể hiển thị hình ảnh báo cáo.
share.saved_photos|Đã lưu vào Ảnh ✓
share.save_failed|Không lưu được ảnh báo cáo.
share.swipe_up|MỞ ỨNG DỤNG ĐỂ PHÂN TÍCH VĂN BẢN CỦA RIÊNG BẠN
share.report_heading|Báo cáo kiểu chữ
share.score_prefix|Điểm
share.top_issues|Các vấn đề hàng đầu
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Văn bản của bạn chỉ chứa khoảng trắng. Nó không phải tội phạm nhưng đáng nghi ngờ.
engine.non_latin_warning|Phân tích được điều chỉnh cho kiểu chữ chữ Latinh. Một số quy tắc về dấu cách và dấu câu có thể không áp dụng cho hệ thống chữ viết này.
engine.short_text_note|Việc phát hiện góa phụ và trẻ mồ côi kém tin cậy hơn ở những đoạn rất ngắn.
engine.fix.single_space|Sử dụng một dấu cách sau dấu câu kết thúc câu.
engine.fix.replace_with|Thay thế bằng %@
engine.fix.normalize_spacing|Bình thường hóa khoảng cách giữa các câu trong toàn bộ văn bản.
engine.fix.rewrite_widow|Viết lại hoặc sắp xếp lại đoạn văn để tránh dòng cuối cùng chỉ có một từ.
engine.fix.rewrite_orphan|Điều chỉnh bản sao gần đó để tránh một dòng nhỏ mang theo.
engine.fix.change_font|Sử dụng phông chữ phù hợp hơn.
engine.explain.double_space|Câu này kết thúc bằng nhiều dấu cách, một quy ước của thời đại máy đánh chữ không thuộc về kiểu chữ tỷ lệ.
engine.explain.straight_quotes|Dấu ngoặc kép này sử dụng dạng ASCII thẳng thay vì dấu ngoặc nhọn định hướng.
engine.explain.hyphen_dash|Sự gián đoạn này sử dụng các ký tự dấu gạch nối thay vì dấu gạch ngang thích hợp.
engine.explain.fake_ellipsis|Dòng dấu chấm này nên được thay thế bằng ký tự dấu chấm lửng.
engine.explain.inconsistent_spacing|Dòng cách câu này khác với mẫu chủ đạo trong văn bản.
engine.explain.widow|Đoạn văn kết thúc bằng một từ ở dòng cuối cùng bị cô lập, tạo ra một góa phụ có thể nhìn thấy được.
engine.explain.orphan|Đoạn này bắt đầu bằng một dòng rất ngắn sau một đoạn dài trước đó, có thể đọc là một đoạn văn mồ côi.
engine.explain.comic_sans|Comic Sans siêu dữ liệu đã được tìm thấy trong văn bản đa dạng thức đã gửi.
engine.explain.prime_marks|Dấu đo này sử dụng trích dẫn ASCII thay vì ký hiệu nguyên tố thích hợp.
engine.explain.multiplication_sign|Thứ nguyên này sử dụng chữ x nơi xuất hiện dấu nhân.
engine.explain.trademark_symbol|Ký hiệu dự phòng này nên được thay thế bằng ký hiệu thích hợp.
category.punctuation|Vấn đề về dấu câu
category.spacing|Vấn đề về khoảng cách
category.layout|Vấn đề về bố cục
category.font|Vấn đề về phông chữ
category.symbol|Vấn đề về biểu tượng
severity.infraction|SẠM PHẠM
severity.misdemeanor|TỘI PHẠM
severity.felony|Tội ác
verdict.clean|SẠCH
verdict.infraction|SẠM PHẠM
verdict.misdemeanor|TỘI PHẠM
verdict.felony|Tội ác
verdict.capital|TẠO VỐN
strictness.lenient|Khoan dung
strictness.standard|Tiêu chuẩn
strictness.strict|Nghiêm ngặt
theme.system|Hệ thống
theme.light|Ánh sáng
theme.dark|Tối
dash.spaced|Dải cách
dash.closed|Đã đóng
share_format.image|Hình ảnh
share_format.story|Câu chuyện
share_format.landscape|Phong cảnh
share_format.text|Văn bản thuần túy
share_format.link|Sao chép liên kết
share_format_desc.image|PNG hình ảnh được tối ưu hóa cho nguồn cấp dữ liệu xã hội.
share_format_desc.story|Báo cáo sẵn sàng cho câu chuyện 1080×1920.
share_format_desc.landscape|Thẻ rộng để xem trước bài viết và mạng xã hội.
share_format_desc.text|Tóm tắt văn bản được định dạng.
share_format_desc.link|Bản sao liên kết sâu giữ chỗ.
evidence_source.typed|Đã nhập
evidence_source.pasted|Đã dán
evidence_source.pasted_rich|Đã dán văn bản đa dạng thức
toast.load_failed|Không thể tải hồ sơ vụ án đã lưu.
toast.save_failed|Không lưu được hồ sơ vụ án.
toast.delete_failed|Xóa không thành công.
toast.cleared|Tất cả hồ sơ vụ án đã được xóa.
toast.clear_failed|Không thể xóa hồ sơ vụ án.
toast.export_failed|Xuất không thành công.
"""),
        verdictShortLabels: verdictMap("""
clean|SẠCH
infraction|SẠM PHẠM
misdemeanor|TỘI PHẠM
felony|Tội ác
capitalOffense|TẠO VỐN
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Vấn đề về dấu câu
spacing|Vấn đề về khoảng cách
layout|Vấn đề về bố cục
font|Vấn đề về phông chữ
symbol|Vấn đề về biểu tượng
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Dấu cách kép
straightQuotes|Trích dẫn thẳng
hyphenAsDash|Gạch nối dưới dạng dấu gạch ngang
fakeEllipsis|Dấu chấm lửng giả
widow|Góa phụ
orphan|Mồ côi
inconsistentSpacing|Khoảng cách không nhất quán
comicSans|Comic Sans
primeMarks|Dấu hiệu cơ bản
multiplicationSign|Dấu nhân sai
trademarkSymbol|Lạm dụng biểu tượng nhãn hiệu
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Dấu cách thừa sau dấu câu kết thúc câu.
straightQuotes|ASCII dấu ngoặc kép được sử dụng trong dấu ngoặc kép.
hyphenAsDash|Dấu gạch ngang thay thế cho dấu gạch ngang thực sự.
fakeEllipsis|Ba dấu chấm được sử dụng thay cho ký tự dấu ba chấm.
widow|Dòng cuối cùng chỉ còn lại một từ ngắn gọn.
orphan|Một dòng chuyển tiếp nhỏ ở đầu đoạn văn.
inconsistentSpacing|Các kiểu giãn cách câu hỗn hợp trong một văn bản.
comicSans|Comic Sans được phát hiện trong bằng chứng được gửi.
primeMarks|ASCII trích dẫn được sử dụng ở vị trí của các ký hiệu nguyên tố.
multiplicationSign|Chữ x dùng thay cho ×.
trademarkSymbol|Ký hiệu dự phòng được sử dụng thay cho ©, ® hoặc ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Dấu cách đôi sau câu xuất phát từ thói quen đánh máy. Trong kiểu tỷ lệ hiện đại, một khoảng trắng là mặc định rõ ràng hơn.", "Dấu cách thừa tạo ra nhịp điệu không đồng đều và tạo ra những khoảng trống rõ ràng trong một đoạn văn.", "Máy đánh chữ sử dụng các ký tự có chiều rộng cố định nên việc giãn cách thêm một lần giúp người đọc thấy được dấu ngắt câu.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Tìm kiếm khoảng trắng lặp lại sau dấu câu.", "Chạy quy trình dọn dẹp nhanh trước khi chia sẻ.", "Nếu bạn cố ý sử dụng khoảng trắng kép, hãy giữ chúng nhất quán."]),
            (.straightQuotes, "Dấu ngoặc kép là dấu ASCII đơn giản. Văn bản hoàn tất thường đọc tốt hơn khi có dấu ngoặc nhọn định hướng.", "Các trích dẫn cong trông bóng bẩy hơn và cải thiện nhịp điệu hình ảnh của câu.", "Bàn phím và bộ ký tự ban đầu chỉ giữ một dấu ngoặc kép đơn giản cho cả hai hướng.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Bật dấu câu thông minh nếu có.", "Dọn dẹp văn bản được dán từ các nguồn văn bản thuần túy.", "Kiểm tra số đo để các dấu nguyên tố luôn chính xác."]),
            (.hyphenAsDash, "Dấu nối nối các từ nhưng chúng không thay thế cho dấu gạch ngang hoặc dấu gạch ngang.", "Dấu gạch ngang chính xác sẽ cải thiện âm điệu, khoảng cách và khả năng đọc.", "Dấu gạch nối kép là giải pháp thay thế trong các hệ thống không thể dễ dàng tạo ra dấu câu phong phú.", "He paused -- dramatically.", "He paused — dramatically.", ["Sử dụng ký tự gạch ngang thực mà phong cách của bạn yêu cầu.", "Giữ dấu gạch nối cho từ ghép, không ngắt câu.", "Luôn nhất quán trong toàn bộ tài liệu."]),
            (.fakeEllipsis, "Ba dấu chấm có thể bắt chước dấu chấm lửng nhưng chúng không giống nhau.", "Dấu chấm lửng thực sự có khoảng cách cân bằng và hoạt động tốt hơn trong dòng văn bản.", "Nhiều quy trình viết thông thường vẫn mặc định gõ ba dấu chấm.", "Wait...", "Wait…", ["Thay thế ba dấu chấm bằng ký tự dấu ba chấm.", "Sử dụng tính năng thay thế văn bản nếu bạn gõ văn bản thường xuyên.", "Kiểm tra bản sao đã nhập trước khi xuất bản."]),
            (.widow, "Một góa phụ để lại một từ ngắn bị mắc kẹt ở dòng cuối cùng của đoạn văn.", "Cái kết yếu ớt đó làm gián đoạn hình thái và nhịp điệu của đoạn văn.", "Các biên tập viên và nhà thiết kế đã điều chỉnh ngắt dòng dài để tránh hiện tượng ngắt dòng trong bản in.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Hãy siết chặt lại hoặc viết lại câu một chút.", "Điều chỉnh độ dài dòng nếu có sẵn công cụ bố cục.", "Hãy coi đây là một đề xuất về phong cách nhẹ nhàng."]),
            (.orphan, "Dòng mồ côi là một dòng chuyển tiếp nhỏ bắt đầu một đoạn hoặc khối văn bản mới một cách lúng túng.", "Nó phá vỡ luồng đọc và làm cho bố cục có vẻ ít cân nhắc hơn.", "Quy trình biên tập theo truyền thống sẽ khắc phục lỗi mồ côi trước khi xuất bản.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Viết lại cụm từ gần đó để cân bằng lại dấu ngắt.", "Mở thước đo một chút nếu bạn kiểm soát được bố cục.", "Hãy coi đó là lời cảnh báo chứ không phải là một lỗi cứng nhắc."]),
            (.inconsistentSpacing, "Việc trộn lẫn khoảng cách giữa các câu đơn và câu đôi làm cho văn bản có cảm giác được gắn kết với nhau từ các nguồn khác nhau.", "Người đọc nhanh chóng nhận thấy sự mâu thuẫn, ngay cả khi họ không thể giải thích tại sao.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Chọn một kiểu giãn cách câu.", "Bình thường hóa văn bản đã dán trước khi chia sẻ.", "Giữ sự lựa chọn nhất quán từ đầu đến cuối."]),
            (.comicSans, "Comic Sans không bị cấm nhưng nó mang âm hưởng văn hóa mạnh mẽ, thường xung đột với nội dung nghiêm túc.", "Phông chữ truyền đạt tâm trạng trước khi người đọc xử lý các từ.", "Comic Sans được thiết kế vào năm 1994 dành cho giao diện phần mềm dành cho trẻ em và sau đó đã lan rộng ra ngoài bối cảnh đó.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Chọn kiểu chữ phù hợp với thông điệp.", "Dành khuôn mặt vui tươi cho tác phẩm vui tươi rõ ràng.", "Tắt máy dò này nếu bạn cố ý lựa chọn."]),
            (.primeMarks, "Các phép đo như feet, inch, phút và giây thường cần ký hiệu nguyên tố hơn là dấu ngoặc kép.", "Dấu đúng giúp tránh sự mơ hồ và làm cho văn bản kỹ thuật trông có chủ ý hơn.", nil, "5'11\"", "5′11″", ["Sử dụng ký hiệu số nguyên tố và số nguyên tố kép sau chữ số.", "Theo dõi chuyển đổi báo giá thông minh tự động.", "Kiểm tra kỹ thông số kỹ thuật, menu và kích thước sản phẩm."]),
            (.multiplicationSign, "Chữ x và dấu nhân không thể thay thế cho nhau về kích thước.", "Việc sử dụng × giúp bản sao kỹ thuật và sản phẩm có kiểu chữ rõ ràng hơn.", nil, "1920x1080", "1920×1080", ["Thay x giữa các số bằng ×.", "Sử dụng thay thế văn bản cho các định dạng kích thước phổ biến.", "Xem lại thông số kỹ thuật và nội dung tiếp thị để đảm bảo tính nhất quán."]),
            (.trademarkSymbol, "Các biểu mẫu như (c), (r) và (tm) là ký hiệu dự phòng, không phải là bản sao cuối cùng được đánh bóng.", "Các ký hiệu thích hợp sẽ tiết kiệm không gian và làm cho văn bản pháp luật hoặc thương hiệu trông hoàn chỉnh.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Thay thế ký hiệu dự phòng bằng ©, ® và ™.", "Kiểm tra bản sao pháp lý và tiếp thị trước khi phát hành.", "Giữ khoảng cách xung quanh các ký hiệu đó một cách nhất quán."])
        ])
    )

    static let indonesianPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Laboratorium Kejahatan
app.tab.case_files|Berkas Kasus
app.tab.learn|Pelajari
app.tab.settings|Pengaturan
counts.crimes_categories|Kejahatan: %@ · Kategori: %@
counts.detected_issues|Masalah yang terdeteksi: %@
counts.entries|Entri: %@
counts.characters|Karakter: %@
counts.line_column|Baris %@ · Kol %@
counts.crimes_verdict|Kejahatan: %@ · %@
share.offense_line|• %@: %@
general.done|Selesai
general.cancel|Batal
general.retry|Coba lagi
general.next|Selanjutnya
general.skip|Lewati
general.got_it|Mengerti
general.coming_soon|Segera Hadir
general.wrong|Salah
general.right|Benar
history.empty_title|Belum ada kasus
history.empty_subtitle|Jalankan pemindaian dan berkas kasus Anda akan muncul di sini.
history.share|Bagikan
history.delete|Hapus
history.title|Berkas Kasus
history.today|HARI INI
history.yesterday|Kemarin
history.this_week|MINGGU INI
history.this_month|BULAN INI
history.select_all|Pilih Semua
history.delete_selected|Hapus yang Dipilih
learn.title|Perpustakaan Hukum
learn.search_prompt|Cari jenis kejahatan
learn.empty_title|Tidak ditemukan kejahatan yang cocok
learn.empty_subtitle|Coba istilah penelusuran lain.
learn.what_is_this|Masalah apa ini?
learn.why_it_matters|Mengapa ini penting
learn.history_origin|Sejarah dan konteks
learn.how_to_fix|Cara memperbaikinya
learn.default_why|Tipografi yang baik adalah sistem detail yang cermat.
learn.default_fix|Gunakan karakter yang benar dan jaga konsistensi dokumen.
input.method|Metode Masukan
input.method.paste|Tempel / Ketik
input.method.camera|Kamera (OCR)
input.placeholder|Tempel atau ketik teks Anda di sini…
input.paste_from_clipboard|Tempel dari Clipboard
input.title|Kirimkan Bukti
input.analyze|Analisis
input.analyze_evidence|Analisis Bukti
input.camera_message|Pengenalan teks berbasis kamera akan hadir dalam pembaruan mendatang. Untuk saat ini, tempel atau ketik teks Anda untuk dianalisis.
input.trimmed_warning|Teks dipangkas menjadi 100.000 karakter.
input.clipboard_empty|Papan klip kosong. Salin beberapa teks terlebih dahulu.
input.no_text|Tidak ada teks untuk dianalisis. Tempel atau ketik beberapa teks terlebih dahulu.
home.new_investigation|Investigasi Baru
home.new_investigation_subtitle|Tempel atau ketik teks untuk memulai analisis tipografi forensik
home.new_investigation_badge|PASTE · JENIS · ANALISIS
home.recent_cases|Kasus Terkini
home.see_all|Lihat Semua →
home.empty_title|Belum ada kasus
home.empty_subtitle|Mulai penyelidikan pertama Anda.
home.begin_investigation|Mulai Investigasi
home.stat.scans|Pemindaian
home.stat.crimes|Kejahatan
home.stat.avg|Rata-rata
onboarding.splash_tagline|Setiap mesin terbang adalah bukti.
onboarding.page1.title|Tempel. Menganalisa. Ulasan.
onboarding.page1.body|Masukkan teks apa pun dan aplikasi akan menandai masalah tipografi yang tersembunyi di depan mata.
onboarding.page2.title|Kami Mengetahui Apa yang Hilang dari Pemeriksaan Ejaan
onboarding.page2.body|Kutipan lurus, elips palsu, tanda hubung yang berpura-pura menjadi tanda hubung, dan spasi yang tidak konsisten semuanya muncul di sini.
onboarding.page3.title|Dapatkan Skor Kejahatan Anda
onboarding.page3.body|Lihat seberapa bersih tipografi Anda, lalu bagikan penilaiannya.
onboarding.page4.title|Belajar Sambil Berjalan
onboarding.page4.body|Buka masalah apa pun untuk mengetahui mengapa masalah tersebut penting dan cara memperbaikinya.
onboarding.start|Mulai Investigasi
onboarding.sample.not_em_dash|Bukan tanda hubung em
onboarding.library.investigate|Selidiki
onboarding.library.study|Pelajari peraturannya
analysis.failed_title|Analisis Gagal
analysis.failed_body|Ada yang tidak beres selama pemindaian. Silakan coba lagi.
analysis.status.scan|Memindai bukti tipografi…
analysis.status.quotes|Memeriksa tanda kutip…
analysis.status.dashes|Memeriksa penggunaan tanda hubung…
analysis.status.ellipsis|Memeriksa elips…
analysis.status.spacing|Memeriksa konsistensi spasi…
analysis.status.layout|Memeriksa janda dan anak yatim…
analysis.status.comic_sans|Memeriksa metadata font…
analysis.status.compiling|Menyusun laporan…
mugshot.title|Ditandai karena kesalahan ketik
mugshot.body|Comic Sans ditemukan dalam bukti yang diserahkan. Dalam konteks yang lucu, hal ini bisa berhasil, namun di sebagian besar pengaturan produk dan editorial, hal ini terlihat tidak cocok.
mugshot.continue|Buka Laporan Lengkap →
report.breakdown|Perincian Kejahatan
report.share|Bagikan Laporan
report.new_scan|Pemindaian Baru
report.close|Tutup Laporan
report.copy_fixed|Salin Teks Tetap
report.copy_fixed_hint|Menyalin teks yang dikoreksi saat ini.
report.clean_title|Tanpa noda
report.clean_body|Tidak ada masalah tipografi yang terdeteksi. Teks ini adalah warga negara teladan.
report.replace_single_space|Ganti dengan satu spasi
report.fixed_text_copied|Memperbaiki teks yang disalin ✓
report.manual_rewrite|Masalah ini memerlukan penulisan ulang manual.
report.apply_failed|Tidak dapat menerapkan perbaikan ini.
report.issue_fixed|Masalah telah diperbaiki dan laporan diperbarui ✓
report.learn_more|Pelajari lebih lanjut tentang masalah ini →
settings.detection_rules|Aturan Deteksi
settings.scoring|Skor
settings.strictness|Keketatan Penilaian
settings.dash_style|Gaya Em-dash
settings.appearance|Penampilan
settings.theme|Tema
settings.haptics|Umpan Balik Haptik
settings.sounds|Efek Suara
settings.data|Data
settings.clear_all|Hapus Semua File Kasus
settings.export_all|Ekspor Semua Laporan
settings.about|Tentang
settings.version|Versi
settings.typpo|Typpo
settings.rate_app|Nilai di App Store
settings.send_feedback|Kirim Masukan
settings.privacy|Kebijakan Privasi
settings.footer|Dibuat dengan hati-hati dan kutipan keriting yang tepat.
settings.title|Pengaturan
settings.clear_confirm_title|Hapus semua file kasus?
settings.clear_confirm_message|Tindakan ini tidak dapat dibatalkan.
settings.delete_all|Hapus Semua
settings.about_body|Analisis forensik untuk teks Anda. Tempel teks apa pun, dapatkan skor Anda, dan bagikan keputusannya.
settings.about_placeholder|Build ini sepenuhnya offline dan masih menggunakan link rilis placeholder untuk situs web, kebijakan privasi, dan tujuan App Store.
settings.about_website|Situs web: %@
share.title|Bagikan Laporan
share.copy_report_image|Salin Gambar Laporan
share.save_to_photos|Simpan ke Foto
share.copy_report_text|Salin Teks Laporan
share.photos_needed|Diperlukan Akses Foto
share.open_settings|Buka Pengaturan
share.photos_message|Akses foto diperlukan untuk menyimpan gambar laporan. Buka Setelan untuk memberikan akses.
share.primary.share_text|Bagikan Teks
share.primary.copy_link|Salin Tautan
share.primary.share|Bagikan
share.copied_clipboard|Disalin ke papan klip ✓
share.deep_link_copied|Tautan dalam disalin ✓
share.render_failed|Tidak dapat merender gambar laporan.
share.saved_photos|Disimpan ke Foto ✓
share.save_failed|Tidak dapat menyimpan gambar laporan.
share.swipe_up|BUKA APLIKASI UNTUK MENGANALISIS TEKS ANDA SENDIRI
share.report_heading|Laporan Tipografi
share.score_prefix|Skor
share.top_issues|Masalah teratas
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Teks Anda hanya berisi spasi. Ini bukan kriminal, tapi mencurigakan.
engine.non_latin_warning|Analisis disesuaikan dengan tipografi aksara Latin. Beberapa aturan spasi dan tanda baca mungkin tidak berlaku pada sistem penulisan ini.
engine.short_text_note|Deteksi janda dan anak yatim kurang dapat diandalkan pada jalur yang sangat pendek.
engine.fix.single_space|Gunakan satu spasi setelah tanda baca akhir kalimat.
engine.fix.replace_with|Ganti dengan %@
engine.fix.normalize_spacing|Menormalkan spasi kalimat di seluruh teks.
engine.fix.rewrite_widow|Tulis ulang atau ubah susunan paragraf untuk menghindari baris terakhir yang terdiri dari satu kata.
engine.fix.rewrite_orphan|Sesuaikan salinan terdekat untuk menghindari garis kecil yang terbawa.
engine.fix.change_font|Gunakan font yang lebih sesuai.
engine.explain.double_space|Kalimat ini diakhiri dengan banyak spasi, sebuah konvensi era mesin tik yang tidak termasuk dalam tipografi proporsional.
engine.explain.straight_quotes|Tanda kutip ini menggunakan bentuk ASCII lurus, bukan tanda kutip keriting terarah.
engine.explain.hyphen_dash|Gangguan ini menggunakan karakter tanda hubung tanpa tanda hubung, bukan tanda hubung biasa.
engine.explain.fake_ellipsis|Periode ini harus diganti dengan karakter elipsis.
engine.explain.inconsistent_spacing|Spasi kalimat ini berbeda dengan pola dominan dalam teks.
engine.explain.widow|Paragraf diakhiri dengan kata baris terakhir yang terisolasi, menciptakan janda yang terlihat.
engine.explain.orphan|Paragraf ini dimulai dengan baris yang sangat pendek setelah paragraf panjang sebelumnya, yang kemungkinan besar terbaca sebagai yatim piatu.
engine.explain.comic_sans|Metadata Comic Sans ditemukan dalam teks kaya yang dikirimkan.
engine.explain.prime_marks|Tanda pengukuran ini menggunakan tanda kutip ASCII dan bukan simbol prima.
engine.explain.multiplication_sign|Dimensi ini menggunakan huruf x di mana tanda perkaliannya akan muncul.
engine.explain.trademark_symbol|Notasi fallback ini harus diganti dengan simbol yang sesuai.
category.punctuation|Masalah Tanda Baca
category.spacing|Masalah Spasi
category.layout|Masalah Tata Letak
category.font|Masalah Font
category.symbol|Masalah Simbol
severity.infraction|PELANGGARAN
severity.misdemeanor|PELANGGARAN
severity.felony|KEJADIAN
verdict.clean|BERSIH
verdict.infraction|PELANGGARAN
verdict.misdemeanor|PELANGGARAN
verdict.felony|KEJADIAN
verdict.capital|PELANGGARAN MODAL
strictness.lenient|Tolong
strictness.standard|Standar
strictness.strict|Ketat
theme.system|Sistem
theme.light|Ringan
theme.dark|Gelap
dash.spaced|Spasi
dash.closed|Tutup
share_format.image|Gambar
share_format.story|Cerita
share_format.landscape|Pemandangan
share_format.text|Teks Biasa
share_format.link|Salin Tautan
share_format_desc.image|PNG gambar dioptimalkan untuk umpan sosial.
share_format_desc.story|Laporan siap cerita 1080×1920.
share_format_desc.landscape|Kartu lebar untuk artikel dan pratinjau sosial.
share_format_desc.text|Ringkasan tekstual yang diformat.
share_format_desc.link|Salinan tautan dalam placeholder.
evidence_source.typed|Diketik
evidence_source.pasted|Ditempel
evidence_source.pasted_rich|Teks Kaya yang Ditempel
toast.load_failed|Tidak dapat memuat file kasus yang disimpan.
toast.save_failed|Tidak dapat menyimpan file kasus.
toast.delete_failed|Penghapusan gagal.
toast.cleared|Semua berkas kasus telah dibersihkan.
toast.clear_failed|Tidak dapat menghapus file kasus.
toast.export_failed|Ekspor gagal.
"""),
        verdictShortLabels: verdictMap("""
clean|BERSIH
infraction|PELANGGARAN
misdemeanor|PELANGGARAN
felony|KEJADIAN
capitalOffense|PELANGGARAN MODAL
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Masalah Tanda Baca
spacing|Masalah Spasi
layout|Masalah Tata Letak
font|Masalah Font
symbol|Masalah Simbol
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Spasi Ganda
straightQuotes|Kutipan Lurus
hyphenAsDash|Tanda hubung sebagai tanda hubung
fakeEllipsis|Elipsis Palsu
widow|Janda
orphan|Anak yatim piatu
inconsistentSpacing|Spasi Tidak Konsisten
comicSans|Comic Sans
primeMarks|Nilai Utama
multiplicationSign|Tanda Perkalian Salah
trademarkSymbol|Penyalahgunaan Simbol Merek Dagang
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Spasi tambahan setelah tanda baca akhir kalimat.
straightQuotes|ASCII tanda kutip digunakan di tempat tanda kutip keriting.
hyphenAsDash|Tanda hubung yang menggantikan tanda hubung sebenarnya.
fakeEllipsis|Tiga titik digunakan sebagai pengganti karakter elipsis.
widow|Baris terakhir tersisa hanya dengan satu kata pendek.
orphan|Baris kecil yang terbawa di awal paragraf.
inconsistentSpacing|Campuran gaya spasi kalimat dalam satu teks.
comicSans|Comic Sans terdeteksi dalam bukti yang diserahkan.
primeMarks|ASCII tanda kutip digunakan di tempat simbol prima berada.
multiplicationSign|Huruf x digunakan sebagai pengganti ×.
trademarkSymbol|Notasi cadangan digunakan sebagai pengganti ©, ®, atau ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Spasi ganda setelah kalimat berasal dari kebiasaan mengetik. Dalam tipe proporsional modern, satu spasi adalah default yang lebih rapi.", "Spasi ekstra menciptakan ritme yang tidak merata dan kesenjangan yang terlihat dalam sebuah paragraf.", "Mesin tik menggunakan karakter dengan lebar tetap, sehingga spasi ekstra membantu pembaca melihat jeda kalimat.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Telusuri spasi berulang setelah tanda baca.", "Jalankan izin pembersihan cepat sebelum berbagi.", "Jika spasi ganda memang disengaja, pertahankan konsistensinya."]),
            (.straightQuotes, "Kutipan lurus adalah tanda ASCII biasa. Teks yang sudah selesai biasanya dibaca lebih baik dengan tanda kutip keriting terarah.", "Kutipan keriting terlihat lebih halus dan meningkatkan ritme visual sebuah kalimat.", "Keyboard dan rangkaian karakter awal hanya menggunakan satu tanda kutip sederhana untuk kedua arah.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Aktifkan tanda baca cerdas jika tersedia.", "Membersihkan teks yang ditempel dari sumber teks biasa.", "Periksa pengukuran agar tanda prima tetap benar."]),
            (.hyphenAsDash, "Tanda hubung menggabungkan kata-kata, namun bukan pengganti tanda hubung em atau tanda hubung en.", "Tanda hubung yang benar meningkatkan nada, spasi, dan keterbacaan.", "Tanda hubung ganda adalah solusi dalam sistem yang tidak dapat dengan mudah menghasilkan tanda baca yang kaya.", "He paused -- dramatically.", "He paused — dramatically.", ["Gunakan karakter tanda hubung asli yang dibutuhkan gaya Anda.", "Gunakan tanda hubung untuk kata majemuk, bukan pemutusan kalimat.", "Tetap konsisten di seluruh dokumen."]),
            (.fakeEllipsis, "Tiga titik dapat meniru elipsis, tetapi karakternya tidak sama.", "Elipsis asli memiliki spasi yang seimbang dan berperilaku lebih baik dalam satu baris teks.", "Banyak alur kerja penulisan kasual yang masih menggunakan pengetikan tiga titik secara default.", "Wait...", "Wait…", ["Ganti tiga titik dengan karakter elipsis.", "Gunakan pengganti teks jika Anda sering mengetiknya.", "Periksa salinan yang diimpor sebelum dipublikasikan."]),
            (.widow, "Seorang janda meninggalkan satu kata pendek di baris terakhir paragraf.", "Akhir yang lemah itu mengganggu bentuk dan ritme paragraf.", "Editor dan desainer telah lama menyesuaikan jeda baris untuk menghindari janda di media cetak.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Perketat atau tulis ulang kalimatnya sedikit.", "Sesuaikan panjang garis jika alat tata letak tersedia.", "Perlakukan ini sebagai rekomendasi gaya lembut."]),
            (.orphan, "An Orphan adalah baris kecil yang mengawali paragraf atau blok teks baru dengan canggung.", "Ini merusak alur membaca dan membuat tata letak terasa kurang diperhatikan.", "Alur kerja editorial biasanya memperbaiki anak yatim piatu sebelum dipublikasikan.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Tulis ulang frasa terdekat untuk menyeimbangkan kembali jeda tersebut.", "Buka ukuran sedikit jika Anda mengontrol tata letak.", "Gunakan ini sebagai peringatan, bukan kesalahan yang kaku."]),
            (.inconsistentSpacing, "Menggabungkan spasi kalimat tunggal dan ganda membuat teks terasa digabungkan dari sumber yang berbeda.", "Pembaca segera menyadari ketidakkonsistenan, meskipun mereka tidak dapat menjelaskan alasannya.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Pilih satu gaya spasi kalimat.", "Normalisasikan teks yang ditempel sebelum membagikannya.", "Jaga konsistensi pilihan dari awal hingga akhir."]),
            (.comicSans, "Comic Sans tidak dilarang, namun memiliki nuansa budaya yang kuat dan sering kali berbenturan dengan konten serius.", "Font menyampaikan suasana hati bahkan sebelum pembaca memproses kata-katanya.", "Comic Sans dirancang pada tahun 1994 untuk antarmuka perangkat lunak anak-anak dan kemudian menyebar jauh melampaui konteks tersebut.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Pilih jenis huruf yang sesuai dengan pesan.", "Simpan tampilan tampilan yang ceria untuk pekerjaan yang jelas-jelas menyenangkan.", "Nonaktifkan detektor ini jika pilihannya disengaja."]),
            (.primeMarks, "Pengukuran seperti kaki, inci, menit, dan detik sering kali memerlukan simbol prima, bukan tanda kutip.", "Tanda yang benar mencegah ambiguitas dan membuat teks teknis terlihat lebih disengaja.", nil, "5'11\"", "5′11″", ["Gunakan simbol bilangan prima dan bilangan prima ganda setelah angka.", "Perhatikan konversi kutipan cerdas otomatis.", "Periksa spesifikasi, menu, dan dimensi produk dengan cermat."]),
            (.multiplicationSign, "Huruf x dan tanda perkalian tidak dapat dipertukarkan ukurannya.", "Penggunaan × memberikan salinan teknis dan produk hasil akhir tipografi yang lebih bersih.", nil, "1920x1080", "1920×1080", ["Ganti x di antara angka dengan ×.", "Gunakan pengganti teks untuk format ukuran umum.", "Tinjau spesifikasi dan aset pemasaran untuk mengetahui konsistensinya."]),
            (.trademarkSymbol, "Bentuk seperti (c), (r), dan (tm) adalah notasi cadangan, bukan salinan akhir yang dipoles.", "Simbol yang tepat menghemat ruang dan membuat teks legal atau merek terlihat selesai.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Ganti notasi fallback dengan ©, ®, dan ™.", "Periksa salinan hukum dan pemasaran sebelum dirilis.", "Jaga jarak di sekitar simbol tersebut tetap konsisten."])
        ])
    )

    static let malayPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|Makmal Jenayah
app.tab.case_files|Fail Kes
app.tab.learn|Belajar
app.tab.settings|Tetapan
counts.crimes_categories|Jenayah: %@ · Kategori: %@
counts.detected_issues|Isu yang dikesan: %@
counts.entries|Entri: %@
counts.characters|Watak: %@
counts.line_column|Baris %@ · Kol %@
counts.crimes_verdict|Jenayah: %@ · %@
share.offense_line|• %@: %@
general.done|Selesai
general.cancel|Batal
general.retry|Cuba semula
general.next|Seterusnya
general.skip|Langkau
general.got_it|Faham
general.coming_soon|Akan Datang
general.wrong|Salah
general.right|Betul
history.empty_title|Tiada kes lagi
history.empty_subtitle|Jalankan imbasan dan fail kes anda akan dipaparkan di sini.
history.share|Kongsi
history.delete|Padam
history.title|Fail Kes
history.today|HARI INI
history.yesterday|SEmalam
history.this_week|MINGGU INI
history.this_month|BULAN INI
history.select_all|Pilih Semua
history.delete_selected|Padam Dipilih
learn.title|Perpustakaan Undang-undang
learn.search_prompt|Cari jenis jenayah
learn.empty_title|Tiada jenayah yang sepadan ditemui
learn.empty_subtitle|Cuba istilah carian lain.
learn.what_is_this|Apakah isu ini?
learn.why_it_matters|Mengapa ia penting
learn.history_origin|Sejarah dan konteks
learn.how_to_fix|Cara membetulkannya
learn.default_why|Tipografi yang baik ialah sistem perincian yang bernas.
learn.default_fix|Gunakan aksara yang betul dan pastikan dokumen itu konsisten.
input.method|Kaedah Input
input.method.paste|Tampal / Taip
input.method.camera|Kamera (OCR)
input.placeholder|Tampal atau taip teks anda di sini…
input.paste_from_clipboard|Tampal dari Papan Klip
input.title|Serahkan Bukti
input.analyze|Analisis
input.analyze_evidence|Analisis Bukti
input.camera_message|Pengecaman teks berasaskan kamera akan datang dalam kemas kini masa hadapan. Buat masa ini, tampal atau taip teks anda untuk dianalisis.
input.trimmed_warning|Teks telah dipangkas kepada 100,000 aksara.
input.clipboard_empty|Papan klip kosong. Salin beberapa teks dahulu.
input.no_text|Tiada teks untuk dianalisis. Tampal atau taip beberapa teks dahulu.
home.new_investigation|Penyiasatan Baharu
home.new_investigation_subtitle|Tampal atau taip teks untuk memulakan analisis tipografi forensik
home.new_investigation_badge|TAMPAL · JENIS · ANALISIS
home.recent_cases|Kes Terkini
home.see_all|Lihat Semua →
home.empty_title|Tiada kes lagi
home.empty_subtitle|Mulakan penyiasatan pertama anda.
home.begin_investigation|Mulakan Penyiasatan
home.stat.scans|Imbasan
home.stat.crimes|Jenayah
home.stat.avg|Purata
onboarding.splash_tagline|Setiap glyph adalah bukti.
onboarding.page1.title|Tampal. Menganalisis. Semak semula.
onboarding.page1.body|Letakkan sebarang teks dan apl akan membenderakan isu tipografi yang tersembunyi di hadapan mata.
onboarding.page2.title|Kami Tangkap Perkara yang Terlepas dari Semakan Ejaan
onboarding.page2.body|Petikan lurus, elips palsu, tanda sempang berpura-pura sebagai tanda sempang dan jarak yang tidak konsisten semuanya dipaparkan di sini.
onboarding.page3.title|Dapatkan Skor Jenayah Anda
onboarding.page3.body|Lihat betapa bersihnya tipografi anda, kemudian kongsi keputusannya.
onboarding.page4.title|Belajar Semasa Anda Pergi
onboarding.page4.body|Buka sebarang isu untuk melihat sebab ia penting dan cara membetulkannya.
onboarding.start|Mula Menyiasat
onboarding.sample.not_em_dash|Bukan sempang em
onboarding.library.investigate|Siasat
onboarding.library.study|Kaji peraturan
analysis.failed_title|Analisis Gagal
analysis.failed_body|Sesuatu telah berlaku semasa imbasan. Sila cuba lagi.
analysis.status.scan|Mengimbas bukti tipografi...
analysis.status.quotes|Menyemak tanda petikan…
analysis.status.dashes|Menyemak penggunaan dash…
analysis.status.ellipsis|Menyemak elips…
analysis.status.spacing|Menyemak ketekalan jarak...
analysis.status.layout|Memeriksa balu dan anak yatim…
analysis.status.comic_sans|Menyemak metadata fon…
analysis.status.compiling|Menyusun laporan…
mugshot.title|Dibenderakan kerana salah laku tipografi
mugshot.body|Comic Sans ditemui dalam bukti yang dikemukakan. Dalam konteks suka bermain ia boleh berfungsi, tetapi dalam kebanyakan tetapan produk dan editorial ia dibaca sebagai tidak sepadan.
mugshot.continue|Buka Laporan Penuh →
report.breakdown|Pecahan Jenayah
report.share|Kongsi Laporan
report.new_scan|Imbasan Baharu
report.close|Tutup Laporan
report.copy_fixed|Salin Teks Tetap
report.copy_fixed_hint|Menyalin teks semasa yang diperbetulkan.
report.clean_title|Tanpa noda
report.clean_body|Tiada isu tipografi dikesan. Teks ini ialah warganegara contoh.
report.replace_single_space|Ganti dengan satu ruang
report.fixed_text_copied|Teks tetap disalin ✓
report.manual_rewrite|Isu ini memerlukan penulisan semula manual.
report.apply_failed|Tidak dapat menggunakan pembetulan ini.
report.issue_fixed|Isu dibetulkan dan laporan dikemas kini ✓
report.learn_more|Ketahui lebih lanjut tentang isu ini →
settings.detection_rules|Peraturan Pengesanan
settings.scoring|Pemarkahan
settings.strictness|Ketegasan Pemarkahan
settings.dash_style|Gaya Em-dash
settings.appearance|Penampilan
settings.theme|Tema
settings.haptics|Maklum Balas Haptik
settings.sounds|Kesan Bunyi
settings.data|Data
settings.clear_all|Kosongkan Semua Fail Kes
settings.export_all|Eksport Semua Laporan
settings.about|Mengenai
settings.version|Versi
settings.typpo|Typpo
settings.rate_app|Nilai pada App Store
settings.send_feedback|Hantar Maklum Balas
settings.privacy|Dasar Privasi
settings.footer|Dibuat dengan teliti dan petikan kerinting yang betul.
settings.title|Tetapan
settings.clear_confirm_title|Kosongkan semua fail kes?
settings.clear_confirm_message|Tindakan ini tidak boleh dibuat asal.
settings.delete_all|Padam Semua
settings.about_body|Analisis forensik untuk teks anda. Tampal sebarang teks, dapatkan markah anda dan kongsi keputusan.
settings.about_placeholder|Binaan ini di luar talian sepenuhnya dan masih menggunakan pautan keluaran pemegang tempat untuk tapak web, dasar privasi dan destinasi App Store.
settings.about_website|Tapak web: %@
share.title|Kongsi Laporan
share.copy_report_image|Salin Imej Laporan
share.save_to_photos|Simpan ke Foto
share.copy_report_text|Salin Teks Laporan
share.photos_needed|Akses Foto Diperlukan
share.open_settings|Buka Tetapan
share.photos_message|Akses foto diperlukan untuk menyimpan imej laporan. Buka Tetapan untuk memberikan akses.
share.primary.share_text|Kongsi Teks
share.primary.copy_link|Salin Pautan
share.primary.share|Kongsi
share.copied_clipboard|Disalin ke papan keratan ✓
share.deep_link_copied|Pautan dalam disalin ✓
share.render_failed|Tidak dapat memaparkan imej laporan.
share.saved_photos|Disimpan ke Foto ✓
share.save_failed|Tidak dapat menyimpan imej laporan.
share.swipe_up|BUKA APL UNTUK MENGANALISIS TEKS ANDA SENDIRI
share.report_heading|Laporan Tipografi
share.score_prefix|Skor
share.top_issues|Isu teratas
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|Teks anda hanya mengandungi ruang putih. Ia bukan jenayah, tetapi ia mencurigakan.
engine.non_latin_warning|Analisis ditala untuk tipografi skrip Latin. Sesetengah peraturan jarak dan tanda baca mungkin tidak digunakan pada sistem penulisan ini.
engine.short_text_note|Pengesanan balu dan anak yatim kurang dipercayai pada laluan yang sangat pendek.
engine.fix.single_space|Gunakan satu ruang selepas tanda baca akhir ayat.
engine.fix.replace_with|Ganti dengan %@
engine.fix.normalize_spacing|Normalkan jarak ayat di seluruh teks.
engine.fix.rewrite_widow|Tulis semula atau aliran semula perenggan untuk mengelakkan baris akhir satu perkataan.
engine.fix.rewrite_orphan|Laraskan salinan berdekatan untuk mengelakkan garisan pembawa yang kecil.
engine.fix.change_font|Gunakan fon yang lebih sesuai.
engine.explain.double_space|Ayat ini berakhir dengan berbilang ruang, konvensyen era mesin taip yang tidak termasuk dalam tipografi berkadar.
engine.explain.straight_quotes|Tanda petikan ini menggunakan bentuk ASCII lurus dan bukannya petikan kerinting arah.
engine.explain.hyphen_dash|Gangguan ini menggunakan aksara sempang-tolak dan bukannya sempang yang betul.
engine.explain.fake_ellipsis|Larian tempoh ini harus digantikan dengan aksara elipsis.
engine.explain.inconsistent_spacing|Jarak ayat ini berbeza daripada pola dominan dalam teks.
engine.explain.widow|Perenggan itu berakhir dengan perkataan baris akhir yang terpencil, mewujudkan balu yang kelihatan.
engine.explain.orphan|Perenggan ini bermula dengan baris yang sangat pendek selepas perenggan yang panjang sebelumnya, yang berkemungkinan berbunyi sebagai anak yatim.
engine.explain.comic_sans|Comic Sans metadata ditemui dalam teks kaya yang diserahkan.
engine.explain.prime_marks|Tanda ukuran ini menggunakan petikan ASCII dan bukannya simbol perdana yang betul.
engine.explain.multiplication_sign|Dimensi ini menggunakan huruf x di mana tanda darab sepatutnya muncul.
engine.explain.trademark_symbol|Notasi sandaran ini hendaklah digantikan dengan simbol yang betul.
category.punctuation|Isu Tanda Baca
category.spacing|Isu Jarak
category.layout|Isu Reka Letak
category.font|Isu Fon
category.symbol|Isu Simbol
severity.infraction|PELANGGARAN
severity.misdemeanor|SALAH TUGAS
severity.felony|FELONI
verdict.clean|BERSIH
verdict.infraction|PELANGGARAN
verdict.misdemeanor|SALAH TUGAS
verdict.felony|FELONI
verdict.capital|KESALAHAN MODAL
strictness.lenient|Lembut
strictness.standard|Standard
strictness.strict|Tegas
theme.system|Sistem
theme.light|Cahaya
theme.dark|Gelap
dash.spaced|Berjarak
dash.closed|Tertutup
share_format.image|Imej
share_format.story|Cerita
share_format.landscape|Lanskap
share_format.text|Teks Biasa
share_format.link|Salin Pautan
share_format_desc.image|Imej PNG dioptimumkan untuk suapan sosial.
share_format_desc.story|Laporan sedia cerita 1080×1920.
share_format_desc.landscape|Kad lebar untuk artikel dan pratonton sosial.
share_format_desc.text|Ringkasan teks yang diformatkan.
share_format_desc.link|Salinan pautan dalam pemegang tempat.
evidence_source.typed|Ditaip
evidence_source.pasted|Ditampal
evidence_source.pasted_rich|Teks Kaya Tampal
toast.load_failed|Tidak dapat memuatkan fail kes yang disimpan.
toast.save_failed|Tidak dapat menyimpan fail kes.
toast.delete_failed|Gagal pemadaman.
toast.cleared|Semua fail kes dikosongkan.
toast.clear_failed|Tidak dapat mengosongkan fail kes.
toast.export_failed|Eksport gagal.
"""),
        verdictShortLabels: verdictMap("""
clean|BERSIH
infraction|PELANGGARAN
misdemeanor|SALAH TUGAS
felony|FELONI
capitalOffense|KESALAHAN MODAL
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|Isu Tanda Baca
spacing|Isu Jarak
layout|Isu Reka Letak
font|Isu Fon
symbol|Isu Simbol
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|Ruang Berganda
straightQuotes|Petikan Lurus
hyphenAsDash|Sempang sebagai Sempang
fakeEllipsis|Elipsis Palsu
widow|Janda
orphan|Anak Yatim
inconsistentSpacing|Jarak Tidak Konsisten
comicSans|Comic Sans
primeMarks|Tanda Utama
multiplicationSign|Tanda Darab Salah
trademarkSymbol|Penyalahgunaan Simbol Tanda Dagangan
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|Ruang tambahan selepas tanda baca akhir ayat.
straightQuotes|ASCII petikan digunakan di mana petikan kerinting tergolong.
hyphenAsDash|Sempang berdiri untuk tanda sempang sebenar.
fakeEllipsis|Tiga noktah digunakan dan bukannya aksara elipsis.
widow|Baris akhir yang tinggal dengan hanya satu perkataan pendek.
orphan|Barisan bawaan kecil pada permulaan perenggan.
inconsistentSpacing|Gaya jarak ayat bercampur dalam satu teks.
comicSans|Comic Sans dikesan dalam bukti yang dikemukakan.
primeMarks|ASCII petikan digunakan di mana simbol utama berada.
multiplicationSign|Huruf x digunakan bukannya ×.
trademarkSymbol|Notasi sandaran digunakan dan bukannya ©, ® atau ™.
"""),
        articles: articleMap([
            (.doubleSpace, "Ruang dua selepas ayat berasal daripada tabiat mesin taip. Dalam jenis berkadar moden, satu ruang adalah lalai yang lebih bersih.", "Ruang tambahan mencipta irama tidak sekata dan jurang yang kelihatan dalam perenggan.", "Penulis taip menggunakan aksara lebar tetap, jadi jarak tambahan sekali membantu pembaca melihat pecahan ayat.", "The case is closed.  Move on.", "The case is closed. Move on.", ["Cari ruang berulang selepas tanda baca.", "Jalankan pas pembersihan pantas sebelum berkongsi.", "Jika ruang berkembar disengajakan, pastikan ia konsisten."]),
            (.straightQuotes, "Petikan lurus adalah tanda ASCII biasa. Teks siap biasanya dibaca lebih baik dengan petikan kerinting arah.", "Petikan kerinting kelihatan lebih digilap dan meningkatkan irama visual ayat.", "Papan kekunci dan set aksara awal hanya menyimpan satu tanda petikan mudah untuk kedua-dua arah.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["Hidupkan tanda baca pintar jika tersedia.", "Bersihkan teks yang ditampal daripada sumber teks biasa.", "Semak ukuran supaya tanda utama kekal betul."]),
            (.hyphenAsDash, "Sempang menggabungkan perkataan, tetapi ia bukan pengganti bagi sempang atau sempang en.", "Sempang yang betul meningkatkan nada, jarak dan kebolehbacaan.", "Sempang berganda ialah penyelesaian dalam sistem yang tidak dapat menghasilkan tanda baca yang kaya dengan mudah.", "He paused -- dramatically.", "He paused — dramatically.", ["Gunakan aksara sengkang sebenar yang diperlukan oleh gaya anda.", "Simpan tanda sempang untuk majmuk, bukan patah ayat.", "Kekal konsisten merentas keseluruhan dokumen."]),
            (.fakeEllipsis, "Tiga noktah boleh meniru elipsis, tetapi ia bukan aksara yang sama.", "Elipsis sebenar mempunyai jarak yang seimbang dan berkelakuan lebih baik dalam baris teks.", "Banyak aliran kerja penulisan kasual masih lalai untuk menaip tiga noktah.", "Wait...", "Wait…", ["Ganti tiga noktah dengan aksara elipsis.", "Gunakan penggantian teks jika anda kerap menaipnya.", "Semak salinan yang diimport sebelum diterbitkan."]),
            (.widow, "Seorang balu meninggalkan satu perkataan pendek terkandas pada baris terakhir perenggan.", "Penghujung yang lemah itu mengganggu bentuk dan irama perenggan.", "Editor dan pereka bentuk telah lama melaraskan pemisah baris untuk mengelakkan balu dalam cetakan.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["Ketatkan atau tulis semula ayat itu sedikit.", "Laraskan panjang baris jika alatan reka letak tersedia.", "Anggap ini sebagai cadangan gaya lembut."]),
            (.orphan, "Anak yatim ialah baris bawaan kecil yang memulakan perenggan baharu atau blok teks dengan janggal.", "Ia memecahkan aliran bacaan dan menjadikan reka letak berasa kurang dipertimbangkan.", "Aliran kerja editorial secara tradisinya membetulkan anak yatim sebelum diterbitkan.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["Tulis semula frasa berdekatan untuk mengimbangi semula rehat.", "Buka ukuran sedikit jika anda mengawal reka letak.", "Gunakan ia sebagai amaran, bukan ralat tegar."]),
            (.inconsistentSpacing, "Mencampurkan jarak ayat tunggal dan dua ayat menjadikan teks terasa dicantum daripada sumber yang berbeza.", "Pembaca menyedari ketidakkonsistenan dengan cepat, walaupun mereka tidak dapat menjelaskan sebabnya.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["Pilih satu gaya jarak ayat.", "Normalkan teks yang ditampal sebelum berkongsinya.", "Pastikan pilihan konsisten dari awal hingga akhir."]),
            (.comicSans, "Comic Sans tidak dilarang, tetapi ia membawa nada budaya yang kuat yang sering bertentangan dengan salinan serius.", "Fon menyampaikan perasaan sebelum pembaca memproses perkataan.", "Comic Sans telah direka pada tahun 1994 untuk antara muka perisian kanak-kanak dan kemudian merebak jauh melangkaui konteks tersebut.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["Pilih muka taip yang sesuai dengan mesej.", "Tempah muka paparan suka bermain untuk kerja yang jelas suka bermain.", "Lumpuhkan pengesan ini jika pilihan itu disengajakan."]),
            (.primeMarks, "Ukuran seperti kaki, inci, minit dan saat selalunya memerlukan simbol perdana dan bukannya tanda petikan.", "Tanda yang betul menghalang kekaburan dan menjadikan teks teknikal kelihatan lebih disengajakan.", nil, "5'11\"", "5′11″", ["Gunakan simbol perdana dan perdana dua kali selepas nombor.", "Perhatikan penukaran petikan pintar automatik.", "Semak spesifikasi, menu dan dimensi produk dengan teliti."]),
            (.multiplicationSign, "Huruf x dan tanda darab tidak boleh ditukar ganti dalam dimensi.", "Menggunakan × memberikan kemasan tipografi teknikal dan produk yang lebih bersih.", nil, "1920x1080", "1920×1080", ["Gantikan x antara nombor dengan ×.", "Gunakan penggantian teks untuk format saiz biasa.", "Semak spesifikasi dan aset pemasaran untuk konsistensi."]),
            (.trademarkSymbol, "Borang seperti (c), (r) dan (tm) ialah tatatanda sandaran, bukan salinan akhir yang digilap.", "Simbol yang betul menjimatkan ruang dan menjadikan teks undang-undang atau jenama kelihatan selesai.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["Ganti tatatanda sandaran dengan ©, ® dan ™.", "Semak salinan undang-undang dan pemasaran sebelum dikeluarkan.", "Pastikan jarak di sekeliling simbol tersebut konsisten."])
        ])
    )
}
