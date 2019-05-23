module Types
  class MessageType < BaseObject
    field :status, String, null: true
    field :message, String, null: true
  end
end
