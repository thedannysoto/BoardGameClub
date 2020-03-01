ENV['SINATRA_ENV'] ||= "development"
ENV['SESSION_SECRET'] ||= "fba37fdd49498b9e817ba8d6c146ef4b8b7e6da46f2cb5de516997206ba492308ed9ace98a9d23ddc051337439e3ea6ef6d10dfa218550b870d38793cfad56cd"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

def fi_check_migration
  begin
    ActiveRecord::Migration.check_pending!
  rescue ActiveRecord::PendingMigrationError
    raise ActiveRecord::PendingMigrationError.new <<-EX_MSG
Migrations are pending. To resolve this issue, run:
      rake db:migrate SINATRA_ENV=test
EX_MSG
  end
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)


require './app/controllers/application_controller'
require_all 'app'
