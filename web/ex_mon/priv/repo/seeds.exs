# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExMon.Repo.insert!(%ExMon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ExMon.{Repo, Trainer}

Repo.delete_all(Trainer)
[
  "John Doe",
  "Jane Doe",
  "Bob Doe",
  "Adam Doe",
  "Linda Doe",
  "Kate Doe",
] |> Enum.each(fn name ->
  ExMon.create_trainer(%{name: name, password: "123456"})
end)
