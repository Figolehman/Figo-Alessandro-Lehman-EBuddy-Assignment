#  This project belongs to Figo Alessandro Lehman

Notes to Reviewer:
1. Figma's frame size (166 x 312) does not scale well with phone's screen. So if figma's design fits full figma screen size, it will not take full screen size in phone's screen but rather leave a little bit space on the bottom of the screen.
2. Figma's design is showing one user at a time in a view, so I was thinking that I shouldn't have integrated the task before (fetch users, and upload profile image) with the figma's design. Instead creating a new view just for the figma's design.
3. In firestore, I put the missing field like, last_active, rating, and price. last_active is in the form of number to represent date in epoch form. Since, this will also query and show data inside a list, so im not going to use the figma design to show, but using the UserListView from the previous commit.
