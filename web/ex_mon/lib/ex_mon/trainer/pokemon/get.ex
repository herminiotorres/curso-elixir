defmodule ExMon.Trainer.Pokemon.Get do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainer.Pokemon

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon Not Found"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
