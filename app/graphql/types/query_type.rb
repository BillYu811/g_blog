module Types
  class QueryType < GraphQL::Schema::Object
    description "root query"

    field :blog, BlogType , null: true do
      description "find a blog"
      argument :id, ID, required: true
    end 
    
    def blog(id:)
      Blog.find(id)
    end  

  end 
end
