module Mutations
  class ResetPassword < BaseMutation
    argument :email, String, required: true

    type Types::MessageType 

    def resolve(email: nil)
      user = User.find_by(email: email)
      GraphQL::ExecutionError.new('User not found') if user.nil?
      user.generate_password_reset_token!
      ResetPasswordMailer.password_reset(user).deliver
      { message: "Reset email sent successfully", status: "success" }
    end
  end
end
