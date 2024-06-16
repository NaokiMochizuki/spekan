UserItem.seed(:id,
  { id: 1, name: '名前', format: :text_input, is_default: true },
  { id: 2, name: '名前(フリガナ)', format: :text_input, is_default: true },
  { id: 3, name: '電話番号', format: :text_input, is_default: true },
  { id: 4, name: 'メールアドレス', format: :text_input, is_default: true },
  { id: 5, name: '生年月日', format: :date_select, is_default: true },
  { id: 6, name: '性別', format: :single_select, is_default: true },
  { id: 7, name: '住所', format: :text_input, is_default: true },
)