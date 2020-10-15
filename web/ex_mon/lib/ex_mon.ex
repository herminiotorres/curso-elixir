defmodule ExMon do
  alias ExMon.{Pokemon, Trainer}
  alias ExMon.Trainer.Pokemon, as: TrainerPokemon

  # trainer
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call

  # pokemon
  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call

  # pokemon trainer
  defdelegate fetch_trainer_pokemon(params), to: TrainerPokemon.Get, as: :call
  defdelegate create_trainer_pokemon(params), to: TrainerPokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(params), to: TrainerPokemon.Delete, as: :call
end
