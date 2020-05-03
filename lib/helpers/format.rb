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
    info << "Element: #{equip.element}" unless equip.element.nil?
    unless equip.bonus.empty?
      info << '*Bonuses:*'
      equip.bonus.each { |bonus| info << "*#{bonus}*" }
    end
    info
  end
end
