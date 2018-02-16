class Resolvers::DestroySession < GraphQL::Function
  type Types::UserType

  def call(_obj, args, ctx)
    if ctx[:current_user]
      user = ctx[:current_user]
      user.reset_session_token!
      ctx[:session][:token] = nil

      user
    else
      GraphQL::ExecutionError.new(
        "Error: no one to log out"
      )
    end
  end
end
