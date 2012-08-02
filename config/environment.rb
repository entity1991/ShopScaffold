# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShopScaffold::Application.initialize!

ShopScaffold::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "domain.of.sender.net",
      authentication: "plain",
      user_name: "ruslankuzma@gmail.com",
      password: "1991732kuzma",
      enable_starttls_auto: true
  }
end