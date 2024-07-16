class FlickrController < ApplicationController
  def index
    if params[:user_id]
      # @user_id = params[:user_id]
      @photos = fetch_public_photos(params[:user_id])
    end
  end
  private

  def fetch_public_photos(user_id)
    api_key = ENV['API_KEY']
    url = "https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=#{api_key}&user_id=#{user_id}&format=json&nojsoncallback=1"
    response = HTTParty.get(url)
    # debugger
    response['photos']['photo']
  end

end
