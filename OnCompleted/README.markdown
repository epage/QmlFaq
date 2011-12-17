I was trying to implement a loading screen with Qt Component Page Stack's and ran into a bizarre issue.  I would see what should be the top item flash on the screen and then the bottom item would show up.

I admit that at the moment what I am loading is pretty fast and I don't really need a loading screen but this seemed bizarre and it took some work to at least stop it from happening.

The problem seems to be a race condition in establishing the stack.  If you just watch for Component.onCompleted then it might still be too soon to push/replace another item onto the stack.  If instead you watch for the onStatusChanged signal and confirm the page.status is PageStatus.Active then everything runs fine.
