defmodule Blackjack.Deck do
  @moduledoc """
  Represents a deck of cards
  """

  @suits ["C", "S", "H", "D"]
  @ranks ["2", "3", "4", "5", "6", "7", "8", "9", "10", "A", "K", "Q", "J"]

  def new() do
    @suits
    |> Enum.map(&(Enum.map(@ranks, fn r -> "#{r}#{&1}" end)))
    |> List.flatten
  end

  @doc """
  Takes a Deck
  Returns shuffled list
  """

  @spec shuffle(list()) :: list()

  def shuffle(deck), do: Enum.shuffle(deck)


  @doc """
  Remove N number of cards from the "top" of the Deck
  Returns new deck and cards taken
  """

  @spec take(list(), number()) :: {list(), list()}

  def take(deck, n \\ 1) when is_list(deck), do: deck |> Enum.split(n)

end
