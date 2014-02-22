I'm changing the title of this file from Web flashcards group project, V1 to:

Web FJFJFJFJFJFJFJFFJFJKSLA;FJKDSL GRO00000000000000UP PROJECT YAY ######fjkafdjskfal;sdj

## Git Workflow:

DO THIS REALLY FUCKING OFTEN SO ANY MERGE CONFLICTS ARE SUPER MINOR. LITERALLY, EVERY TIME YOU MAKE 3 LINES OF CODE CHANGES OR SOMETHING LIKE THAT

1. Checkout branch master (git checkout master)
2. Pull the latest master branch (git pull)
3. Checkout a new branch named for your feature (git checkout -b branchname)
4. Add your branch to the remote repository (git push -u origin branchname)
5. Make your changes in your branch.
6. Once changes are done, git add and git commit your branch.
7. Change to the master branch (git checkout master)
8. Run git merge yourbranchname
9. 



8. Pull the latest version of the master branch and merge it with your branch (git pull https://github.com/cnocon/flashcards.git yourbranchname)
9. MAKE A PULL REQUEST: Go to our flashcards project page in github. Navigate to your branch. 
a. https://help.github.com/articles/using-pull-requests#initiating-the-pull-request

9. If there are merge conflicts, git will tell you; check the messages that the terminal spits out after step eight.
10. To handle merge conflicts, go back into your text editor with all the open files; the same one you were working in before with our project open. Go through the list of filenames that git says have merge conflicts and resolve them manually; read this blog post: http://githowto.com/resolving_conflicts to understand how to read git's notation...
11. What is in between the <<<<<<<HEAD and the ====================== is your branch. What is after the equals signs part and until the >>>>>>>>>>>>>>>>>>>>branch_id/commit_id/whatev part is what is in the master. 
12. **BE FUCKING CAREFUL**. 

You've just been added as a collaborator.

1. Clone the repo.
2. Checkout your own branch, named after the feature (git checkout -b feature-name)
3. Git add changes, git commit changes
4. Push your branch to the remote: git push -u origin your-branch-name (this is where your changes are tracked. They are NOT tracked on master)

When you are ready to merge with master:

1. git checkout master
2. git pull (this will pull the MOST up-to-date version of the repo, so you aren't merging with an out of date copy)
3. git merge yourbranch master
4. Make a pull request



## Associations Work:

* card belongs_to deck
* deck has_many cards
* round belongs_to deck # this will be true only as long as there aren't multiple decks per round
* deck has_many rounds
* round belongs_to user
* user has_many rounds
* user has_many decks :through rounds

* _unsure_:: card has_many rounds :through deck


A has_many :through association is often used to set up a many-to-many connection with another model. This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model. For example, consider a medical practice where patients make appointments to see physicians. The relevant association declarations could look like this:

