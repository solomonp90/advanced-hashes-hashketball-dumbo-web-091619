require "pry"
def game_hash
game_hash = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [{
        "Alan Anderson" =>{
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }
      },
      {
        "Reggie Evans" =>{
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }
      },
      {
        "Brook Lopez" =>{
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }
      },
      {
        "Mason Plumlee" =>{
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }
      },
      {
        "Jason Terry" =>{
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }




      ]
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [{
        "Jeff Adrien" =>{
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }
      },
      {
        "Bismack Biyombo" =>{
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }
      },
      {
        "DeSagna Diop" =>{
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }
      },
      {
        "Ben Gordon" =>{
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }
      },
      {
        "Kemba Walker" =>{
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }




      ]
    }




  }
end




def num_points_scored(string)
  game_hash.each_pair do |locale,team_data|
    team_data[:players].each do |plyr|
      if plyr[string]
        plyr_stats = plyr[string]
         return plyr_stats[:points]
      end
    end
  end
end


def shoe_size(string)
  game_hash.each_pair do |locale,team_data|
    team_data[:players].each do |plyr|
      if plyr[string]
        plyr_stats = plyr[string]
         return plyr_stats[:shoe]
      end
    end
  end
end


def team_colors(string)
  game_hash.each_value do |value|
    if value[:team_name] == string
      return value[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.each_value { |values|
    team_names<<values[:team_name]
    }
  team_names
end


def player_numbers(string)
  numbers = []
  game_hash.each_pair do |locale,team_data|
    if team_data[:team_name] == string
      team_data[:players].each do |plyr|
         plyr.each_value do |stats|
          numbers<<stats[:number]
        end
      end
    end
  end
numbers
end

def player_stats(string)
  game_hash.each_pair do |locale,team_data|
    team_data[:players].each do |plyr|
      if plyr[string]
        return plyr[string]
      end
    end
  end
end

def big_shoe_rebounds
  max_size = 0
  rebounds_by_shoe = 0
  game_hash.each_value do |teams|
    teams[:players].each do |plyr|
       plyr.each_value do |stats|
        if stats[:shoe] > max_size
          max_size = stats[:shoe]
          rebounds_by_shoe = stats[:rebounds]
        end
      end
    end
  end
  rebounds_by_shoe
end

def most_points_scored(stat_to_find = :points)
  mvp = ''
  max_score = 0
  game_hash.each_value do |teams|
    teams[:players].each do |plyr|
       plyr.each_value do |stats|
        if stats[stat_to_find] > max_score
          max_score = stats[stat_to_find]
          mvp = plyr.keys[0]
        end
      end
    end
  end
  mvp
end

def winning_team
  home_score = 0
  away_score = 0
game_hash[:home][:players].each do |plyr|
  plyr.each_value do |stats|
    home_score += stats[:points]
  end
end
game_hash[:away][:players].each do |plyr|
  plyr.each_value do |stats|
    away_score += stats[:points]
  end
end

p home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
game_hash.each_pair do |locale,team_data|
  team_data[:players].each do |plyr|
    if plyr.keys[0].size > longest_name.size
      longest_name = plyr.keys[0]
    end
  end
end
  longest_name
end

def long_name_steals_a_ton?
 player_with_longest_name == most_points_scored(:steals)
end
