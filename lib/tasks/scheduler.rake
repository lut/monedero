desc "This task is called by the Heroku scheduler add-on"
task :create_expired_credit_lines => :environment do
  puts "Creating expired credit lines..."
  Credit.create_expired_lines
  puts "done."
end