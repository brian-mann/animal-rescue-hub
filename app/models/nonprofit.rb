class Nonprofit < ActiveRecord::Base
  attr_accessible :name
end

# == Schema Information
#
# Table name: nonprofits
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  ein        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

