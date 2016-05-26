##### Java Track

[Back to Class 5](../../class5)


#Cryptography: Revisited

Recall from CS50 that you [did a little bit of cryptography](http://cdn.cs50.net/2015/fall/psets/2/pset2/pset2.html) using Caesar's Cipher and Vignere's Cipher. You will be creating those ciphers again, this time in Java using the [../exercises/strategy-pattern](strategy pattern).

First, create an interface called `Encodable`. This interface should have one member called `encode()`.

##Implementing your interface

Once you are satisfied with your interface, you should implement it. Create a `CaesarEncode` class and a `VignereEncode` class that implement your interface. You are welcome (and encouraged!) to use your C code to help you with this part.

If your strategies need a piece of information to do their job (such as a key) this information should be provided to the constructor of the strategy.

##Putting it all together

Once you have finished creating your strategies, create an `Encoder` class. This class should include functionality for requesting a message from the user as well as a `setEncodeable(Encodeable)` method that takes in one of your strategies, and an `encode` method that uses the given strategy to encode the message.

##Submission

Once you are finished, submit three files on Vocareum: `Encodable.java`, `CaesarEncode.java`, and `VignereEncode.java`.