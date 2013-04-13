namespace :images do
	
	@path = "app/assets/images/preview/"
	
	task :resize => :environment do
	  desc "Resizes images in the preview folder"
		files = Dir.glob("#{@path}*.jpg")
		files.each_with_index do |file, index|
			image = Magick::Image.read(file).first
			index += 1
			resize_image_by(image, index, 300, 300)
		end
	end
	
	def resize_image_by(image, index, columns, rows)
		image.resize_to_fit!(columns, rows).write(image) #if image.columns > columns || image.rows > rows
	end
end