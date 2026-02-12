require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Active Storage - LOCAL (sin AWS, sin volúmenes)
  config.active_storage.service = :local

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = false

  config.active_storage.queues.analysis = nil
  config.active_storage.queues.purge = nil

  config.log_level = :info
  config.log_tags = [ :request_id ]

  # ✅ CORREGIDO - Esta es la línea que daba error
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.report_deprecations = false

  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end