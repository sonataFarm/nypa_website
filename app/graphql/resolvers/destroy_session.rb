class Resolvers::DestroySession < GraphQL::Function
  type Types::UserType

  def call(_obj, args, ctx)
    if ctx[:current_user]
      user = ctx[:current_user]
      user.reset_session_token!
      ctx[:session][:token] = nil

      user
    else
      # no one is logged in. TODO: error handling
    end
  end
end
