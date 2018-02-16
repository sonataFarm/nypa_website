class Resolvers::CreateUser < GraphQL::Function
  argument :name, !Types::NameInput
  argument :login, !Types::LoginInput

  type Types::UserType

  def call(_obj, args, ctx)
    return unless ctx[:current_user]
    return unless args[:login] && args[:name]

    user = User.new(
      username: args[:login][:username],
      password: args[:login][:password],
      first_name: args[:name][:first],
      last_name: args[:name][:last]
    )

    if user.save
      user
    else
      GraphQL::ExecutionError.new(
        "Invalid entry: #{user.errors.full_messages.join(';')}"
      )
    end
  end
end
