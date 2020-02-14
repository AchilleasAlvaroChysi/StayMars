class Unit < ApplicationRecord

    def self.find_all_by_title_or_region(title, region)
        Unit.where(["title = ? or region= ?", title, region])
    end
end
