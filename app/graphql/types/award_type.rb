Types::AwardType = GraphQL::ObjectType.define do
  name 'Award'

  field :id, !types.ID
  field :student, !Types::StudentType
  field :competition, !types.String
  field :placement, !types.String
  field :date, !Types::DateType
end
