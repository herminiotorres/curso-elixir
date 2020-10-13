defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_player = %Player{life: 100, moves: %{move_avg: :high_kick, move_heal: :heal, move_rnd: :punch}, name: "JohnDoe"}

      assert expected_player == ExMon.create_player("JohnDoe", :high_kick, :punch, :heal)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("JohnDoe", :high_kick, :punch, :heal)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game is started!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end
end
