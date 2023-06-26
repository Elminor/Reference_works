from difflib import diff_bytes
from sys import exit
import random
import data.words as words
import time
import os
import pygame


# STEP 1 >> Initial Steps to invite in the game:

def welcome():
    print("\nWelcome to Hangman game\n")
    with open('welcome_ascii.txt', 'r') as f:
        for line in f:
            print(line.rstrip())
    name = input("\nEnter your name: ")
    print("\nHello " + name.capitalize() + "! Best of Luck!")
    time.sleep(2)
    print("\nThe game is about to start!\n")
    time.sleep(2)


# STEP + >> defining background

def background_music():
    pygame.mixer.music.load("05_nintendo_-_haunted_bananas-tmnd.mp3")
    pygame.mixer.music.play()
    

# STEP 3 >> random word to guess

word_to_guess = []   # empty list >> kitalálandó szó
hidden_word = []     # elrejtett szó
hint_for_guess = []


def create_guess():
    value:list = words.pick_word() 

    for char in value[1].upper():
        word_to_guess.append(char)

        if char == " ":
            hidden_word.append(" ")
        else:
            hidden_word.append("_")

    for char in value[0].upper():
        hint_for_guess.append(char)


# STEP 2 >> difficulty + tries + lives_remaining
# STEP 4 >> validate letters
# STEP 5 >> while loop + used_letters + more and more 'if' for the functions of hangman
# STEP 6 >> display if the letter is in the word_to_guess, etc + ascii arts
# STEP 7 >> more checking in the flow of the game, winning message, lost message and quit in the end

def play():
    pygame.init()
    pygame.mixer.init()
    background_music()
    print("Let's play hangman!\nChoose a difficulty level(Type 1, 2 or 3)!")
    print("1 - Easy")
    print("2 - Medium")
    print("3 - Hard")
    print("Note: If u want to exit, type: quit.\nU can also type 'quit' anytime later during the game if u wish to exit.")

    difficulty = ""

    while len(difficulty) != 1 or not difficulty.isnumeric() or not (0 < int(difficulty) < 4):
        difficulty = input("Please choose! > ")
        if difficulty.lower() == "quit":
            exit()
    difficulty = int(difficulty)

    if difficulty == 1:
        tries = 6
    if difficulty == 2:
        tries = 5
    if difficulty == 3:
        tries = 4

    os.system('cls')
    print("\n""\n")
    your_word = ''.join(word_to_guess)
    hint = ''.join(hint_for_guess)
    guessed = False
    guessed_letter:list = []         #kitalált betűk
    used_letter:list = []            #használt betűk
    guessed_words = []
    print("Note: If u want to exit, type: quit.\nU can also type 'quit' anytime later during the game if u wish to exit.\n")
    print("\nHint: ", hint)
    print("Lives remaining: > ", tries)
    print(display_hangman(tries))
    print("\n")
    print(" ".join(hidden_word))
    
    
    while not guessed and tries > 0:
        guess = input("\nPlease choose a letter: > ").upper()
        os.system('cls')
        if len(guess) == 1 and guess.isalpha():
            if guess in used_letter:
                print("\nHint: ", hint)
                print("Lives remaining: > ", tries)
                print(display_hangman(tries))
                print(" ".join(hidden_word))
                print("\n")
                print("Used letters: > ", used_letter)
                print("You already used the letter: > ", guess)
                
            elif guess not in your_word:
                tries -= 1
                print("\nHint: ", hint)
                print("Lives remaining: > ", tries)
                print(display_hangman(tries))
                print(" ".join(hidden_word))
                print("\n")
                print("Used letters: > ", used_letter)
                print(guess, " is not in the word.")
                used_letter.append(guess)
                
            else:
                print("\nHint: ", hint,)
                print("Lives remaining: > ", tries)
                print(display_hangman(tries))
                guessed_letter.append(guess)
                used_letter.append(guess)
                indices = [i for i, letter in enumerate(word_to_guess) if letter == guess]
                for index in indices:
                    hidden_word[index] = guess
                print(" ".join(hidden_word))
                print("\n")
                print("Used letters: > ", used_letter)
                print("Good job!", guess, " is in the word!")
                
                if "_" not in hidden_word:
                    guessed = True
                    print("Congrats, you guessed the word! Your word was: " + your_word + " You won")
                    pygame.mixer.music.stop()
                    time.sleep(0.5)
                    sound = pygame.mixer.Sound("success-fanfare-trumpets-6185.wav")
                    pygame.mixer.Sound.play(sound)
                    time.sleep(3)
                    with open('win_ascii.txt', 'r') as f:
                        for line in f:
                            print(line.rstrip())
                    print("Thank u for playing with me!")
        elif len(guess) == len(your_word) and guess.isalpha() and guess != "QUIT":
            if guess in guessed_words:
                print("You already guessed the word", guess)
            elif guess != your_word:
                print(guess, "is not the word.")
                tries = 0
                pygame.mixer.music.stop()
                time.sleep(0.5)
                sound = pygame.mixer.Sound("videogame-death-sound-43894.mp3")
                pygame.mixer.Sound.play(sound)
                time.sleep(3)
            else:
                guessed = True
                indices = [i for i, letter in enumerate(word_to_guess) if letter == guess]
                for index in indices:
                    hidden_word[index] = your_word
                print("Congrats, you guessed the word! Your word was: " + your_word + " You won")
                pygame.mixer.music.stop()
                time.sleep(0.5)
                sound = pygame.mixer.Sound("success-fanfare-trumpets-6185.wav")
                pygame.mixer.Sound.play(sound)
                time.sleep(3)
                with open('win_ascii.txt', 'r') as f:
                    for line in f:
                        print(line.rstrip())
        elif guess == "QUIT":
            os.system('cls')
            print("You exited the game.")
            exit()
        else:
            print("Not a valid guess")
            print(display_hangman(tries))
            print(" ".join(hidden_word))
            print("\nHint: ", hint)
            print("Used letters: > ", used_letter)
        print("\n")
        if tries == 0:
            print("Sorry, you ran off tries. The word was " + your_word + " Maybe next time!")
            pygame.mixer.music.stop()
            time.sleep(0.5)
            sound = pygame.mixer.Sound("videogame-death-sound-43894.mp3")
            pygame.mixer.Sound.play(sound)
            time.sleep(3)
            with open('game_over_ascii.txt', 'r') as f:
                        for line in f:
                            print(line.rstrip())
                        print("Thank u for playing with me!")


# STEP 6/b >> Hangman ascii art

def display_hangman(tries):
    stages =     [ """
                +-------+
                |       |
                |       O
                |      \|/
                |       |
                |      / \\
                |
            ========
            """,
            """
                +-------+
                |       |
                |       O
                |      \|/
                |       |
                |
                |
            ========
            """,
            """
                +-------+
                |       |
                |       O
                |      \|/
                |       
                |
                |
            =========
            """,
            """
                +-------+
                |       |
                |       O
                |      \| 
                |       
                |
                |
            =========
            """,
            """
                +-------+
                |       |
                |       O
                |       |
                |       
                |
                |
            =========
            """,
            """
                +-------+
                |       |
                |       O
                |      
                |       
                |
                |
            =========
            """,
            """
                +-------+
                |       |
                |       
                |      
                |       
                |
                |
            =========
            """,
    ]
    return stages[tries]


def main():
    welcome()
    create_guess()
    play()
    exit()

if __name__ == "__main__":
    main()