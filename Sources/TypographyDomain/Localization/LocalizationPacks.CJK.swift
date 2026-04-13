import Foundation

extension L10n {
    static let simplifiedChinesePack = makePack(
        ui: uiMap("""
app.tab.crime_lab|犯罪实验室
app.tab.case_files|案例档案
app.tab.learn|学习
app.tab.settings|设置
counts.crimes_categories|犯罪：%@ · 类别：%@
counts.detected_issues|检测到的问题：%@
counts.entries|条目：%@
counts.characters|字符：%@
counts.line_column|行 %@ · 栏 %@
counts.crimes_verdict|犯罪：%@ · %@
share.offense_line|• %@: %@
general.done|完成
general.cancel|取消
general.retry|重试
general.next|下一步
general.skip|跳过
general.got_it|知道了
general.coming_soon|即将推出
general.wrong|错误
general.right|右
history.empty_title|尚无案例
history.empty_subtitle|运行扫描，您的案例文件将显示在此处。
history.share|分享
history.delete|删除
history.title|案例档案
history.today|今天
history.yesterday|昨天
history.this_week|本周
history.this_month|本月
history.select_all|全选
history.delete_selected|删除所选内容
learn.title|法律图书馆
learn.search_prompt|搜索犯罪类型
learn.empty_title|未找到匹配的犯罪行为
learn.empty_subtitle|尝试不同的搜索词。
learn.what_is_this|这个问题是什么？
learn.why_it_matters|为什么它很重要
learn.history_origin|历史和背景
learn.how_to_fix|如何修复
learn.default_why|好的排版是一个深思熟虑的细节系统。
learn.default_fix|使用正确的字符并保持文档一致。
input.method|输入法
input.method.paste|粘贴/输入
input.method.camera|相机（OCR）
input.placeholder|在此处粘贴或输入您的文本...
input.paste_from_clipboard|从剪贴板粘贴
input.title|提交证据
input.analyze|分析
input.analyze_evidence|分析证据
input.camera_message|基于摄像头的文本识别将在未来的更新中推出。现在，粘贴或输入您的文本进行分析。
input.trimmed_warning|文本已修剪为 100,000 个字符。
input.clipboard_empty|剪贴板为空。先复制一些文字。
input.no_text|没有要分析的文本。首先粘贴或输入一些文本。
home.new_investigation|新调查
home.new_investigation_subtitle|粘贴或输入文本以开始取证排版分析
home.new_investigation_badge|粘贴·类型·分析
home.recent_cases|近期案例
home.see_all|查看全部→
home.empty_title|尚无案例
home.empty_subtitle|开始您的第一次调查。
home.begin_investigation|开始调查
home.stat.scans|扫描
home.stat.crimes|犯罪
home.stat.avg|平均
onboarding.splash_tagline|每个字形都是证据。
onboarding.page1.title|粘贴。分析。回顾。
onboarding.page1.body|只要输入任何文本，应用程序就会标记隐藏在视线中的印刷问题。
onboarding.page2.title|我们发现拼写检查遗漏的内容
onboarding.page2.body|直引号、假省略号、冒充破折号的连字符以及不一致的间距都显示在这里。
onboarding.page3.title|获取您的犯罪分数
onboarding.page3.body|看看您的排版有多干净，然后分享结论。
onboarding.page4.title|边走边学
onboarding.page4.body|打开任何问题以了解其重要性以及如何解决它。
onboarding.start|开始调查
onboarding.sample.not_em_dash|不是破折号
onboarding.library.investigate|调查
onboarding.library.study|研究规则
analysis.failed_title|分析失败
analysis.failed_body|扫描期间出现问题。请重试。
analysis.status.scan|扫描印刷证据...
analysis.status.quotes|检查引号...
analysis.status.dashes|正在检查破折号的使用情况...
analysis.status.ellipsis|检查省略号...
analysis.status.spacing|检查间距一致性...
analysis.status.layout|检查寡妇和孤儿……
analysis.status.comic_sans|正在检查字体元数据...
analysis.status.compiling|正在编制报告...
mugshot.title|被标记为印刷不当行为
mugshot.body|在提交的证据中发现Comic Sans。在有趣的环境中，它可以发挥作用，但在大多数产品和编辑设置中，它会被视为不匹配。
mugshot.continue|打开完整报告→
report.breakdown|犯罪分类
report.share|分享报告
report.new_scan|新扫描
report.close|关闭报告
report.copy_fixed|复制固定文本
report.copy_fixed_hint|复制当前更正的文本。
report.clean_title|一尘不染
report.clean_body|未检测到印刷问题。此文是模范公民。
report.replace_single_space|替换为单个空格
report.fixed_text_copied|已复制固定文本 ✓
report.manual_rewrite|此问题需要手动重写。
report.apply_failed|无法应用此修复。
report.issue_fixed|问题已修复并更新报告 ✓
report.learn_more|了解有关此问题的更多信息 →
settings.detection_rules|检测规则
settings.scoring|评分
settings.strictness|评分严格
settings.dash_style|破折号样式
settings.appearance|外观
settings.theme|主题
settings.haptics|触觉反馈
settings.sounds|音效
settings.data|数据
settings.clear_all|清除所有案件档案
settings.export_all|导出所有报告
settings.about|关于
settings.version|版本
settings.typpo|Typpo
settings.rate_app|App Store 上的评分
settings.send_feedback|发送反馈
settings.privacy|隐私政策
settings.footer|精心制作并使用正确的弯引号。
settings.title|设置
settings.clear_confirm_title|清除所有案件档案？
settings.clear_confirm_message|此操作无法撤消。
settings.delete_all|全部删除
settings.about_body|对您的文本进行取证分析。粘贴任意文本，获取分数并分享结论。
settings.about_placeholder|此版本完全离线，仍然使用网站、隐私政策和 App Store 目的地的占位符发布链接。
settings.about_website|网站：%@
share.title|分享报告
share.copy_report_image|复制报告图片
share.save_to_photos|保存到照片
share.copy_report_text|复制报告文本
share.photos_needed|需要访问照片
share.open_settings|打开设置
share.photos_message|需要访问照片才能保存报告图像。打开“设置”以授予访问权限。
share.primary.share_text|分享文字
share.primary.copy_link|复制链接
share.primary.share|分享
share.copied_clipboard|已复制到剪贴板 ✓
share.deep_link_copied|已复制深层链接 ✓
share.render_failed|无法呈现报表图像。
share.saved_photos|保存到照片✓
share.save_failed|无法保存报告图像。
share.swipe_up|打开应用程序来分析您自己的文本
share.report_heading|版式报告
share.score_prefix|得分
share.top_issues|主要问题
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|您的文本仅包含空格。这不是犯罪，但很可疑。
engine.non_latin_warning|分析针对拉丁文字排版进行了调整。某些空格和标点规则可能不适用于此书写系统。
engine.short_text_note|寡妇和孤儿检测在非常短的段落中不太可靠。
engine.fix.single_space|在句尾标点符号后使用一个空格。
engine.fix.replace_with|替换为 %@
engine.fix.normalize_spacing|规范整个文本中的句子间距。
engine.fix.rewrite_widow|重写或重排该段落以避免最后一行只有一个单词。
engine.fix.rewrite_orphan|调整附近的副本以避免出现微小的残留线。
engine.fix.change_font|使用更合适的字体。
engine.explain.double_space|这句话以多个空格结尾，这是打字机时代的惯例，不属于比例排版。
engine.explain.straight_quotes|此引号使用直 ASCII 形式，而不是定向弯引号。
engine.explain.hyphen_dash|此中断使用连字符减号字符而不是正确的破折号。
engine.explain.fake_ellipsis|这一系列句点应替换为省略号字符。
engine.explain.inconsistent_spacing|此句子间距与文本中的主导模式不同。
engine.explain.widow|段落以一个独立的最后一行单词结尾，创建一个可见的寡妇。
engine.explain.orphan|该段落以很短的一行开始，后面是一个很长的前一段，读起来可能是一个孤立的段落。
engine.explain.comic_sans|在提交的富文本中找到Comic Sans元数据。
engine.explain.prime_marks|此测量标记使用 ASCII 引号而不是正确的撇号。
engine.explain.multiplication_sign|此尺寸在乘号应出现的位置使用字母 x。
engine.explain.trademark_symbol|此后备符号应替换为正确的符号。
category.punctuation|标点符号问题
category.spacing|间距问题
category.layout|布局问题
category.font|字体问题
category.symbol|符号问题
severity.infraction|违规
severity.misdemeanor|轻罪
severity.felony|重罪
verdict.clean|干净
verdict.infraction|违规
verdict.misdemeanor|轻罪
verdict.felony|重罪
verdict.capital|重罪
strictness.lenient|宽容
strictness.standard|标准
strictness.strict|严格
theme.system|系统
theme.light|光
theme.dark|黑暗
dash.spaced|间隔
dash.closed|关闭
share_format.image|图片
share_format.story|故事
share_format.landscape|风景
share_format.text|纯文本
share_format.link|复制链接
share_format_desc.image|PNG 针对社交源优化的图像。
share_format_desc.story|1080×1920 故事就绪报告。
share_format_desc.landscape|用于文章和社交预览的宽卡。
share_format_desc.text|格式化文本摘要。
share_format_desc.link|占位符深层链接复制。
evidence_source.typed|已输入
evidence_source.pasted|已粘贴
evidence_source.pasted_rich|粘贴富文本
toast.load_failed|无法加载已保存的案例文件。
toast.save_failed|无法保存案例文件。
toast.delete_failed|删除失败。
toast.cleared|所有案件档案均已清除。
toast.clear_failed|无法清除案例文件。
toast.export_failed|导出失败。
"""),
        verdictShortLabels: verdictMap("""
clean|干净
infraction|违规
misdemeanor|轻罪
felony|重罪
capitalOffense|重罪
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|标点符号问题
spacing|间距问题
layout|布局问题
font|字体问题
symbol|符号问题
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|双空格
straightQuotes|直引号
hyphenAsDash|连字符作为破折号
fakeEllipsis|假省略号
widow|寡妇
orphan|孤儿
inconsistentSpacing|间距不一致
comicSans|Comic Sans
primeMarks|优质标记
multiplicationSign|错误的乘号
trademarkSymbol|商标符号滥用
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|句尾标点符号后有多余空格。
straightQuotes|ASCII 引号用于大引号所在的位置。
hyphenAsDash|连字符代表真正的破折号。
fakeEllipsis|使用三个句点代替省略号字符。
widow|最后一行只剩下一个简短的单词。
orphan|段落开头的微小结转行。
inconsistentSpacing|在一篇文本中混合句子间距样式。
comicSans|在提交的证据中检测到Comic Sans。
primeMarks|ASCII 引号用于素数符号所属的位置。
multiplicationSign|使用字母 x 代替 ×。
trademarkSymbol|使用备用符号代替 ©、® 或 ™。
"""),
        articles: articleMap([
            (.doubleSpace, "句子后面的双空格来自打字习惯。在现代比例字体中，一个空格是更清晰的默认值。", "多余的空格会造成段落节奏不均匀和明显的间隙。", "打字机使用固定宽度的字符，因此额外的间距曾经帮助读者看到句子的中断。", "The case is closed.  Move on.", "The case is closed. Move on.", ["搜索标点符号后重复的空格。", "在共享之前运行快速清理过程。", "如果有意使用双空格，请保持它们一致。"]),
            (.straightQuotes, "直引号是普通的 ASCII 标记。完成的文本通常使用定向弯引号读起来更好。", "弯引号看起来更优美，并改善句子的视觉节奏。", "早期的键盘和字符集只为两个方向保留一个简单的引号。", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["在可用的情况下启用智能标点符号。", "清理从纯文本源粘贴的文本。", "检查测量结果，确保底色标记保持正确。"]),
            (.hyphenAsDash, "连字符连接单词，但它们不能替代长破折号或短破折号。", "正确的破折号可以改善语气、间距和可读性。", "双连字符是无法轻松生成丰富标点符号的系统中的一种解决方法。", "He paused -- dramatically.", "He paused — dramatically.", ["使用您的风格所需的真正破折号字符。", "保留复合词的连字符，而不是断句。", "整个文档保持一致。"]),
            (.fakeEllipsis, "三个句点可以模仿省略号，但它们不是同一个字符。", "真正的省略号具有平衡的间距，并且在文本行中表现更好。", "许多休闲写作工作流程仍然默认输入三个句点。", "Wait...", "Wait…", ["用省略号字符替换三个句点。", "如果您经常键入文本，请使用文本替换。", "发布前检查导入的副本。"]),
            (.widow, "寡妇在段落的最后一行留下了一个简短的单词。", "这个薄弱的结尾破坏了段落的形状和节奏。", "编辑和设计师会长时间调整换行符，以避免打印时出现寡妇。", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["稍微收紧或重写句子。", "如果布局工具可用，请调整行长度。", "将此视为软风格推荐。"]),
            (.orphan, "孤行是一个很小的遗留行，它笨拙地开始一个新的段落或文本块。", "它破坏了阅读流程，并使布局感觉不那么经过考虑。", "编辑工作流程传统上会在发布前修复孤立的内容。", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["重写附近的短语以重新平衡中断。", "如果您控制布局，请稍微打开度量。", "将其用作警告，而不是严格的错误。"]),
            (.inconsistentSpacing, "混合单句和双句间距使文本感觉是来自不同来源的缝合在一起。", "读者很快就会注意到不一致之处，即使他们无法解释原因。", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["选择一种句子间距样式。", "在共享粘贴的文本之前对其进行标准化。", "从开始到结束保持选择一致。"]),
            (.comicSans, "Comic Sans 并不被禁止，但它带有强烈的文化基调，常常与严肃的文案发生冲突。", "字体在读者处理文字之前就已经传达了情绪。", "Comic Sans 于 1994 年为儿童软件界面设计，后来远远超出了该范围。", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["选择适合消息的字体。", "为明显有趣的工作保留有趣的显示面。", "如果有意选择，请禁用此检测器。"]),
            (.primeMarks, "英尺、英寸、分钟和秒等度量单位通常需要主符号而不是引号。", "正确的标记可以防止歧义并使技术文本看起来更加经过深思熟虑。", nil, "5'11\"", "5′11″", ["在数字后使用撇号和双撇号。", "注意自动智能报价转换。", "仔细检查规格、菜单和产品尺寸。"]),
            (.multiplicationSign, "字母 x 和乘号在尺寸上不可互换。", "使用 × 可以使技术和产品文案的排版更加清晰。", nil, "1920x1080", "1920×1080", ["将数字之间的 x 替换为 ×。", "对常见尺寸格式使用文本替换。", "审核规格和营销资产以确保一致性。"]),
            (.trademarkSymbol, "(c)、(r) 和 (tm) 等形式是后备表示法，未经修饰的最终副本。", "正确的符号可以节省空间并使法律或品牌文本看起来完整。", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["将后备表示法替换为 ©、® 和 ™。", "发布前检查法律和营销文案。", "使这些符号周围的间距保持一致。"])
        ])
    )

