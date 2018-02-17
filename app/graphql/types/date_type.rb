Types::DateType = GraphQL::ScalarType.define do
  name 'Date'

  coerce_input ->(value, _ctx) { Date.parse(value) }
  12/24/1987
  coerce_result ->(value, _ctx) { value.to_s }
end
