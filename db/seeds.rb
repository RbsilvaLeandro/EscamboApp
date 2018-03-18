# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Cadastrando Categorias...'
Categories = ["Animais e Acessórios",
			  "Esportes",
			  "Para sua casa",
			  "Eletrônicos e celulares",
			  "Música e hobbies",
			  "Bebês e Crianças",
			  "Moda e Beleza",
			  "Veículos e barcos",
			  "Imóveis",
			  "Empregos e negócios"]

Categories.each do |category|
	Category.find_or_create_by!(description:category)
end
puts 'Categorias casdastradas com sucesso...'


########################################################

puts 'Cadastrando Administrador Padrão...'

Admin.create!(
	name: "Leandro Ribeiro", 
	email: "admin@admin.com", 
	password:"admin123", 
	password_confirmation:"admin123",
	role: 0)

Admin.create!(
	name: "Rodrigo Souza", 
	email: "rodrigo@admin.com", 
	password:"admin123", 
	password_confirmation:"admin123",
	role: 1)



puts 'Administrador cadastrado com sucesso'
