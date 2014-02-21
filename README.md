flashcards
==========

Web flashcards group project, V1

Git Workflow:

You've just been added as a collaborator.

1. Clone the repo.
2. Checkout your own branch, named after the feature (git checkout -b feature-name)
3. Git add changes, git commit changes
4. Push your branch to the remote: git push -u origin your-branch-name (this is where your changes are tracked. They are NOT tracked on master)

Once you are ready to merge your branch with master:


## Associations Work:

* card belongs_to deck
* deck has_many cards
* round belongs_to deck # this will be true only as long as there aren't multiple decks per round
* deck has_many rounds
* round belongs_to user
* user has_many rounds
* user has_many decks :through rounds
* card has_many rounds :through deck


A has_many :through association is often used to set up a many-to-many connection with another model. This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model. For example, consider a medical practice where patients make appointments to see physicians. The relevant association declarations could look like this:
