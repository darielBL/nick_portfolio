# db/seeds.rb
# Crear usuario admin
admin = User.find_or_create_by(email: 'admin@nicknightin.com') do |user|
  user.password = 'admin1234'
  user.name = 'NICK NIGHTIN'
  user.title = 'character designer'
end
puts "✅ Usuario admin creado: admin@nicknightin.com / admin1234"

# Crear About - SIN IMAGE_URL
about = About.singleton
about.update!(
  description: 'Character designer with a passion for creating unique and memorable characters. I specialize in developing visual identities for animation, games, and illustrated stories.',
  email: 'nicknightin@gmail.com'
)
puts "✅ About Me configurado"

# Crear Social Links
SocialLink.seed_defaults
puts "✅ Redes sociales creadas"

# NO CREAR PORTFOLIO IMAGES AQUÍ - se crearán desde el dashboard con Active Storage
puts "✅ Las imágenes de portfolio y personal work se deben subir desde el dashboard"
puts ""
puts "🎨 ¡Portfolio Nick Nightin listo!"
puts "➡️  http://localhost:3000"
puts "➡️  Acceso admin: haz clic en el candado (admin@nicknightin.com / admin1234)"