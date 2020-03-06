require 'pry'

def game_hash
  hash = {
  :away => {:team_name => "Charlotte Hornets", 
  :colors => ["Turquoise", "Purple"], 
  :players =>         
   [{:player_name => "Jeff Adrien",
     :number => 4,
     :shoe => 18,
     :points => 10,
     :rebounds => 1,
     :assists => 1,
     :steals => 2,
     :blocks => 7,
     :slam_dunks => 2
     },
     {:player_name => "Bismack Biyombo",
     :number => 0,
     :shoe => 16,
     :points => 12,
     :rebounds => 4,
     :assists => 7,
     :steals => 22,
     :blocks => 15,
     :slam_dunks => 10
     },
     {:player_name => "DeSagna Diop",
     :number => 2,
     :shoe => 14,
     :points => 24,
     :rebounds => 12,
     :assists => 12,
     :steals => 4,
     :blocks => 5,
     :slam_dunks => 5
     },
     {:player_name => "Ben Gordon",
     :number => 8,
     :shoe => 15,
     :points => 33,
     :rebounds => 3,
     :assists => 2,
     :steals => 1,
     :blocks => 1,
     :slam_dunks => 0
     },
     {:player_name => "Kemba Walker",
     :number => 33,
     :shoe => 15,
     :points => 6,
     :rebounds => 12,
     :assists => 12,
     :steals => 7,
     :blocks => 5,
     :slam_dunks => 12}
     ]},
  :home => { :team_name => "Brooklyn Nets", 
  :colors => ["Black", "White"],
  :players => 
   [{:player_name => "Alan Anderson",
     :number => 0,
     :shoe => 16,
     :points => 22,
     :rebounds => 12,
     :assists => 12,
     :steals => 3,
     :blocks => 1,
     :slam_dunks => 1
     },
     {:player_name => "Reggie Evans",
     :number => 30,
     :shoe => 14,
     :points => 12,
     :rebounds => 12,
     :assists => 12,
     :steals => 12,
     :blocks => 12,
     :slam_dunks => 7
     },
     {:player_name => "Brook Lopez",
     :number => 11,
     :shoe => 17,
     :points => 17,
     :rebounds => 19,
     :assists => 10,
     :steals => 3,
     :blocks => 1,
     :slam_dunks => 15
     },
     {:player_name => "Mason Plumlee",
     :number => 1,
     :shoe => 19,
     :points => 26,
     :rebounds => 11,
     :assists => 6,
     :steals => 3,
     :blocks => 8,
     :slam_dunks => 5
     },
     {:player_name => "Jason Terry",
     :number => 31,
     :shoe => 15,
     :points => 19,
     :rebounds => 2,
     :assists => 2,
     :steals => 4,
     :blocks => 11,
     :slam_dunks => 1
     }]}}
end

def num_points_scored(player_name)
  game_hash.each do |place, team_stats|
    # binding.pry
    team_stats.each do |attribute, value|
      if attribute == :players
        value.each do |player|
          if player[:player_name] == player_name
            return player[:points]
            # binding.pry
          end
        end
      end
    end
  end
  #returns number points scored for that player
end

def shoe_size(player_name)
  game_hash.each do |place, team_stats|
    team_stats.each do |attribute, value|
      if attribute == :players
        value.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team_stats|
    if team_stats[:team_name] == team_name
      return team_stats[:colors]
    end
  end
end

def team_names
  array = []
  game_hash.each do |place, team_stats|
    #each doesn't try to return something. map tries to put something into a set of data
    if team_stats[:team_name]
      array << team_stats[:team_name]
    end
  end
  array
end
### a better way to do def team_names
# def team_names
#   game_hash.map do |place, team_stats|
#     team_stats[:team_name]
#   end
# end

def player_numbers(team_name)
  array = []
  game_hash.each do |place, team_stats|
    if team_stats[:team_name] == team_name
      team_stats.each do |attribute, value|
        if attribute == :players
        value.map do |number|
          array << number[:number]
          end
        end
      end
    end
  end
  array
end

def player_stats(player_name)
  # new_hash = {}
  # game_hash.each do |place, team_stats|
  #   team_stats.each do |attribute, value|
  #     if attribute == :players
  #       value.each do |player|
  #         if player[:player_name] == player_name
  #             new_hash = player.delete_if do |player_key, player_value| 
  #               player_key == :player_name
  #       # binding.pry
  #             # end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end 
  # new_hash
  excluding_name = {}
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if player[:player_name] == player_name
        excluding_name = player.delete_if do |player_key, player_value|
          player_key == :player_name
        end
      end
    end
  end
  excluding_name
end

def big_shoe_rebounds 
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
        if player[:shoe] > big_shoe
          big_shoe = player[:shoe]
          rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

# def big_shoe_rebounds 
#   big_shoe = 0
#   rebounds = 0
#   game_hash.each do |place, team_stats|
#     team_stats.each do |attribute, value|
#       if attribute == :players
#       value.each do |players|
#           # binding.pry
#         if players[:shoe] > big_shoe
#           big_shoe = players[:shoe]
#           rebounds = players[:rebounds]
#           end
#         end
#       end 
#     end
#   end
#   rebounds
# end

def most_points_scored

  most_points = 0
  points_owner = ""
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        points_owner = player[:player_name]
      end
    end
  end
  points_owner
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if place == :away
        away_score += player[:points]
      else
        home_score += player[:points]
      end
    end
   end
    if away_score > home_score
     return game_hash[:away][:team_name]
    else
      return game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_name = []
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
  longest_name.max_by do |name| 
    name.length
  end
  # longest_name = ""
  # game_hash.each do |place, team_stats|
  #   team_stats[:players].each do |player|
  #     if longest_name.length < player[:player_name].length
  #       longest_name = player[:player_name]
  #     end
  #   end
  # end
  # longest_name
end

def long_name_steals_a_ton?
  longest_name = ""
  name_of_most_steals = ""
  most_steals = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if longest_name.length < player[:player_name].length
        longest_name = player[:player_name]
      if most_steals < player[:steals]
        most_steals = player[:steals]
        name_of_most_steals = player[:player_name]
      if longest_name == name_of_most_steals
          # binding.pry
        return true
      else
        return false
          end
        end
      end
    end
  end
  #expected true
end