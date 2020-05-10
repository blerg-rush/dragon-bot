# frozen_string_literal: true

module Format
  def self.title(string)
    string.split.map(&:capitalize).join(' ')
  end

  def self.equip_info(equip)
    info = []
    info << "**#{title(equip.name)}**"
    info << "Required level: #{equip.level}"
    info << "Classes: #{equip.classes}"
    info << equip.stats
    if equip.has_attribute?(:element)
      info << "Element: #{equip.element}" unless equip.element.nil?
    end
    unless equip.bonus.empty?
      info << '_Bonuses:_'
      equip.bonus.each { |bonus| info << "_#{bonus}_" }
    end
    info
  end
end
