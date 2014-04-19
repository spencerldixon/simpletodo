namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    user = User.create(email: "guest@example.com",
                        password: "guestuser")

    list = user.lists.create(name: "My first list")

    list.tasks.create(name: "Do something", completed: false)
    list.tasks.create(name: "Clean car", completed: false)
    list.tasks.create(name: "Get shopping", completed: false)
    list.tasks.create(name: "Write sample data", completed: true)
    list.tasks.create(name: "Build a rails app", completed: true)
    list.tasks.create(name: "Fix broken things", completed: false)

    puts "Sample data written to the database! Log in using 'guest@example.com' with the password 'guestuser'."
  end
end