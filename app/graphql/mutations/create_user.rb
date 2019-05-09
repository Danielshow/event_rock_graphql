module Mutations
  class CreateUser < BaseMutation
    argument :data, Types::AuthInput, required: true

    type Types::AuthType

    def resolve(data: nil)
      user = User.create!(
        email: data&.email,
        password: data&.password,
        name: data&.name
      )
      token = JsonWebToken.encode(userId: user.id)
      {user: user, token: token}
    end
  end
end
