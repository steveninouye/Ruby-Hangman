# Phase I: Human Guesses Word
We'll start out with the computer choosing the secret word and the human trying to guess it. The computer player should read in a dictionary file (lib/dictionary.txt) and choose a word randomly. There are specs to guide you through most of the project, then you'll have to go a little further to make it actually playable. Interaction should look something like so:

```
Secret word: _____ > h Secret word: h____ > l Secret word: h_ll_ > z Secret word: h_ll_
```

# Phase II: Computer Guesses Letters Randomly
Next, add functionality to let the user pick a word; they only need to enter the word length, not what the word is. The human player shouldn't trust giving the word to the computer.

The computer should, using its dictionary, start guessing. The human should tell the computer the positions (if any) where the guessed letter occurs. While you're getting this interaction working, you can have the computer temporarily guess random letters.

Make sure your game class (probably named `Hangman`) doesn't do too much. You should have `HumanPlayer` and `ComputerPlayer` classes; they should contain the logic both for (1) guessing letters and (2) confirming guesses. Make your `HumanPlayer` and `ComputerPlayer` classes interchangeable.

The `Hangman#initialize` method should take `guessing_player` and `checking_player` arguments; the game should not treat a computer player any differently than a human player.

API Thoughts
Here are some methods of both `HumanPlayer` and `ComputerPlayer` that we implemented:

- pick_secret_word
- register_secret_length
- guess
- check_guess
- handle_response

# Phase III: Computer Guesses Intelligently
Next, the computer should try to be smart and guess letters from words of the right length, and which match the currently known letters. To do this, first narrow the dictionary down to the set of possible words with the right length.

To generate a guess, a fair strategy is to guess the most frequent letter in the subset of possible words. If the guessed letter is found, filter the dictionary to only words with the guessed letter in the correct position(s).

Filter out words that have the guessed letter at an incorrect position. In particular, if the guessed letter is not present, eliminate all words in the dictionary which feature the letter.