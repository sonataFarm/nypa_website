Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['NYPA_ADMIN_ROOT']
    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
end
