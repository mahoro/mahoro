if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'slides').blank?
      user.plugins.create(:name => 'slides',
        :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(RefinerySetting)
  RefinerySetting.create :name => "slides",
    :value => {
      :height        => 300,
      :width         => 900,
      :effect        => "stack",
      :duration      => 10,
      :delay         => 50,
      :autoplay      => true,
      :stop_on_hover => true,
      :loop          => true,
      :bullets       => true,
      :caption       => true,
      :controls      => true
    },
    :destroyable => false,
    :form_value_type => "text_area"
end
