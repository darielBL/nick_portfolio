# Crear usuario admin
admin = User.find_or_create_by(email: 'admin@nicknightin.com') do |user|
  user.password = 'admin1234'
  user.name = 'NICK NIGHTIN'
  user.title = 'character designer'
end
puts "✅ Usuario admin creado: admin@nicknightin.com / admin1234"

# Crear About
about = About.singleton
about.update!(
  description: 'Character designer with a passion for creating unique and memorable characters. I specialize in developing visual identities for animation, games, and illustrated stories.',
  image_url: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
  email: 'nicknightin@gmail.com'
)
puts "✅ About Me configurado"

# Crear Social Links
SocialLink.seed_defaults
puts "✅ Redes sociales creadas"

# Crear Portfolio inicial
portfolio_images = [
  {
    title: 'nick nightin',
    image_url: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 1
  },
  {
    title: 'nick nightin',
    image_url: 'https://images.unsplash.com/photo-1561214115-f2f134cc4912?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 2
  },
  {
    title: 'nick nightin',
    image_url: 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 3
  }
]

portfolio_images.each do |img|
  PortfolioImage.find_or_create_by(position: img[:position]) do |image|
    image.title = img[:title]
    image.image_url = img[:image_url]
    image.email = about.email
  end
end
puts "✅ Portfolio inicial creado (3 imágenes)"

# Crear Personal Work inicial
personal_works = [
  {
    title: 'nicks nightin',
    image_url: 'https://images.unsplash.com/photo-1513364776144-60967b0f800f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 1
  },
  {
    title: 'nick nightin',
    image_url: 'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 2
  },
  {
    title: 'nick nightin',
    image_url: 'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
    position: 3
  }
]

personal_works.each do |work|
  PersonalWork.find_or_create_by(position: work[:position]) do |w|
    w.title = work[:title]
    w.image_url = work[:image_url]
    w.email = about.email
  end
end
puts "✅ Personal Work inicial creado (3 imágenes)"

puts "🎨 ¡Portfolio Nick Nightin listo!"
puts "➡️  http://localhost:3000"
puts "➡️  http://localhost:3000/login (admin@nicknightin.com / admin1234)"