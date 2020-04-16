module Mutations
  class BlogPost < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true

    field :blog, Types::BlogType, null: true
    field :errors, [String], null: true


    def resolve(**inputs)
      return {errors: ['signin required']} unless context[:current_user]
      inputs[:user_id] = context[:current_user].id
      @blog = Blog.new(inputs)
      {blog:@blog} if @blog.save!
    end

  end
end
