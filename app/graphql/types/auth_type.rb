module Types
  class AuthType < BaseObject
    field :user, Types::UserType, null: false
    field :token, String, null: false
  end
end
