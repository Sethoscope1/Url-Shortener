class Tagging < ActiveRecord::Base

  belongs_to(
   :tag,
   :class_name => "Tag",
   :foreign_key => :tag_id,
   :primary_key => :id
  )

  belongs_to(
    :shortened_url,
    :class_name => "ShortenedUrl",
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )

end