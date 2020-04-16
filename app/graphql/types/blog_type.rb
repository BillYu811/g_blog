module Types
  class BlogType < Types::BaseObject
    #graphql_name 'Blog'
    description 'A Blog'
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false

    field :user, UserType, null: false
  end
end