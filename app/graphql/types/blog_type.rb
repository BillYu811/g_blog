module Types
  class BlogType < Types::BaseObject
    description 'A Blog'
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false
  end
end