# Load all concern files explicitly
# This ensures they are available when models try to include them

Rails.application.config.to_prepare do
  Dir[Rails.root.join('app', 'models', 'concerns', '*.rb')].each do |concern_file|
    load concern_file
  end
end