    static let japanesePack = makePack(
        ui: uiMap("""
app.tab.crime_lab|犯罪研究所
app.tab.case_files|事件ファイル
app.tab.learn|学ぶ
app.tab.settings|設定
counts.crimes_categories|犯罪: %@ · カテゴリ: %@
counts.detected_issues|検出された問題: %@
counts.entries|エントリ: %@
counts.characters|文字: %@
counts.line_column|行 %@ · 列 %@
counts.crimes_verdict|犯罪: %@ · %@
share.offense_line|• %@: %@
general.done|完了
general.cancel|キャンセル
general.retry|再試行
general.next|次へ
general.skip|スキップ
general.got_it|わかりました
general.coming_soon|近日公開
general.wrong|間違っています
general.right|右
history.empty_title|まだケースはありません
history.empty_subtitle|スキャンを実行すると、ケースファイルがここに表示されます。
history.share|共有
history.delete|削除
history.title|事件簿
history.today|今日
history.yesterday|昨日
history.this_week|今週
history.this_month|今月
history.select_all|すべて選択
history.delete_selected|選択したものを削除
learn.title|法律図書館
learn.search_prompt|犯罪の種類を検索
learn.empty_title|一致する犯罪は見つかりませんでした
learn.empty_subtitle|別の検索語を試してください。
learn.what_is_this|この問題は何ですか?
learn.why_it_matters|それが重要な理由
learn.history_origin|歴史と背景
learn.how_to_fix|修正方法
learn.default_why|優れたタイポグラフィは、考え抜かれた細部のシステムです。
learn.default_fix|正しい文字を使用し、文書の一貫性を保ちます。
input.method|入力方法
input.method.paste|貼り付け/入力
input.method.camera|カメラ (OCR)
input.placeholder|ここにテキストを貼り付けるか入力します…
input.paste_from_clipboard|クリップボードから貼り付け
input.title|証拠を提出
input.analyze|分析
input.analyze_evidence|証拠を分析する
input.camera_message|カメラベースのテキスト認識は、将来のアップデートで追加される予定です。ここでは、分析するテキストを貼り付けるか入力します。
input.trimmed_warning|テキストは 100,000 文字にトリミングされました。
input.clipboard_empty|クリップボードが空です。まずテキストをコピーします。
input.no_text|分析するテキストがありません。最初にテキストを貼り付けるか入力します。
home.new_investigation|新たな調査
home.new_investigation_subtitle|テキストを貼り付けるか入力して、フォレンジック タイポグラフィ分析を開始します
home.new_investigation_badge|貼り付け、入力、分析
home.recent_cases|最近のケース
home.see_all|すべてを見る→
home.empty_title|まだケースはありません
home.empty_subtitle|最初の調査を開始します。
home.begin_investigation|調査を開始
home.stat.scans|スキャン
home.stat.crimes|犯罪
home.stat.avg|平均
onboarding.splash_tagline|すべてのグリフは証拠です。
onboarding.page1.title|貼り付けます。分析する。見直してください。
onboarding.page1.body|任意のテキストをドロップすると、アプリは目に見えないところに隠れている印刷上の問題にフラグを立てます。
onboarding.page2.title|スペルチェックで見逃した部分を見つけます
onboarding.page2.body|直線引用符、偽の省略記号、全角ダッシュのふりをしたハイフン、一貫性のないスペースはすべてここに表示されます。
onboarding.page3.title|犯罪スコアを取得する
onboarding.page3.body|タイポグラフィがどの程度きれいであるかを確認し、評価を共有します。
onboarding.page4.title|やりながら学習
onboarding.page4.body|問題を開いて、問題が重要である理由とその解決方法を確認してください。
onboarding.start|調査を開始
onboarding.sample.not_em_dash|全角ダッシュではありません
onboarding.library.investigate|調査する
onboarding.library.study|ルールを勉強してください
analysis.failed_title|分析に失敗しました
analysis.failed_body|スキャン中に問題が発生しました。もう一度お試しください。
analysis.status.scan|活版印刷の証拠をスキャンしています…
analysis.status.quotes|引用符をチェックしています…
analysis.status.dashes|ダッシュの使用状況を確認しています…
analysis.status.ellipsis|楕円をチェック中…
analysis.status.spacing|間隔の一貫性をチェックしています…
analysis.status.layout|未亡人や孤児を調べています…
analysis.status.comic_sans|フォントのメタデータをチェックしています…
analysis.status.compiling|レポートを編集中…
mugshot.title|誤植のフラグが立てられました
mugshot.body|Comic Sans が提出された証拠の中に見つかりました。遊び心のある文脈では機能する可能性がありますが、ほとんどの製品や編集の設定では不一致とみなされます。
mugshot.continue|完全なレポートを開く →
report.breakdown|犯罪の内訳
report.share|レポートを共有
report.new_scan|新しいスキャン
report.close|レポートを閉じる
report.copy_fixed|固定テキストをコピー
report.copy_fixed_hint|現在修正されているテキストをコピーします。
report.clean_title|真っ白
report.clean_body|印刷上の問題は検出されませんでした。このテキストは模範的な市民です。
report.replace_single_space|単一のスペースに置き換えます
report.fixed_text_copied|固定テキストをコピーしました ✓
report.manual_rewrite|この問題は手動で書き直す必要があります。
report.apply_failed|この修正を適用できませんでした。
report.issue_fixed|問題が修正され、レポートが更新されました ✓
report.learn_more|この問題について詳しくはこちら →
settings.detection_rules|検出ルール
settings.scoring|スコア
settings.strictness|採点の厳格さ
settings.dash_style|エムダッシュスタイル
settings.appearance|外観
settings.theme|テーマ
settings.haptics|触覚フィードバック
settings.sounds|効果音
settings.data|データ
settings.clear_all|事件ファイルをすべてクリアする
settings.export_all|すべてのレポートをエクスポート
settings.about|概要
settings.version|バージョン
settings.typpo|Typpo
settings.rate_app|App Store のレート
settings.send_feedback|フィードバックを送信
settings.privacy|プライバシー ポリシー
settings.footer|慎重に作成され、適切な引用符が付けられています。
settings.title|設定
settings.clear_confirm_title|事件ファイルをすべてクリアしますか?
settings.clear_confirm_message|この操作は元に戻すことができません。
settings.delete_all|すべて削除
settings.about_body|テキストのフォレンジック分析。任意のテキストを貼り付け、スコアを取得し、判定を共有します。
settings.about_placeholder|このビルドは完全にオフラインですが、Web サイト、プライバシー ポリシー、App Store の宛先にプレースホルダー リリース リンクを引き続き使用します。
settings.about_website|ウェブサイト: %@
share.title|レポートを共有
share.copy_report_image|レポート画像をコピー
share.save_to_photos|写真に保存
share.copy_report_text|レポートテキストをコピー
share.photos_needed|写真へのアクセスが必要です
share.open_settings|設定を開く
share.photos_message|レポート画像を保存するには、写真へのアクセスが必要です。 [設定] を開いてアクセスを許可します。
share.primary.share_text|テキストを共有
share.primary.copy_link|リンクをコピー
share.primary.share|共有
share.copied_clipboard|クリップボードにコピーされました ✓
share.deep_link_copied|ディープリンクがコピーされました ✓
share.render_failed|レポート画像をレンダリングできませんでした。
share.saved_photos|写真に保存 ✓
share.save_failed|レポート画像を保存できませんでした。
share.swipe_up|アプリを開いて自分のテキストを分析してください
share.report_heading|タイポグラフィ レポート
share.score_prefix|スコア
share.top_issues|主な問題
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|テキストには空白のみが含まれています。犯罪ではありませんが、疑わしいです。
engine.non_latin_warning|分析はラテン文字のタイポグラフィに合わせて調整されています。一部のスペースと句読点の規則は、この書記体系には適用されない場合があります。
engine.short_text_note|寡婦と孤児の検出は、非常に短い継代では信頼性が低くなります。
engine.fix.single_space|文末の句読点の後にはスペースを 1 つ使用します。
engine.fix.replace_with|%@ に置き換えます
engine.fix.normalize_spacing|テキスト全体の文の間隔を正規化します。
engine.fix.rewrite_widow|最終行が 1 語にならないように、段落を書き直すかリフローします。
engine.fix.rewrite_orphan|小さな繰り越し線を避けるために近くのコピーを調整します。
engine.fix.change_font|より適切なフォントを使用してください。
engine.explain.double_space|この文は複数のスペースで終わります。これはタイプライター時代の慣例であり、プロポーショナル タイポグラフィには属しません。
engine.explain.straight_quotes|この引用符は、方向性のある中引用符ではなく、直線の ASCII 形式を使用しています。
engine.explain.hyphen_dash|この中断では、適切なダッシュの代わりにハイフンとマイナスの文字が使用されています。
engine.explain.fake_ellipsis|この一連のピリオドは省略記号文字に置き換える必要があります。
engine.explain.inconsistent_spacing|この文の間隔は、テキスト内の主要なパターンとは異なります。
engine.explain.widow|段落は最終行の単語で終わり、表示されるウィンドウが作成されます。
engine.explain.orphan|この段落は、前の長い段落の後の非常に短い行で始まり、孤立しているように見えます。
engine.explain.comic_sans|Comic Sans メタデータが送信されたリッチ テキスト内で見つかりました。
engine.explain.prime_marks|この測定マークでは、適切なプライム記号の代わりに ASCII 引用符が使用されています。
engine.explain.multiplication_sign|この次元では、乗算記号が表示される文字 x が使用されます。
engine.explain.trademark_symbol|この代替表記は適切な記号に置き換える必要があります。
category.punctuation|句読点の問題
category.spacing|間隔の問題
category.layout|レイアウトの問題
category.font|フォントの問題
category.symbol|シンボルの問題
severity.infraction|違反
severity.misdemeanor|軽罪
severity.felony|重罪
verdict.clean|クリーン
verdict.infraction|違反
verdict.misdemeanor|軽罪
verdict.felony|重罪
verdict.capital|重大犯罪
strictness.lenient|寛大
strictness.standard|標準
strictness.strict|厳格
theme.system|システム
theme.light|光
theme.dark|ダーク
dash.spaced|間隔をあけて
dash.closed|閉店
share_format.image|画像
share_format.story|ストーリー
share_format.landscape|風景
share_format.text|プレーンテキスト
share_format.link|リンクをコピー
share_format_desc.image|ソーシャル フィード用に最適化されたPNG 画像。
share_format_desc.story|1080×1920 のストーリー対応レポート。
share_format_desc.landscape|記事とソーシャル プレビュー用のワイド カード。
share_format_desc.text|書式設定されたテキストの概要。
share_format_desc.link|プレースホルダーのディープリンクのコピー。
evidence_source.typed|入力済み
evidence_source.pasted|貼り付けました
evidence_source.pasted_rich|貼り付けられたリッチ テキスト
toast.load_failed|保存された症例ファイルをロードできませんでした。
toast.save_failed|ケースファイルを保存できませんでした。
toast.delete_failed|削除に失敗しました。
toast.cleared|すべての事件ファイルが解決されました。
toast.clear_failed|事件ファイルをクリアできませんでした。
toast.export_failed|エクスポートに失敗しました。
"""),
        verdictShortLabels: verdictMap("""
clean|クリーン
infraction|違反
misdemeanor|軽罪
felony|重罪
capitalOffense|重大犯罪
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|句読点の問題
spacing|間隔の問題
layout|レイアウトの問題
font|フォントの問題
symbol|シンボルの問題
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|ダブルスペース
straightQuotes|ストレート引用符
hyphenAsDash|ハイフンをダッシュとして使用
fakeEllipsis|偽の省略記号
widow|未亡人
orphan|孤児たち
inconsistentSpacing|一貫性のない間隔
comicSans|Comic Sans
primeMarks|プライム マーク
multiplicationSign|乗算記号が間違っています
trademarkSymbol|商標シンボルの誤用
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|文末の句読点の後の余分なスペース。
straightQuotes|中引用符が属する場所には ASCII 引用符が使用されます。
hyphenAsDash|ハイフンは実際のダッシュの代わりになります。
fakeEllipsis|省略記号の代わりに 3 つのピリオドが使用されています。
widow|最後の行には短い単語が 1 つだけ残っています。
orphan|段落の先頭にある小さな繰り越し行。
inconsistentSpacing|1 つのテキスト内に文間のスタイルが混在しています。
comicSans|提出された証拠からComic Sansが検出されました。
primeMarks|ASCII 引用符は、プライム記号が属する場所で使用されます。
multiplicationSign|文字 x が × の代わりに使用されています。
trademarkSymbol|©、®、™ の代わりに使用される代替表記。
"""),
        articles: articleMap([
            (.doubleSpace, "文の後の二重スペースは、タイプライターの習慣から来ています。最新のプロポーショナル タイプでは、スペース 1 つが最もクリーンなデフォルトです。", "余分なスペースがあると、段落内に不規則なリズムが生じ、目に見える隙間が生じます。", "タイプライターは固定幅文字を使用していたため、かつては余分なスペースが読者に文の区切りを認識させるのに役立ちました。", "The case is closed.  Move on.", "The case is closed. Move on.", ["句読点の後に繰り返されるスペースを検索します。", "共有する前に簡単なクリーンアップ パスを実行します。", "ダブルスペースが意図的に使用されている場合は、一貫性を保ってください。"]),
            (.straightQuotes, "直線引用符は単純な ASCII マークです。完成したテキストは通常、方向性のある中引用符を使用すると読みやすくなります。", "波状の引用符はより洗練されて見え、文の視覚的なリズムが向上します。", "初期のキーボードと文字セットでは、両方向に対して 1 つの単純な引用符のみが保持されていました。", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["利用可能な場合はスマート句読点をオンにします。", "プレーンテキスト ソースから貼り付けられたテキストをクリーンアップします。", "プライムマークが正確であるように測定値を確認してください。"]),
            (.hyphenAsDash, "ハイフンは単語を結合しますが、全角ダッシュや半角ダッシュの代わりにはなりません。", "ダッシュを正しくすると、トーン、間隔、読みやすさが向上します。", "二重ハイフンは、豊かな句読点を簡単に生成できないシステムでの回避策でした。", "He paused -- dramatically.", "He paused — dramatically.", ["スタイルに必要な実際のダッシュ文字を使用してください。", "複合語にはハイフンを使用し、文の区切りは使用しないでください。", "文書全体で一貫性を保ちます。"]),
            (.fakeEllipsis, "3 つのピリオドは省略記号を模倣できますが、同じ文字ではありません。", "実際の省略記号はスペースのバランスが取れており、テキスト行内でより適切に動作します。", "多くのカジュアルなライティング ワークフローでは、依然としてデフォルトで 3 つのピリオドを入力します。", "Wait...", "Wait…", ["3 つのピリオドを省略記号文字に置き換えます。", "頻繁に入力する場合は、テキスト置換を使用します。", "公開する前にインポートされたコピーを確認してください。"]),
            (.widow, "未亡人が段落の最後の行に短い単語を 1 つ残しておきます。", "その弱い語尾は段落の形とリズムを乱します。", "編集者とデザイナーは、印刷物での未亡人を避けるために長い間改行を調整してきました。", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["文を少し締めるか書き直します。", "レイアウト ツールが利用可能な場合は、行の長さを調整します。", "これはソフトなスタイルの推奨事項として扱ってください。"]),
            (.orphan, "オーファンとは、新しい段落やテキスト ブロックを不自然に開始する小さな繰り越し行のことです。", "読書の流れが崩れ、レイアウトがあまり考慮されていないように感じられます。", "編集ワークフローでは、伝統的に出版前に孤児を修正します。", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["近くのフレーズを書き直して、休憩のバランスを再調整します。", "レイアウトを制御する場合は、メジャーを少し開きます。", "厳密なエラーではなく、警告として使用してください。"]),
            (.inconsistentSpacing, "単一文と二重文の間隔を混在させると、テキストがさまざまなソースからつなぎ合わされたように感じられます。", "読者は、理由を説明できない場合でも、矛盾にすぐに気づきます。", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["文間のスタイルを 1 つ選択します。", "貼り付けたテキストを共有する前に正規化します。", "最初から最後まで一貫した選択をしてください。"]),
            (.comicSans, "Comic Sans は禁止されていませんが、深刻なコピーと衝突することが多い強い文化的色合いを持っています。", "フォントは、読者が単語を処理する前に雰囲気を伝えます。", "Comic Sans は 1994 年に子供向けソフトウェア インターフェース向けに設計され、その後、その文脈をはるかに超えて広がりました。", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["メッセージに合った書体を選択してください。", "明らかに遊び心のある作業のために、遊び心のある表示面を予約してください。", "選択が意図的である場合は、この検出器を無効にします。"]),
            (.primeMarks, "フィート、インチ、分、秒などの単位には、多くの場合、引用符ではなくプライム記号が必要です。", "正しいマークは曖昧さを防ぎ、技術的な文章をより慎重に見せます。", nil, "5'11\"", "5′11″", ["数字の後にはプライム記号とダブルプライム記号を使用します。", "スマート クオートの自動変換に注意してください。", "仕様、メニュー、製品の寸法を注意深く確認してください。"]),
            (.multiplicationSign, "文字 x と乗算記号は、次元において互換性がありません。", "×を使用すると、技術コピーや製品コピーがよりきれいな活字に仕上がります。", nil, "1920x1080", "1920×1080", ["数値間の x を × に置き換えます。", "一般的なサイズ形式にはテキスト置換を使用します。", "仕様とマーケティング資産の一貫性を確認します。"]),
            (.trademarkSymbol, "(c)、(r)、(tm) などの形式は代替表記であり、洗練された最終コピーではありません。", "適切な記号はスペースを節約し、法的テキストやブランド テキストを完成度の高いものに見せます。", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["フォールバック表記を ©、®、™ に置き換えます。", "リリース前に法的コピーとマーケティングコピーを確認してください。", "これらの記号の周囲の間隔を一定に保ちます。"])
        ])
    )

