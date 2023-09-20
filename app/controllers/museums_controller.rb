class MuseumsController < ApplicationController
  require 'rest-client'
  require 'json'

  def nearby_museums
    latitude = params[:lat]
    longitude = params[:lng]

    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?proximity=#{longitude},#{latitude}&access_token=#{ENV['MAPBOX_API_KEY']}"
    response = RestClient.get(url)
    data = JSON.parse(response.body)
    museums = data['features'].map { |feature| feature['text'] }

    render json: data
  end
end
