namespace :images do
	
	@path = "app/assets/images/working/"
	
	task :resize => :environment do
	  desc "Resizes images in the preview folder"
		files = Dir.glob("#{@path}*.jpg")
		files.each_with_index do |file|
			image = Magick::Image.read(file).first
			resize_image_by(image, file.downcase!, 300, 300)
		end
	end
	
	def resize_image_by(image, name, columns, rows)
		p name
		image.resize_to_fit!(columns, rows).write(name) #if image.columns > columns || image.rows > rows
	end
end