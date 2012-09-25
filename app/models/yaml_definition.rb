class YamlDefinition

  attr_accessor :definition

  def initialize(definition)
    @definition = definition
  end

  def output
    { definition.name => { 'executable' => definition.executable }}
  end
end
