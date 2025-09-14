# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :post_images

  def posting_hour(time = created_at)
    return "" unless time

    now = Time.zone.now
    diff = now - time

    return time.strftime("%Y/%m/%d") if diff.negative?

    case diff
    when 0...60
      "たった今"
    when 60...3600
      "#{(diff / 60).floor}分前"
    when 3600...86_400
      "#{(diff / 3600).floor}時間前"
    when 86_400...(7 * 86_400)
      "#{(diff / 86_400).floor}日前"
    else
      time.strftime("%Y/%m/%d")
    end
  end
end
