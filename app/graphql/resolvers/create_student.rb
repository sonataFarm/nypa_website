class Resolvers::CreateStudent < GraphQL::Function
  argument :name, !Types::NameInput
  argument :active, types.Boolean

  type Types::StudentType

  def call(_ctx, args, obj)
    Student.create!(
      first_name: args[:name][:first],
      last_name: args[:name][:last],
      active: args[:active] && true
    )

  rescue ActiveRecord::RecordInvalid
    nil
  end
end
