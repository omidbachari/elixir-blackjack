defmodule Blackjack.Game do
  alias Blackjack.Deck
  alias Blackjack.Hand

  def start do
    IO.puts "Welcome to Blackjack!"

    player = %Hand{}
    dealer = %Hand{}
    deck = Deck.shuffle(Deck.new)

    deck
    |> game_loop(player, :player)
    |> game_loop(dealer, :dealer)
  end

  defp game_loop(deck, player, :player) do
    {cards, deck} = Deck.take(deck, 2)

    for card <- cards, do: IO.puts "Player was dealt: #{card}"

    player = Hand.add_cards(player, cards)
    IO.puts "\nPlayer hand: #{Enum.join(player.cards, ", ")}"
    IO.puts "Player score: #{Hand.score(player)}\n"
    IO.puts "Hit or stand (H/S): "

    deck
  end

  defp game_loop(deck, dealer, :dealer) do
  end
end
