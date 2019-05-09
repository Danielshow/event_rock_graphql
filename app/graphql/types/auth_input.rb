module Types
  class AuthInput < BaseInputObject
    graphql_name 'AuthInput'

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
