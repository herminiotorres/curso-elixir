defmodule ExMon.Trainer.Pokemon.Update do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainer.Pokemon

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Trainer Not Found"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end
end
