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
