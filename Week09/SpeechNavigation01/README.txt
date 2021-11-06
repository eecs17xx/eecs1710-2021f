Processing once had a native Speech-To-Text (STT) library, but it was never ported to Processing 3 and 4.

This is a workaround by Florian Schulz, using Chrome's built-in speech recognition and sending the result to Processing over websockets. 

The main things to remember are:
1. You have to open (or reload) the html file in Chrome to start it listening, and
2. You have to do this _after_ starting the Processing sketch.

Inelegant, but it works!
