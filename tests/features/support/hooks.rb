Before do
  Post.destroy_all unless $cat
  create_articles unless $cat
end

After do
  $cat = true
end
