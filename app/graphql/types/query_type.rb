module Types
  class QueryType < GraphQL::Schema::Object
    description "root query"

    field :blog, BlogType, null: true do
      description "find a blog"
      argument :id, ID, required: true
    end 

    field :user, UserType, null: false do
      description "find a user and blogs blong to ta"
      argument :id, ID, required: true
      
    end

    def blog(id:)
      Blog.find(id)
    end

    def user(id:)
      User.find(id)
    end

  end 
end
