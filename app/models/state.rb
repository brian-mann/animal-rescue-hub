class State < ActiveRecord::Base
  attr_accessible :abbr, :ansi_code, :name, :statens
end

# == Schema Information
#
# Table name: states
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  ansi_code  :string(255)
#  statens    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

