namespace :clear_session do
    task :clear_expired_sessions => :environment do
        sql = 'DELETE FROM sessions;'
        ActiveRecord::Base.connection.execute(sql)
    end
end
