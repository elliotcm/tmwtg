class PremiumSquare < Square
  def premium?
    true
  end

  def bonus
    self.class.name.underscore.humanize.gsub(/\s+square/, '')
  end
end
