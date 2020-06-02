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

require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
