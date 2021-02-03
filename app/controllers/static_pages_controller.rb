class StaticPagesController < ApplicationController

  def home

    flickr = Flickr.new

    if params[:user_id]
      begin
        @photos = flickr.photos.search :user_id => params[:user_id]
        if @photos.none?
          flash.now[:alert] = "No photos found for that user."
        end
      rescue Flickr::FailedResponse => e
        flash.now[:alert] = "No user found for that id"
      end
    end

  end

end