defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("JohnDoe", :high_kick, :punch, :heal)
      computer = Player.build("Robot", :low_kick, :punch, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("JohnDoe", :high_kick, :punch, :heal)
      computer = Player.build("Robot", :low_kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :low_kick, move_heal: :heal, move_rnd: :punch},
          name: "Robot"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :high_kick, move_heal: :heal, move_rnd: :punch},
          name: "JohnDoe"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("JohnDoe", :high_kick, :punch, :heal)
      computer = Player.build("Robot", :low_kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :low_kick, move_heal: :heal, move_rnd: :punch},
          name: "Robot"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :high_kick, move_heal: :heal, move_rnd: :punch},
          name: "JohnDoe"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{
          life: 85,
          moves: %{move_avg: :low_kick, move_heal: :heal, move_rnd: :punch},
          name: "Robot"
        },
        player: %Player{
          life: 50,
          moves: %{move_avg: :high_kick, move_heal: :heal, move_rnd: :punch},
          name: "JohnDoe"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | status: :continue, turn: :computer}

      assert expected_response == Game.info()
    end
  end
end
