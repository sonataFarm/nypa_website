class Resolvers::CreateSession < GraphQL::Function
  argument :login, !Types::LoginInput

  type Types::UserType

  def call(_obj, args, ctx)
    login = args[:login]
    return unless login

    user = User.find_by_credentials(
      login[:username],
      login[:password]
    )

    return unless user

    ctx[:session][:token] = user.reset_session_token!
    user
  end
end
