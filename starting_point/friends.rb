def get_name(person)
  return person[:name]
end

def favourite_tv_show(person)
  return person[:favourites][:tv_show]
end

def likes_to_eat(person, food)
  for snack in person[:favourites][:snacks]
    return true if snack == food
  end
  return false
end

def add_friend(person, friend)
  person[:friends].push(friend)
end

def remove_friend(person, friend)
  person[:friends].delete(friend)
end

def total_money(people)
  total_money = 0
  for person in people
    total_money += person[:monies]
  end
  return total_money
end

def loan(person_1, person_2, loan_amount)
  person_1[:monies] -= loan_amount
  person_2[:monies] += loan_amount
end

def favourite_food(people)
  food_array = []
  for person in people
    food_array += person[:favourites][:snacks]
  end
  return food_array
end

def no_friends(people)
  names = []
  for person in people
    names.push(person[:name]) if person[:friends].empty?()
  end
  return names
end
