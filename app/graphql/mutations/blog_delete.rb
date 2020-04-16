module Mutations
  class BlogDelete < BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true
    field :errors, [String], null: true
    field :msg, String, null: true


    def resolve(**inputs)
      return {errors: ['signin required']} unless context[:current_user]
      @blog = Blog.find inputs[:id]
      return {errors: ['blog not belong to current user']} unless @blog.user_id == context[:current_user].id

    end

  end
end
