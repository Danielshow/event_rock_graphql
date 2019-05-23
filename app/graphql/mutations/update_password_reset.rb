module Mutations
  class UpdatePasswordReset < BaseMutation
    argument :token, String, required: true
    argument :password, String, required: true

    type Types::MessageType

    def resolve(token: nil, password: nil)
      user = User.find_by(password_reset_token: token)
      return GraphQL::ExecutionError.new("Invalid or expired token") if user.nil?
      user.password = password
      user.password_reset_token = nil
      user.save!
      { message: "Password updated successfully", status: "success" }
    end
  end
end
