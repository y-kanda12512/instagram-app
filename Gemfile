source "https://rubygems.org"

# --- Core ---
gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "pg", "~> 1.6"
gem "puma", ">= 5.0"
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# --- Windows 環境向け ---
gem "tzinfo-data", platforms: %i[windows jruby]

# --- Frontend ---
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"

# --- View / API ---
gem "jbuilder"

# --- i18n / 認証 ---
gem "rails-i18n"
gem "devise"
gem "devise-i18n-views"

# --- 起動や本番運用の補助 ---
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# --- ファイルのコメント ---
# gem 'annotate'

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  # エラー画面
  gem "web-console"
  gem "better_errors"
  gem "binding_of_caller"
  gem "ruby-lsp"
  gem "syntax_tree"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "foreman"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
