An example of a recursive view is a file system browser.  You select a directory and you get the exact same view all over again but with a different model.  That can repeat indefinetly.

I've tried to accomplish this by trying to bind a property on an object or add an item to its context properties.  This allows the greatest code reuse.  Sadly I've had problems as demonstrated in "question.py".

"hack.py" demonstrates using a controller to accomplish this.  This feels dirty to me.  Some of these views are so simple they should be independent of the controller.  Also this breaks down if I ever wanted to have multiple windows each with their own view. (Note currently "hack.py" is in the SegFault example.  Once a solution to the segfault is found it will be pulled back in)
