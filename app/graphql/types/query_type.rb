module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_events, [EventType], null: false,
      description: "Get all events from the database"
    field :me, [UserType], null: true,
      description: "Get information on the logged in user"
    def all_events
      Event.all
    end

    def me
      if context[:current_user].nil?
        return GraphQL::ExecutionError.new("You are not logged in")
      end
      context[:current_user]
    end
  end
end