    static let koreanPack = makePack(
        ui: uiMap("""
app.tab.crime_lab|범죄수사대
app.tab.case_files|사례 파일
app.tab.learn|배우기
app.tab.settings|설정
counts.crimes_categories|범죄: %@ · 카테고리: %@
counts.detected_issues|감지된 문제: %@
counts.entries|항목: %@
counts.characters|문자: %@
counts.line_column|라인 %@ · 열 %@
counts.crimes_verdict|범죄: %@ · %@
share.offense_line|• %@: %@
general.done|완료
general.cancel|취소
general.retry|다시 시도
general.next|다음
general.skip|건너뛰기
general.got_it|알겠습니다
general.coming_soon|출시 예정
general.wrong|틀림
general.right|그렇습니다
history.empty_title|아직 사례가 없습니다
history.empty_subtitle|스캔을 실행하면 케이스 파일이 여기에 표시됩니다.
history.share|공유
history.delete|삭제
history.title|사례 파일
history.today|오늘
history.yesterday|어제
history.this_week|이번 주
history.this_month|이번 달
history.select_all|모두 선택
history.delete_selected|선택 항목 삭제
learn.title|법률도서관
learn.search_prompt|범죄 유형 검색
learn.empty_title|일치하는 범죄가 없습니다
learn.empty_subtitle|다른 검색어를 사용해 보세요.
learn.what_is_this|이 문제는 무엇인가요?
learn.why_it_matters|왜 중요한가
learn.history_origin|역사와 맥락
learn.how_to_fix|수정 방법
learn.default_why|좋은 타이포그래피는 사려 깊은 디테일의 시스템입니다.
learn.default_fix|올바른 문자를 사용하고 문서의 일관성을 유지하세요.
input.method|입력 방법
input.method.paste|붙여넣기/입력
input.method.camera|카메라(OCR)
input.placeholder|여기에 텍스트를 붙여넣거나 입력하세요...
input.paste_from_clipboard|클립보드에서 붙여넣기
input.title|증거 제출
input.analyze|분석
input.analyze_evidence|증거 분석
input.camera_message|향후 업데이트에서 카메라 기반 텍스트 인식 기능이 제공될 예정입니다. 지금은 분석할 텍스트를 붙여넣거나 입력하세요.
input.trimmed_warning|텍스트가 100,000자로 잘렸습니다.
input.clipboard_empty|클립보드가 비어 있습니다. 먼저 일부 텍스트를 복사하세요.
input.no_text|분석할 텍스트가 없습니다. 먼저 텍스트를 붙여넣거나 입력하세요.
home.new_investigation|새로운 조사
home.new_investigation_subtitle|포렌식 타이포그래피 분석을 시작하려면 텍스트를 붙여넣거나 입력하세요.
home.new_investigation_badge|붙여넣기 · 유형 · 분석
home.recent_cases|최근 사례
home.see_all|모두 보기 →
home.empty_title|아직 사례가 없습니다
home.empty_subtitle|첫 번째 조사를 시작하세요.
home.begin_investigation|조사 시작
home.stat.scans|스캔
home.stat.crimes|범죄
home.stat.avg|평균
onboarding.splash_tagline|모든 글리프는 증거입니다.
onboarding.page1.title|붙여넣기. 분석하다. 검토하세요.
onboarding.page1.body|텍스트를 입력하면 앱이 눈에 잘 띄지 않는 인쇄상의 문제를 표시합니다.
onboarding.page2.title|맞춤법 검사에서 놓친 부분을 찾아냅니다
onboarding.page2.body|곧은 따옴표, 가짜 타원, 엠 대시인 것처럼 보이는 하이픈, 일관성 없는 간격이 모두 여기에 표시됩니다.
onboarding.page3.title|범죄 점수 받기
onboarding.page3.body|글꼴이 얼마나 깨끗한지 확인한 후 평가를 공유하세요.
onboarding.page4.title|학습하면서 배우기
onboarding.page4.body|문제를 열어 문제가 중요한 이유와 해결 방법을 알아보세요.
onboarding.start|조사 시작
onboarding.sample.not_em_dash|엠 대시가 아님
onboarding.library.investigate|조사
onboarding.library.study|규칙을 연구하세요
analysis.failed_title|분석 실패
analysis.failed_body|검사 중에 문제가 발생했습니다. 다시 시도해 주세요.
analysis.status.scan|인쇄상의 증거를 검색하는 중…
analysis.status.quotes|따옴표 확인 중...
analysis.status.dashes|대시 사용량 확인 중…
analysis.status.ellipsis|타원 확인 중...
analysis.status.spacing|간격 일관성을 확인하는 중...
analysis.status.layout|과부와 고아 확인…
analysis.status.comic_sans|글꼴 메타데이터 확인 중...
analysis.status.compiling|보고서 작성 중…
mugshot.title|인쇄상의 부정행위로 신고됨
mugshot.body|제출된 증거에서 Comic Sans이(가) 발견되었습니다. 재미있는 상황에서는 작동할 수 있지만 대부분의 제품 및 편집 설정에서는 불일치로 읽힙니다.
mugshot.continue|전체 보고서 열기 →
report.breakdown|범죄 분석
report.share|보고서 공유
report.new_scan|새 스캔
report.close|보고서 닫기
report.copy_fixed|고정 텍스트 복사
report.copy_fixed_hint|현재 수정된 텍스트를 복사합니다.
report.clean_title|점점 없음
report.clean_body|인쇄상의 문제가 발견되지 않았습니다. 이 글은 모범시민입니다.
report.replace_single_space|단일 공백으로 바꾸기
report.fixed_text_copied|고정 텍스트 복사됨 ✓
report.manual_rewrite|이 문제는 수동으로 다시 작성해야 합니다.
report.apply_failed|이 수정사항을 적용할 수 없습니다.
report.issue_fixed|문제가 해결되고 보고서가 업데이트되었습니다 ✓
report.learn_more|이 문제에 대해 자세히 알아보기 →
settings.detection_rules|탐지 규칙
settings.scoring|점수
settings.strictness|점수 엄격성
settings.dash_style|엠 대시 스타일
settings.appearance|외관
settings.theme|테마
settings.haptics|햅틱 피드백
settings.sounds|음향 효과
settings.data|데이터
settings.clear_all|모든 사건 파일 지우기
settings.export_all|모든 보고서 내보내기
settings.about|정보
settings.version|버전
settings.typpo|Typpo
settings.rate_app|App Store의 가격
settings.send_feedback|의견 보내기
settings.privacy|개인정보 보호정책
settings.footer|주의 깊게 작성되었으며 적절한 둥근 따옴표를 사용했습니다.
settings.title|설정
settings.clear_confirm_title|모든 사례 파일을 삭제하시겠습니까?
settings.clear_confirm_message|이 작업은 취소할 수 없습니다.
settings.delete_all|모두 삭제
settings.about_body|텍스트에 대한 법의학 분석. 텍스트를 붙여넣고 점수를 얻은 후 결과를 공유하세요.
settings.about_placeholder|이 빌드는 완전히 오프라인이며 여전히 웹사이트, 개인정보 보호정책 및 App Store 대상에 대한 자리 표시자 릴리스 링크를 사용합니다.
settings.about_website|웹사이트: %@
share.title|보고서 공유
share.copy_report_image|보고서 이미지 복사
share.save_to_photos|사진에 저장
share.copy_report_text|보고서 텍스트 복사
share.photos_needed|사진 액세스 필요
share.open_settings|설정 열기
share.photos_message|신고 이미지를 저장하려면 사진 접근 권한이 필요합니다. 설정을 열어 액세스 권한을 부여하세요.
share.primary.share_text|텍스트 공유
share.primary.copy_link|링크 복사
share.primary.share|공유
share.copied_clipboard|클립보드에 복사됨 ✓
share.deep_link_copied|딥링크 복사됨 ✓
share.render_failed|보고서 이미지를 렌더링할 수 없습니다.
share.saved_photos|사진에 저장됨 ✓
share.save_failed|보고서 이미지를 저장할 수 없습니다.
share.swipe_up|앱을 열어 자신의 텍스트를 분석하세요
share.report_heading|타이포그래피 보고서
share.score_prefix|점수
share.top_issues|주요 문제
brand.wordmark|TYPO CRIMES
brand.scene_tape|TYPO CRIME SCENE
brand.scene_tape_full|TYPO CRIME SCENE — DO NOT CROSS
onboarding.demo_sentence|He said "Hello"... and left -- quickly.
engine.whitespace_only|텍스트에 공백만 포함되어 있습니다. 범죄는 아니지만 의심스럽습니다.
engine.non_latin_warning|라틴 문자 입력 체계에 맞게 분석이 조정되었습니다. 일부 공백 및 구두점 규칙은 이 쓰기 시스템에 적용되지 않을 수 있습니다.
engine.short_text_note|과부 및 고아 감지는 매우 짧은 구절에서 신뢰성이 떨어집니다.
engine.fix.single_space|문장 끝 구두점 뒤에 공백 한 개를 사용하세요.
engine.fix.replace_with|%@로 바꾸기
engine.fix.normalize_spacing|텍스트 전체에서 문장 간격을 표준화합니다.
engine.fix.rewrite_widow|한 단어로 된 마지막 줄을 피하기 위해 단락을 다시 쓰거나 리플로우하세요.
engine.fix.rewrite_orphan|가까운 사본을 조정하여 작은 이월선을 방지하세요.
engine.fix.change_font|더 적합한 글꼴을 사용하세요.
engine.explain.double_space|이 문장은 비례 타이포그래피에 속하지 않는 타자기 시대의 관례인 다중 공백으로 끝납니다.
engine.explain.straight_quotes|이 따옴표는 방향성 중괄호 대신 곧은 ASCII 형식을 사용합니다.
engine.explain.hyphen_dash|이 중단에서는 적절한 대시 대신 하이픈 빼기 문자를 사용합니다.
engine.explain.fake_ellipsis|이 마침표는 줄임표 문자로 대체되어야 합니다.
engine.explain.inconsistent_spacing|이 문장 간격은 텍스트의 주요 패턴과 다릅니다.
engine.explain.widow|문단은 분리된 마지막 줄 단어로 끝나서 보이는 과부를 만듭니다.
engine.explain.orphan|이 단락은 긴 이전 단락 다음에 매우 짧은 줄로 시작하는데, 이는 고아로 읽힐 가능성이 높습니다.
engine.explain.comic_sans|Comic Sans 메타데이터가 제출된 서식 있는 텍스트에서 발견되었습니다.
engine.explain.prime_marks|이 측정 표시는 적절한 소수 기호 대신 ASCII 따옴표를 사용합니다.
engine.explain.multiplication_sign|이 차원은 곱셈 기호가 표시되어야 하는 문자 x를 사용합니다.
engine.explain.trademark_symbol|이 대체 표기법은 적절한 기호로 대체되어야 합니다.
category.punctuation|구두점 문제
category.spacing|간격 문제
category.layout|레이아웃 문제
category.font|글꼴 문제
category.symbol|기호 문제
severity.infraction|위반
severity.misdemeanor|경범죄
severity.felony|중범죄
verdict.clean|깨끗함
verdict.infraction|위반
verdict.misdemeanor|경범죄
verdict.felony|중범죄
verdict.capital|사망 공격
strictness.lenient|관대함
strictness.standard|표준
strictness.strict|엄격
theme.system|시스템
theme.light|빛
theme.dark|어두움
dash.spaced|간격
dash.closed|닫음
share_format.image|이미지
share_format.story|스토리
share_format.landscape|가로
share_format.text|일반 텍스트
share_format.link|링크 복사
share_format_desc.image|PNG 소셜 피드에 최적화된 이미지입니다.
share_format_desc.story|1080×1920 스토리가 준비된 보고서.
share_format_desc.landscape|기사 및 소셜 미리보기를 위한 넓은 카드
share_format_desc.text|형식화된 텍스트 요약
share_format_desc.link|자리 표시자 딥 링크 사본.
evidence_source.typed|입력됨
evidence_source.pasted|붙여넣었습니다
evidence_source.pasted_rich|서식 있는 텍스트를 붙여넣었습니다
toast.load_failed|저장된 사례 파일을 로드할 수 없습니다.
toast.save_failed|사례 파일을 저장할 수 없습니다.
toast.delete_failed|삭제에 실패했습니다.
toast.cleared|모든 사건 파일이 삭제되었습니다.
toast.clear_failed|사례 파일을 삭제할 수 없습니다.
toast.export_failed|내보내기에 실패했습니다.
"""),
        verdictShortLabels: verdictMap("""
clean|깨끗함
infraction|위반
misdemeanor|경범죄
felony|중범죄
capitalOffense|사망 공격
"""),
        crimeCategoryTitles: categoryMap("""
punctuation|구두점 문제
spacing|간격 문제
layout|레이아웃 문제
font|글꼴 문제
symbol|기호 문제
"""),
        crimeTypeTitles: crimeTypeMap("""
doubleSpace|더블 스페이스
straightQuotes|직선 따옴표
hyphenAsDash|대시로 사용되는 하이픈
fakeEllipsis|가짜 줄임표
widow|과부
orphan|고아
inconsistentSpacing|일관되지 않은 간격
comicSans|Comic Sans
primeMarks|소수점
multiplicationSign|잘못된 곱셈 기호
trademarkSymbol|상표 기호 오용
"""),
        crimeTypeDescriptions: crimeTypeMap("""
doubleSpace|문장 끝 구두점 뒤의 추가 공백
straightQuotes|ASCII 따옴표는 둥근 따옴표가 속한 곳에 사용됩니다.
hyphenAsDash|실제 대시를 나타내는 하이픈
fakeEllipsis|줄임표 문자 대신 마침표 3개가 사용되었습니다.
widow|짧은 단어 하나만 남은 마지막 줄
orphan|문단 시작 부분에 작은 줄이 이어집니다.
inconsistentSpacing|한 텍스트에 문장 간격 스타일이 혼합되어 있습니다.
comicSans|제출된 증거에서 Comic Sans이 감지되었습니다.
primeMarks|ASCII 따옴표는 소수 기호가 속한 곳에 사용됩니다.
multiplicationSign|× 대신 문자 x가 사용되었습니다.
trademarkSymbol|©, ®, ™ 대신 대체 표기법을 사용했습니다.
"""),
        articles: articleMap([
            (.doubleSpace, "문장 뒤의 공백은 타자기 습관에서 비롯됩니다. 현대 비례 유형에서는 공백 하나가 더 깔끔한 기본값입니다.", "추가 공백은 단락의 리듬을 고르지 않게 하고 눈에 띄는 간격을 만듭니다.", "타자기는 고정 너비 문자를 사용했기 때문에 공백을 추가하면 독자가 문장 나누기를 쉽게 볼 수 있었습니다.", "The case is closed.  Move on.", "The case is closed. Move on.", ["구두점 뒤에 반복되는 공백을 검색합니다.", "공유하기 전에 빠른 정리 과정을 실행하세요.", "의도적으로 공백을 두 번 사용한 경우 일관성을 유지하세요."]),
            (.straightQuotes, "곧은 따옴표는 일반 ASCII 표시입니다. 완성된 텍스트는 일반적으로 방향성 둥근 따옴표를 사용하면 읽기가 더 좋습니다.", "곱슬따옴표는 더욱 세련되어 보이고 문장의 시각적 리듬을 향상시킵니다.", "초기 키보드와 문자 집합은 양방향에 대해 하나의 간단한 따옴표만 유지했습니다.", "\"Hello\" and 'goodbye'", "“Hello” and ‘goodbye’", ["가능한 경우 스마트 구두점을 사용 설정하세요.", "일반 텍스트 소스에서 붙여넣은 텍스트를 정리합니다.", "소수점 표시가 올바르게 유지되도록 측정값을 확인하세요."]),
            (.hyphenAsDash, "하이픈은 단어를 연결하지만 엠 대시나 엔 대시를 대신할 수는 없습니다.", "올바른 대시는 어조, 간격, 가독성을 향상시킵니다.", "이중 하이픈은 풍부한 구두점을 쉽게 생성할 수 없는 시스템의 해결 방법이었습니다.", "He paused -- dramatically.", "He paused — dramatically.", ["스타일에 필요한 실제 대시 문자를 사용하세요.", "복합어에는 문장 나누기가 아닌 하이픈을 사용하세요.", "전체 문서에서 일관성을 유지하세요."]),
            (.fakeEllipsis, "3개의 마침표는 줄임표를 흉내낼 수 있지만 동일한 문자는 아닙니다.", "실제 줄임표는 균형 잡힌 간격을 가지며 텍스트 줄에서 더 잘 작동합니다.", "많은 일반 글쓰기 작업 흐름에서는 여전히 마침표 3개를 입력하는 것이 기본값입니다.", "Wait...", "Wait…", ["3개의 마침표를 줄임표 문자로 바꾸세요.", "자주 입력하는 경우 텍스트 바꾸기를 사용하세요.", "게시하기 전에 가져온 사본을 확인하세요."]),
            (.widow, "과부는 문단의 마지막 줄에 짧은 단어 하나를 남겨 두었습니다.", "약한 결말은 문단의 모양과 리듬을 방해합니다.", "편집자와 디자이너는 인쇄 시 공백을 피하기 위해 줄바꿈을 길게 조정했습니다.", "Typography is a matter of rhythm and\ncare.", "Typography is a matter of rhythm\nand care.", ["문장을 약간 좁히거나 다시 작성하세요.", "레이아웃 도구를 사용할 수 있는 경우 줄 길이를 조정하세요.", "이를 부드러운 스타일 권장사항으로 간주하세요."]),
            (.orphan, "고아는 새 단락이나 텍스트 블록을 어색하게 시작하는 작은 이월 줄입니다.", "읽기 흐름을 방해하고 레이아웃을 덜 고려하게 만듭니다.", "편집 작업 흐름에서는 일반적으로 출판 전에 고아를 수정합니다.", "A long paragraph ends and the next block begins with\na.", "A long paragraph ends and the next block begins with a fuller line.", ["휴식의 균형을 다시 맞추기 위해 가까운 문구를 다시 작성하세요.", "레이아웃을 제어하는 경우 측정값을 살짝 엽니다.", "엄격한 오류가 아닌 경고로 사용하세요."]),
            (.inconsistentSpacing, "단문과 이중 문장 간격을 혼합하면 텍스트가 다양한 소스에서 하나로 연결되는 느낌을 받을 수 있습니다.", "독자는 이유를 설명할 수 없는 경우에도 불일치를 빠르게 알아차립니다.", nil, "First sentence. Second sentence.  Third sentence.", "First sentence. Second sentence. Third sentence.", ["한 가지 문장 간격 스타일을 선택하세요.", "공유하기 전에 붙여넣은 텍스트를 표준화하세요.", "처음부터 끝까지 선택의 일관성을 유지하세요."]),
            (.comicSans, "Comic Sans은 금지되지 않지만 종종 진지한 카피와 충돌하는 강한 문화적 분위기를 담고 있습니다.", "글꼴은 독자가 단어를 이해하기도 전에 분위기를 전달합니다.", "Comic Sans는 1994년 어린이용 소프트웨어 인터페이스용으로 설계되었으며 나중에 그 맥락을 훨씬 뛰어넘어 확산되었습니다.", "Comic Sans everywhere", "Use a font suited to the document’s tone.", ["메시지에 맞는 서체를 선택하세요.", "명확하게 재미있는 작업을 위해 재미있는 디스플레이 화면을 예약하세요.", "의도적으로 선택한 경우 이 감지기를 비활성화합니다."]),
            (.primeMarks, "피트, 인치, 분, 초와 같은 측정값에는 따옴표 대신 프라임 기호가 필요한 경우가 많습니다.", "올바른 표시는 모호함을 방지하고 기술 텍스트를 더욱 의도적으로 보이게 만듭니다.", nil, "5'11\"", "5′11″", ["숫자 뒤에 소수 및 이중 소수 기호를 사용하세요.", "자동 스마트 인용 변환을 확인하세요.", "사양, 메뉴, 제품 크기를 주의 깊게 확인하세요."]),
            (.multiplicationSign, "문자 x와 곱셈 기호는 크기 면에서 서로 바꿔 사용할 수 없습니다.", "×를 사용하면 기술 및 제품 카피의 인쇄 마감이 더욱 깔끔해집니다.", nil, "1920x1080", "1920×1080", ["숫자 사이의 x를 ×로 바꿉니다.", "일반적인 크기 형식에 텍스트 대체를 사용하세요.", "사양과 마케팅 자산의 일관성을 검토하세요."]),
            (.trademarkSymbol, "(c), (r), (tm)과 같은 형식은 다듬어진 최종 사본이 아닌 대체 표기법입니다.", "적절한 기호는 공간을 절약하고 법률 또는 브랜드 텍스트를 완성된 것처럼 보이게 합니다.", nil, "(c) 2026 Brand Name (tm)", "© 2026 Brand Name ™", ["대체 표기법을 ©, ® 및 ™으로 바꿉니다.", "출시 전 법률 및 마케팅 카피를 확인하세요.", "해당 기호 주위의 간격을 일관되게 유지하세요."])
        ])
    )
}
