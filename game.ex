Code.require_file("deck.ex")
Code.require_file("hand.ex")

defmodule Blackjack.Game do
  defstruct players: []

  def initialize_game do
    deck = Blackjack.Deck.new()
      |> Blackjack.Deck.shuffle
    [ card1 | [ card2 | current_deck ] ] = deck
    player = %Blackjack.Hand{}
      |> Blackjack.Hand.add_card(card1)
      |> Blackjack.Hand.add_card(card2)
    [player, current_deck]
  end
end
