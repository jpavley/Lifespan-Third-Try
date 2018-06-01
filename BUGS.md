#  Bugs

## Open

- The app can take a very long time to load.
- The plurality of connecting verbs doesn't agree with plural pronouns (they, their)

## Closed
- It looks like there is a space before the users name when is the first substring in an analysis text paragraph. Maybe an artifact of the large bold style. Also paragraph 2nd from last (that starts with pronoun).
- If the user leaves the name field blank on the profile tab then the empty string is used as the user's name in the analysis text and tombstone.
- On the profile tab fields are not saved until the user explicitly exits a field thus field text can be different from the saved text in the profile object when the user jumps to different tab.
- When user dies before the current year analysis can't handle it. 


## Not reproducable
- When activity silder is moved up to 2 from 0 it should set the age to an increase value on the Profile tab. User has to click into another to see the change. This could be replated to B2. Same problem for the year slider.
- The readme tab can take a very long time to load.


