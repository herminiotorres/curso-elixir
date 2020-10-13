defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = game_info) do
    IO.puts("\n====== The game is started! ======\n")
    IO.inspect(game_info)
    IO.puts("\n------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = game_info) do
    IO.puts("\n====== It's #{player} turn. ======\n")
    IO.inspect(game_info)
    IO.puts("\n------------------------------------")
  end

  def print_round_message(%{status: :game_over} = game_info) do
    IO.puts("\n====== The game is over. ======\n")
    IO.inspect(game_info)
    IO.puts("\n------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n====== Invalid move: #{move} ======\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n====== The Player attacked the computer dealing #{damage} damage. ======\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n====== The Computer attacked the player dealing #{damage} damage. ======\n")
  end
end
