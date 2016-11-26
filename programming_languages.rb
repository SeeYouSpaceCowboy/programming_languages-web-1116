def reformat_languages(languages)
  new_hash = {}

  languages.each{|key, value|
    value.each{|key, value|
      new_hash[key] = value
    }
  }

  languages.each{|key, value|
    if key == :oo
      new_hash.each{|key, value|
        if languages[:oo].has_key?(key)
          new_hash[key][:style] = [:oo]
        end
      }

    elsif key == :functional
      new_hash.each{|key, value|
        if languages[:functional].has_key?(key) && !new_hash[key].has_key?(:style)
          new_hash[key][:style] = [:functional]
        elsif languages[:functional].has_key?(key)
          new_hash[key][:style].push(:functional)
        end
      }
    end
  }

  new_hash
end

# {
#   :ruby => {
#     :type => "interpreted",
#     :style => [:oo]
#   },
#   :javascript => {
#     :type => "interpreted",
#     :style => [:oo, :functional]
#   },
#   :python => {
#     :type => "interpreted",
#     :style => [:oo]
#   },
#   :java => {
#     :type => "compiled",
#     :style => [:oo]
#   },
#   :clojure => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :erlang => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :scala => {
#     :type => "compiled",
#     :style => [:functional]
#   }
# }
