desc "Import ingredients."

task :import_ingredients => :environment do

    doc = File.open(Rails.root.to_s + '/tmp/ingredients.xml') { |f| Nokogiri::XML(f) }

	doc.css('ingredient').each do |ingredient|
  		children = ingredient.children

  		Ingredient.create(
  			code: children.css('code').inner_text,
  			name: children.css('name').inner_text,
  			price: children.css('price').inner_text.to_f,
  			unit: children.css('unit').inner_text
  		)
	end

end