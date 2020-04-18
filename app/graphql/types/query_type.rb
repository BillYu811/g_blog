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

    field :all_blogs, [BlogType], null: false
    field :all_users, [UserType], null: false

    def blog(id:)
      Blog.find(id)
    end

    def user(id:)
      User.find(id)
    end

    def all_blogs()
      Blog.all.order('updated_at desc').limit(20)
    end
    def all_users()
      User.all
    end

  end
end
