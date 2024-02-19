class PhotosController < ApplicationController
  def index
    photos = Photo.all

    @photo_list = photos.order({ :created_at => :desc })
    render({ :template => "photo_template/index" })
  end

  def show
    photo_id = params.fetch("photo_id")

    #  photos = Photo.all

    @matching_photo = Photo.where({ :id => photo_id }).first

    render({ :template => "photo_template/show" })
  end

  def delete
    the_id = params.fetch("photo_id")

    del_pho = Photo.where({ :id => the_id })
    this_one = del_pho.first
    this_one.destroy

    redirect_to("/photos")

    #render({ :template => "photo_template/delete" })
  end

  def add

    # img_url=a &img_caption=v &owner_id=c

    add_img = params.fetch("img_url")
    add_caption = params.fetch("img_caption")
    add_owner_id = params.fetch("owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = add_img
    a_new_photo.caption = add_caption
    a_new_photo.owner_id = add_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    #Parameters: {"input_image"=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQgByBT5IiAT_a2x9pUVb4VMoOrlzHH7Jrzj-HB5jzHlR4lNLMS", "input_caption"=>"fdsafdsafda", "photo_id"=>"951"}

    the_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    add_img = params.fetch("input_image")
    add_caption = params.fetch("input_caption")

    the_photo.image = add_img
    the_photo.caption = add_caption

    the_photo.save
    redirect_to("/photos/" + the_photo.id.to_s)
  end
end
