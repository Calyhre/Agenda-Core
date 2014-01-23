Apipie.configure do |config|
  config.app_name                 = "AgendaCore"
  config.api_base_url             = "/api/v1"
  config.doc_base_url             = "/doc"
  config.reload_controllers       = true
  config.api_controllers_matcher  = "#{Rails.root}/app/controllers/api/**/*.rb"
end
