module Types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :update_event, mutation: Mutations::UpdateEvent
    field :delete_event, mutation: Mutations::DeleteEvent
  end
end
