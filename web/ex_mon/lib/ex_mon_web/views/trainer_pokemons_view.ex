defmodule ExMonWeb.TrainerPokemonsView do
  use ExMonWeb, :view

  alias ExMon.Trainer.Pokemon

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer: %{id: trainer_id, name: trainer_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      pokemon: %{
        id: id,
        name: name,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer: %{trainer_id: trainer_id, name: trainer_name},
        inserted_at: inserted_at
      }
    }
  end

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        name: name,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id,
        inserted_at: inserted_at
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          weight: weight,
          types: types,
          nickname: nickname,
          trainer_id: trainer_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon updated!",
      pokemon: %{
        id: id,
        name: name,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id,
        inserted_at: inserted_at
      }
    }
  end
end
