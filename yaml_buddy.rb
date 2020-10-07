# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

# Module that can be included (mixin) to take and output YAML data
module YamlBuddy
  def take_yaml(yaml)
    @data = []
    yaml = YAML.safe_load(yaml)
    yaml.each do |hash|
      @data << hash
    end
  end

  def to_yaml
    @data.to_yaml
  end
end
