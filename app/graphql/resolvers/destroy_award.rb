class Resolvers::DestroyAward < GraphQL::Function
  argument :id, !types.ID

  type types.Boolean

  def call(_ctx, args, obj)
    award = Award.find_by_id(args[:id])

    if !award
      GraphQL::ExecutionError.new("Award does not exist")
    else
      true
    end
  end
end
