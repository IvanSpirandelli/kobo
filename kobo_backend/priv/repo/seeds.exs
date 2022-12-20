# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kobo.Repo.insert!(%Kobo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Kobo.Repo
alias Kobo.Articles.Article

Repo.insert! %Article{
  image: "https://picsum.photos/id/512/1024/1024",
  text: "I like my food hairy\nbut no dairy;\nmakes me weary."
}

Repo.insert! %Article{
  image: "https://picsum.photos/id/99/1024/1024",
  text: "My horse is no beauty \nbut my sword is enormous\nI am hunting for booty.\nWell hello there gorgeous!"
}

Repo.insert! %Article{
  image: "https://picsum.photos/id/42/1024/1024",
  text: "When I go MOO\nyou go MOO\nMOO? MOO!"
}

Repo.insert! %Article{
  image: "https://picsum.photos/id/231/1024/1024",
  text: "When I go MOO\nyou go MOO\nMOO? MOO!"
}

Repo.delete!(Repo.get!(Article, 3))
