require "active_support/core_ext/integer/time"

Rails.application.configure do

  # ====== キャッシング======
  # 起動時に1度のみクラスの読み込み。以後はキャッシュを使用
  config.cache_classes = true

  # 起動時にメモリにクラスとモジュールを読み込み
  config.eager_load = true

  # ActionControllerのキャッシュを有効に。レスポンスにキャッシュが使える
  config.action_controller.perform_caching = true

  # アクションメーラーのキャッシング機能は無効に
  config.action_mailer.perform_caching = false



  # ====== エラー表示、ログ ======
  # 詳細エラーは表示しない
  config.consider_all_requests_local = false

  # ログレベルをinfoに指定
  config.log_level = :info

  # デフォルトのログフォーマットを使用
  config.log_formatter = ::Logger::Formatter.new

  # ログにリクエスト毎のIDタグを付与
  config.log_tags = [ :request_id ]

  # この環境変数が定義されていれば、ログを標準出力に指定の形で表示
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end



  # ====== ActiveStrage ======
  # ActiveStrage経由でアップロードされたファイルをローカルに保存(localの詳細はstorage.ymlに定義)
  config.active_storage.service = :local



  # ====== コンパイル ======
  # ライブコンパイルは行わない(事前にコンパイルしたものを表示させる)
  config.assets.compile = false



  # ====== i18n ======
  # 翻訳がうまく見つからない場合はデフォルトロケールで翻訳
  config.i18n.fallbacks = true



  # ====== その他 ======
  # /publicフォルダ配下にある制定ファイルのサービングを行うかどうか
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Railsの非推奨警告を表示させない
  config.active_support.report_deprecations = false

  # マイグレーションが実行されてもschemaは更新しない
  config.active_record.dump_schema_after_migration = false
end

