# Create a Guest User and Admin User
[
    { name: 'Guest', email: 'nobody@example.com', password: SecureRandom.base64(25), admin: false },
    { name: 'Admin', email: 'admin@example.com',  password: 'PleaseChangeMe',        admin: true  }
].each do |record|
  next if User.where(email: record[:email]).first
  User.create(name: record[:name], email: record[:email], password: record[:password], admin: record[:admin])
end

# Make sure we have a Home project
Project.create(title: 'Home', summary: 'Welcome to My World', detail: nil, url: nil) unless Project.where(title: 'Home').first

