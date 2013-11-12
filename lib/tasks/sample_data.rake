namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "IainAdmin",
                         email: "iain.j.macdonald.12@aberdeen.ac.uk",
                         password: "Iain",
                         password_confirmation: "Iain",
                         admin: true)
  end
end
