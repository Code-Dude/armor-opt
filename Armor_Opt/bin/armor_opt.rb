require_relative '../lib/armor'
require 'yaml'

class ArmorOpt
  def initialize
    @armor = Hash.new
    @created_armors = Array.new
    write_out
  end

  def load_armors
    data = YAML::load_file('../assets/armor_profs.yaml')
    data['Armors'].each_pair do |armors, stats|
      @armor[armors] = stats
    end
    @armor.each_pair do |armors,stats|
      @created_armors << Armor.new(armors, stats)
    end
  end

  def opt
    load_armors
    @optimized_armors_ab = Hash.new
    @optimized_armors_rating = Hash.new
    @optimized_armors_arcrating = Hash.new
    @optimized_check_rating = Hash.new

    @created_armors.each do |armor|
      @optimized_armors_ab[armor.name] = armor.armorb
      @optimized_armors_rating[armor.name] = armor.rating
      @optimized_check_rating[armor.name] = armor.check_rating
      @optimized_armors_arcrating[armor.name] = armor.arcane_rating
    end
  end

  def write_out
    opt
    File.open('../assets/Armor_results.txt', 'w') do |fh|
      fh.puts "-----ARMOR BONUS-----"
      sorted_armor_bonuses = @optimized_armors_ab.sort_by {|k,v| v}
      sorted_armor_bonuses.reverse.each do |k,v|
        fh.puts "#{k}-#{v}"
      end
    end

    File.open('../assets/Armor_results.txt', 'a') do |fh|
      fh.puts "\n-----ARMOR RATING-----"
      sorted_armor_bonuses = @optimized_armors_rating.sort_by {|k,v| v}
      sorted_armor_bonuses.reverse.each do |k,v|
        fh.puts "#{k}-#{v}"
      end
    end

    File.open('../assets/Armor_results.txt', 'a') do |fh|
      fh.puts "\n-----ARMOR CHECK PENALTY RATING-----"
      sorted_armor_bonuses = @optimized_check_rating.sort_by {|k,v| v}
      sorted_armor_bonuses.reverse.each do |k,v|
        fh.puts "#{k}-#{v}"
      end
    end

    File.open('../assets/Armor_results.txt', 'a') do |fh|
      fh.puts "\n-----ARMOR ARCANE RATING-----"
      sorted_armor_bonuses = @optimized_armors_arcrating.sort_by {|k,v| v}
      sorted_armor_bonuses.reverse.each do |k,v|
        fh.puts "#{k}-#{v}"
      end
    end
  end
end

ArmorOpt.new