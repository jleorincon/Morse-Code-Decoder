var englishText = "this is a secret message"
var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

var letterToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  "0": "-----",
  "1": ".----",
  "2": "..---",
  "3": "...--",
  "4": "....-",
  "5": ".....",
  "6": "-....",
  "7": "--...",
  "8": "---..",
  "9": "----.",
  ".": ".-.-.-",
  "!": "-.-.--",
  "?": "..--..",
  ",": "--..--",
]

// Encoding a Message
var morseText = ""

for element in englishText {
  if let morseChar = letterToMorse["\(element)"] {
    morseText += morseChar + " "
  } else {
    morseText += "   "
  } 
}
print(morseText)

// Decoding a Message
var decodedMessage = ""
var currMorse = ""
var morseCodeArray = [String]()
var spaceCount = 0

for char in secretMessage {
  if char != " " {
    currMorse.append(char)
    spaceCount = 0
  } else {
    spaceCount += 1
    if spaceCount == 3 {
      morseCodeArray.append(currMorse)
      currMorse = ""
      morseCodeArray.append(" ")
      spaceCount = 0
    } else if spaceCount == 1 {
      if !currMorse.isEmpty {
        morseCodeArray.append(currMorse)
        currMorse = ""
      }
    }
  }
}
if !currMorse.isEmpty {
  morseCodeArray.append(currMorse)
}

var morseToLetter: [String: String] = [:]
for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    decodedMessage += letterChar
  } else {
    decodedMessage += " "
  }
}
print(decodedMessage)
