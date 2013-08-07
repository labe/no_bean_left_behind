locations = ["goatlandia", "chicagoland", "chipslandia", "kolacheland", "koalaland", "banoffeepieland", "murrika", "franprix"]

User.create(name: "Lora L.A.", username: "goatsahoy", email: "goats@ahoy.com", password: "password", location: locations[0])
User.create(name: "User 2", username: "chipsahoy", email: "chips@ahoy.com", password: "password", location: locations.sample)
User.create(name: "User 3", username: "user3", email: "user3@ahoy.com", password: "password", location: locations.sample)
User.create(name: "User 4", username: "user4", email: "user4@ahoy.com", password: "password", location: locations.sample)
User.create(name: "User 5", username: "user5", email: "user5@ahoy.com", password: "password", location: locations.sample)

jelly_beans = ["cherry", "root beer", "peach", "watermelon", "cotton candy", "buttered popcorn", "coconut", "chunkybacon", "tofu"]

jelly_beans.each do |jb|
	JellyBean.create(flavor: jb)
end


User.all.each do |user|
	beans = JellyBean.all.shuffle
	rand(1..9).times do
		user.jelly_beans << beans.pop
	end
end