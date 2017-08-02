Before do |scenario|
  Post.destroy_all unless $cat

  name = scenario.name
  if name.include?('Publicar') || name.include?('Atualizar')
    create_articles unless $cat
  end
end

After do
  $cat = true
end
