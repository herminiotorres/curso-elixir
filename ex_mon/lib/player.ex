defmodule ExMon.Player do
  @required_keys ~w(life moves name)a
  @max_file 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_avg, move_rnd, move_heal) do
    %__MODULE__{
      life: @max_file,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd,
      },
      name: name
    }
  end
end
