# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 465,
  domain: 'gmail.com',
  name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASS'],
  authentification: 'plain',
  :ssl => true,
  :tsl => true,
  ennable_starttls_auto: true
}