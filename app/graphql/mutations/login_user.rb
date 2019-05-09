module Mutations
  class LoginUser < BaseMutation
    argument :data, Types::AuthInput, required: true

    type Types::AuthType
    def resolve(data: nil)
      user = User.find_by(email: data&.email)
      return GraphQL::ExecutionError.new('Invalid user or Password') unless user
      isPassword = user.authenticate(data&.password)
      return GraphQL::ExecutionError.new('Invalid user or password') unless isPassword
      token = JsonWebToken.encode(userId: user.id)
      { user: user, token: token }
    end
  end
end
