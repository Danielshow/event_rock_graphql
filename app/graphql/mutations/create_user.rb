module Mutations
  class CreateUser < BaseMutation
    argument :data, Types::AuthInput, required: true
    argument :name, String, required: true

    type Types::AuthType

    def resolve(data: nil, name: nil)
      user = User.create!(
        email: data&.email,
        password: data&.password,
        name: name
      )
      token = JsonWebToken.encode(userId: user.id)
      { user: user, token: token }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid Input #{e.record.errors.full_messages.join(',')}")
    end
  end
end
