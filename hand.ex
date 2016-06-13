defmodule Blackjack.Hand do
  defstruct cards: []

  def add_card(hand, card) do
    %{hand | cards: [card | hand.cards]}
  end

  def add_cards(hand, [h | t]) do
    add_card(hand, h) |> add_cards(t)
  end
  def add_cards(hand, []), do: hand

  def score(hand) do
    hand.cards
    |> Enum.reduce(0, &(&2 + card_value(String.slice(&1, 0..-2))))
    |> handle_aces(ace_count(hand))
  end

  def ace_count(hand), do: Enum.count(hand.cards, &(String.at(&1, 0) == "A"))

  defp card_value("Q"), do: 10
  defp card_value("K"), do: 10
  defp card_value("J"), do: 10
  defp card_value("A"), do: 11
  defp card_value(rank), do: String.to_integer(rank)

  defp handle_aces(total, ace_count) when total > 21 and ace_count > 0 do
    handle_aces(total - 10, ace_count - 1)
  end
  defp handle_aces(total, _), do: total
end
