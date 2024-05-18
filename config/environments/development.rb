require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ====== キャッシング======
  # リクエスト毎にクラスをリロード
  config.cache_classes = false

  # リクエスト毎に必要なクラスやモジュールをメモリに呼び出し
  config.eager_load = false

  # rails dev:cacheコマンドでキャッシュの挙動を制御
  if Rails.root.join("tmp/caching-dev.txt").exist?
    # ActionControllerのキャッシュを有効に。レスポンスにキャッシュが使える
    config.action_controller.perform_caching = true
    # フラグメントキャッシュのログを有効に
    config.action_controller.enable_fragment_cache_logging = true
    # キャッシュストアにメモリストアを利用
    config.cache_store = :memory_store
    # 静的ファイルのキャッシュを2日間有効に
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    # アクションコントローラーのキャッシュを無効に
    config.action_controller.perform_caching = false
    # キャッシュされたデータを保持しない
    config.cache_store = :null_store
  end


  # ====== エラー表示、ログ ======
  # 開発用のエラーページを出すかどうか
  config.consider_all_requests_local = false

  # レスポンスにサーバタイミング(パフォーマンス情報)のメトリクスを含める
  config.server_timing = true



  # ====== 非推奨関連の取り扱い ======
  # Railsの非推奨警告をログに表示
  config.active_support.deprecation = :log

  # 非推奨コードを使用した場合にエラーを出力
  config.active_support.disallowed_deprecation = :raise

  # 非推奨警告の中で禁止リストに含めるものを定義(空配列の場合指定なし)
  config.active_support.disallowed_deprecation_warnings = []



  # ====== ActiveStorage ======
  # ActiveStrage経由でアップロードされたファイルをローカルに保存(localの詳細はstorage.ymlに定義)
  config.active_storage.service = :local



  # ====== ActionMailer ======
  # Action Mailerの設定
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :letter_opener_web
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: 'localhost:3000' }



  # ====== ActiveRecord ======
  # DBとスキーマが同期していない時にエラーを表示
  config.active_record.migration_error = :page_load

  # DBクエリに関する詳細な情報をログに表示
  config.active_record.verbose_query_logs = true



  # ====== アセット======
  # アセットパイプラインへのアクセスに関するログを出力
  config.assets.quiet = true

end
