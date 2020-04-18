module Mutations
  class BlogDelete < BaseMutation
    argument :id, ID, required: true

    #field :id, ID, null: true
    field :errors, [String], null: true
    field :blog, Types::BlogType, null: true
    #field :title, String, null: true

    def resolve(**inputs)
      return {errors: ['signin required']} unless context[:current_user]
      @blog = Blog.find inputs[:id]
      return {errors: ['this blog is not belongs to current user.']} unless @blog.user_id == context[:current_user].id
      {blog: @blog} if @blog.destroy!
    end

  end
end
