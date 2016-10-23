def create_users
  first_names = %w(John Henry Alex Catherine)
  family_names = %w(Underwood Robinson Thompson Wright)

  first_names.each { |fi_name|
    family_names.reduce(fi_name) { |fname, fa_name|
      User.create(
          name: fname + ' ' + fa_name,
          email: fname.downcase + '_' + fa_name.downcase + '@gmail.com',
          password: '123123',
          avatar_url: Faker::Avatar.image
      )
      fname
    }
  }
end

def create_messages
  users = User.all
  users.each_with_index { |user, index|
    Message.create(
        subject: "From #{user.name} to #{users[(index + 1)%users.count].name} and #{users[(index + 9)%users.count].name} with love",
        content: Faker::Hipster.paragraph,
        sender: user,
        recipients: [users[(index + 1)%users.count], users[(index + 2)%users.count]]
    )
  }
end

create_users
create_messages
