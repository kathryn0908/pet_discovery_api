# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all

# headers[“x-api-key”] = 7326c6e8-20ef-490a-99e2-8f162feb123e
dogs_url = "https://api.thedogapi.com/v1/breeds"
response = RestClient.get(dogs_url)
dog_data = JSON.parse(response)
# binding.pry
dog_data.each do |dog|

    image_response = RestClient.get("https://api.thedogapi.com/v1/images/search?breed_id=#{dog['id']}")
    image = JSON.parse(image_response)
    # binding.pry
    
    
    
        if image[0]
            Dog.create(
            image: image[0]["url"],
            life_span: dog["life_span"],
            name: dog["name"],
            temperament: dog["temperament"],
            weight: dog["weight"]["imperial"]
            )
           
        else 
        Dog.create(
            image: "",
            life_span: dog["life_span"],
            name: dog["name"],
            temperament: dog["temperament"],
            weight: dog["weight"]["imperial"]
        )
        end
    
        
end
    
 
      


 
 
 


 