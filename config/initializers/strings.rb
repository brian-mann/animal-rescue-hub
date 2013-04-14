class String
  def capitalize_first
    self[0].upcase + self[1..-1] unless self.blank?
  end

end