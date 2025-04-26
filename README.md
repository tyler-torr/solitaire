# solitaire
 Solitaire coded in lua.
 
 -- Programming Patterns & Design --
 This project seeks to implement fully developed solitaire gameplay, although right now it's currently more of a prototype.
 Card layout is somewhat implemented with tableau piles and card movement possible, but otherwise janky and rudamentary.
 The main programming pattern the game uses right now is a flyweight pattern, used to quickly handle the 52 cards' creation
 for a deck.
 
 -- Postmortem --
 Implementing the cards and pile logic was fun, and while deck logic isn't fully finished it's nearly there, something which
 was interesting to implement. However, for whatever reason, grabbing has fully annihilated and destroyed me and robbed me
 and took my belongings and beat me up. It took up a significant portion of my time and is why the prototype isn't fully
 developed yet. If I were to do things differently, I wish I'd have focused on implementing grabbing for cards immediately:
 along with other essential card implementations like grabbing and snapping cards into place on piles, and then moving on
 from there. Working backwards and having to rewrite other parts of my code in tandem has proven that this would've been the 
 right move. There is a particularly janky interaction right now where cards get deleted after dragging them or upon collision
 of other cards -- I genuinely don't know why but this is my best implementation of the cards' movement right now. My immediate
 priority next is to figure out grabbing and cards snapping into place on movement, even if it means rewriting everything else.
 
 -- Assets --
 Card sprites are from 'Free Playing Cards Pixelart Asset Pack', made by Elvgames.
 https://elvgames.itch.io/playing-cards-pixelart-asset-pack

