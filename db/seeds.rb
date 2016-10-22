def create_users
  first_names = %w(John Henry Alex Catherine Frank Robert Pierre Emma Michelle Michael Justin Selena David)
  family_names = %w(Underwood Tan Ong Lim Robinson Thompson Wright Walker White Edwards Jones Moore Watson)

  first_names.each { |fi_name|
    family_names.reduce(fi_name) { |fname, fa_name|
      User.create(
          name: fname + ' ' + fa_name,
          email: fname.downcase + '.' + fa_name.downcase + '@gmail.com',
          password: '123123'
      )
      fname
    }
  }
end

def create_messages
  users = User.all
  users.each_with_index { |user, index|
    Message.create(
        subject: "From #{user.name} to #{users[(index + 1)%users.count].name} and #{users[(index + 2)%users.count].name} with love",
        content: 'Somewhere from the stars!',
        sender: user,
        recipients: [users[(index + 1)%users.count], users[(index + 2)%users.count]]
    )
  }
end

create_users
create_messages
