# == Schema Information
#
# Table name: units
#
#  id          :integer          not null, primary key
#  image       :string
#  title       :string
#  description :string
#  region      :string
#  cp          :string
#  price       :float
#  score       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Unit < ApplicationRecord
    has_many :reviews

    def self.find_all_by_title_or_region(title, region)
        Unit.where(["title = ? or region= ?", title, region])
    end

    def addReview(this_review)
        reviews << this_review
    end
end
