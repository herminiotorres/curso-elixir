defmodule ExMon.Trainer.Pokemon.Delete do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainer.Pokemon

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon Not Found"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
