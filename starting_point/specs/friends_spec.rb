require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Shaggy",
      age: 12,
      monies: 1,
      friends: ["Velma","Fred","Daphne", "Scooby"],
      favourites: {
        tv_show: "Friends",
        snacks: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Velma",
      age: 15,
      monies: 2,
      friends: ["Fred"],
      favourites: {
        tv_show: "Baywatch",
        snacks: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Scooby",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma"],
      favourites: {
        tv_show: "Pokemon",
        snacks: ["Scooby snacks"]
      }
    }

    @person4 = {
      name: "Fred",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma", "Daphne"],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spaghetti", "ratatouille"]
      }
    }

    @person5 = {
      name: "Daphne",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Daphne", result)
  end

  # 2. For a given person, return their favourite tv show
  # (e.g. the function favourite_tv_show(@person2) should return the string "Baywatch")
  def test_favourite_tv_show__person2_returns_baywatch
    result = favourite_tv_show(@person2)
    expected = "Baywatch"
    assert_equal(expected,result)
  end


  # 3. For a given person, check if they like a particular food
  # (e.g. the function likes_to_eat(@person2, "bread") should return true, likes_to_eat(@person3, "spinach") should return false)
  def test_likes_to_eat__person2_bread_returns_true
    result = likes_to_eat(@person2, "bread")
    expected = true
    assert_equal(expected,result)
  end

  def test_likes_to_eat__person3_spinach_returns_false
    result = likes_to_eat(@person3, "spinach")
    expected = false
    assert_equal(expected,result)
  end


  # 4. For a given person, add a new name to their list of friends
  # (e.g. the function add_friend(@person2, "Scrappy-Doo") should add Scrappy-Doo to the friends.)
  # (hint: This function should not return anything. After the function call, check for the length of the friends array to test it!)
  def test_add_friend__person2_adds_scrappy_doo
    add_friend(@person2, "Scrappy-Doo")
    result = @person2[:friends].length()
    expected = 2
    assert_equal(expected, result)
  end

  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)
  def test_remove_friend__person4_removes_shaggy
    remove_friend(@person4, "Shaggy")
    result = @person4[:friends].length()
    expected = 2
    assert_equal(expected, result)
  end

  # 6. Find the total of everyone's money
  # (hint: use the @people array, remember how we checked the total number of eggs yesterday?)
  def test_total_money__people_returns_143
    result = total_money(@people)
    expected = 143
    assert_equal(expected, result)
  end

  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: our function will probably need 3 arguments passed to it... the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed, maybe two assertions?)
  def test_loan__person1_monies_decreased
    loan(@person1, @person2, 1)
    result = @person1[:monies]
    expected = 0
    assert_equal(expected, result)
  end

  def test_loan__person3_monies_increased
    loan(@person4, @person3, 1)
    result = @person3[:monies]
    expected = 21
    assert_equal(expected, result)
  end
  # 8. Find the set of everyone's favourite food joined together
  # (hint: concatenate the favourites/snack arrays together)
  def test_favourite_food__produce_concatenated_string
    result = favourite_food(@people)
    expected = ["charcuterie", "soup", "bread", "Scooby snacks", "spaghetti", "ratatouille", "spinach"]
    assert_equal(expected, result)
  end

  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)
  def test_no_friends_return_array_friendless_people
    result = no_friends(@people)
    expected = ["Daphne"]
    assert_equal(expected, result)
  end
end
