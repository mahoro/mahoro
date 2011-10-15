if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'slides').blank?
      user.plugins.create(:name => 'slides',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
