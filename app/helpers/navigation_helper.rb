module NavigationHelper
  def get_header_image
    navigation_images = Dir.glob('app/assets/images/navigation-images/*.png')
    splitz = navigation_images.sample.split('/')
    @header_image = splitz[splitz.length-1]
  end
end