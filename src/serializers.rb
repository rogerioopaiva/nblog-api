# Serializers
class PostSerializer
  def initialize(post)
    @post = post
  end

  def as_json(*)
    data = {
      id: @post.id.to_s,
      title: @post.title,
      body: @post.body,
      created_date: @post.created_date
    }
    data[:errors] = @post.errors if @post.errors.any?
    data
  end
end
