AggieExperts
============

Abstract: We are building a content manangement system for TAMU faculty to showcase their research and areas of interest. Currently, if a journalist or someone within the institute is trying to find a Professor based on his area of interest, it is not easy. The initial target audience is Professors in the Politicial Science department. Pages will be reviewed and approved by administrators before they go live. Major feature: keyword searches by area of Professor, a consistent UI.


Issues we’re trying to solve:
* Professors work on understanding major political events.
* No useful way to find a Prof.

Flow of events:
* Professor logs in a creates a profile page.
* Search by keywords - keyword suggestions
* Possibly in future: Journalists ask questions (authenticate how?)

Login:
* Integrate with net-id (university auth) - look at APIs
* Authenticate by email for now (pre-approved list)
* Later on: group login (?)

Main page: 
* A little text about what the site is...
* Search: on full-text/keywords/people names
* photograph + name + department + keyword {rotating carousel} OR photograph + name + recent news citations
* Tree background in the spirit of the website

A Form Page / output:
* Picture - BLOB
* Narrative description of expertise - TEXT
* Paper links - TEXT
* Photographs (?)

Contact info:
* Keywords (supplied separately by the Prof) 6 or 7 keywords
* Further links to others profiles
* Notify people to keep language a certain way to prevent them using too-technical terms.

Site-admin:
* Edit profiles of faculty
* Approval (?)

How many people could there be?
* <= 300-400 in the early stages
* <1000

Infrastructure?
* Professor will check
* Initially not public: aggieexperts.tamu.edu
* Public audience - journalists
* Mobile accessible = not our main concern

Bells and whistles:
* Pick up content from Prof. pages.
* But the content may not be the same.
* Reminder (poke faculty to update their page)
* Recent/trending
* Expandable quote ticker thing
* Scroll to the right link
* Next meeting in two weeks
