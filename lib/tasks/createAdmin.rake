desc "Create admin."

task :create_admin => :environment do
    admin = Admin.new(email: 'admin@CookLah', password: 'IS1112ROCKS')
    admin.save
end