module Types
  class MutationType < Types::BaseObject
    field :userCreate, mutation: Mutations::UserCreate
    field :userSignIn, mutation: Mutations::UserSignIn
    # need context
    field :blogPost, mutation: Mutations::BlogPost
    #field :delete_blog, mutation: Mutations::DeleteBlogMutation
  end
end
