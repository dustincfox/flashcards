This project was a challenge that was given during Dev Bootcamp.  Our team made a simple flashcard application with Sinatra.  If you would like to see my more recent work please view https://github.com/dustincfox/GrocerEASE



## GIT WORKFLOW

**DO THIS REALLY OFTEN SO ANY MERGE CONFLICTS ARE SUPER MINOR. KEEP BRANCH FEATURES TINY TINY. LITERALLY, EVERY TIME YOU MAKE 3 LINES OF CODE CHANGES OR SOMETHING LIKE THAT**

### GETTING STARTED (ESTABLISHING A NEW FEATURE BRANCH)
1. Checkout branch master (git checkout master)
2. Pull the latest master branch (git pull)
3. Checkout a new branch named for your feature (git checkout -b branchname)
4. Add your branch to the remote repository (git push -u origin branchname)
5. Continue working on your branch, git add --all and git commit often.
6. Move on to [the next steps](#steps-for-merging-your-branch-into-master).

### STEPS FOR MERGING YOUR BRANCH INTO MASTER
1. git add and git commit your final changes on your branch
2. Push the latest version of your branch up to its remote on github (git push -u origin yourbranchname)
3. Go to our project page on github. Select your branch from the dropdown menu of branches, making sure that your latest push went through from step 3.
4. Click the bright green "Compare and Pull Request" button
5. In the message box, write what you think should be done with the merge conflicts outlined, if any.
6. Click "submit pull request"

Mama merge will review the changes and make sure the people who are conflicting with their code are pulled in if necessary.

### ETIQUETTE

* git add --all, git commit -m "x" OFTEN
* DO NOT INCLUDE MULTIPLE FEATURES IN ONE BRANCH. FOR THE LOVE OF GOD.

<hr>

# Planning

## Associations Work:

* card belongs_to deck
* deck has_many cards
* round belongs_to deck # this will be true only as long as there aren't multiple decks per round
* deck has_many rounds
* round belongs_to user
* user has_many rounds
* user has_many decks :through rounds

A has_many :through association is often used to set up a many-to-many connection with another model. This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model. For example, consider a medical practice where patients make appointments to see physicians. The relevant association declarations could look like this:

