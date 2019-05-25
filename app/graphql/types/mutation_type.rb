module Types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :update_event, mutation: Mutations::UpdateEvent
    field :delete_event, mutation: Mutations::DeleteEvent
    field :reset_password, mutation: Mutations::ResetPassword
    field :update_password_reset, mutation: Mutations::UpdatePasswordReset
    field :register_for_event, mutation: Mutations::RegisterForEvent
    field :get_users_for_event, mutation: Mutations::GetUsersForEvent
  end
end
