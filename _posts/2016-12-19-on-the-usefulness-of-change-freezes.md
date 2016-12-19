---
title: 'On the usefulness of Change Freezes '
layout: post
comments: true
---

I had an old friend post about his work announcing their annual holiday change freeze.   It reminded me about the previous ~7 years of change freezes (and the varying level of success) at my current day job.   As someone who has started out as a typical administrator, change equals a much greater risk of an outage.  An outage that you'd be stuck fixing during that week or two of Christmas break where there's limited staff in the office.  Worst yet, maybe you're getting paged on Christmas eve or Christmas day when you're supposed to be spending time with your family.  This is where the change freeze comes in.  Nothing should be changed in production systems and that means your risk is greatly reduced, right?

That's how it works in theory.  In my experience, here's how it really works:

1.  There's a month-long developer death march leading right up to the change freeze window, trying to get some last big deployment out before the cut off.  It's all hands on deck, and when the thing is deployed, 80% of the staff involved go directly onto holiday.   Of course this big deployment usually has at least one issue, but now you're trying to fix it with whoever is leftover. 
2.  The change freeze window will get repeatedly pushed back due to that big release.
3.  "This is urgent."  "Hotfixes don't count."  Unfortunately you are most likely not calling the shots, and someone is making you push code anyways.  Change freeze or not.
4.  Insane sysadmin scramble to get stuff done now that we aren't being constantly interrupted and there's less people to impact with our changes.  That change freeze was just for code, right???  Yes, I am super guilty of this one.

The reality is, the change freeze just puts unnecessary pressure on everyone to push things out that might not be ready to get pushed out.  The result is that the freeze can actually increase your risk,  whether you realize it or not. 

## Embracing Change

A little over 2 years ago, I had an opportunity to discuss team goals with a senior executive.   They simply had no idea that we had such a contrary objective that had a distinct dollar amount attached to it in the form of a year-end bonus.  The contrary objective was 99.99% uptime.  To our team, this meant increasing redundancy and reliability while limiting change as much as possible.  This new executive had a different idea - **it's ok to fail, but fail fast**.  At the time in our organization, we had gone from monolithic code base to something more resembling SOA or "microservices".   Whatever label you want to put on it, limiting change suddenly meant we were limiting our ability to deliver as a company.  It's almost impossible to deploy at a rapid rate when you're operations team is still running in monolith mode. 

Since then, we'd made a huge number of changes in order to support rapid change.   Along the way, our requirement for change freeze has basically gone away and so has the year-end pressure.

## What Worked For Us

Primarily, the biggest thing for us to break through the change barrier was reliable deployment automation.   Reliable deployment also means reliable rollback.  When releases went bad, it was a simple matter to revert back.   Of course, there's many layers to this onion:

* Reliable deployments and rollbacks
* Centralized logging, so developers can debug without involving an admin
* Automated monitoring for spikes in errors
* Daytime deployments
* Infrastructure as code - now we can rollback our changes too!
* Automated QA testing
* An established trust in our development team

The last point is another critical one.  With an established trust in our developers, we've felt comfortable enough to hand over the ability for senior developers to push code out.  By themselves... to production!   Not that long ago this idea would have terrified me, but now it's quite enjoyable.  The development team no longer has to involve us, and they maintain a certain level of responsbility for their own code.  If it breaks, they can rollback without involving us.  The result is code pushes multiple times per day.  We limit risk by reducing the amount of change, and providing the tools to address any problems that come up.  They have the choice of debugging or rolling back right away.  

By doing this, we've allowed our developers to deliver what they promise in a timely manner.  It reduces stress for both developers and the operations personnel because there's less scheduling guess work involved.  

## YMMV

This year, there's been no discussion about a change freeze.  There's really no need for it.  If a developer has something ready, they can push it out.  If I push an infrastructure change, there's comfort knowing I can roll back with a couple of commands.  Both sides now have a level of transparency that just did not exist before, and there's no finger pointing when things go wrong.  We just try to learn from our mistakes, applying additional monitoring or tests where necessary and move on.

Of course, this is only what worked for us.  The transition from monolithic deployment to what we have now took a very strong core of talented people roughly 8 years to bring into it's current state and there were a lot of hiccups and work that ended up being thrown away along the way.  Not every organization will be able to follow these footsteps, because overall goals are different.   In the end, it was just a website - being down for a couple of minutes is not the end of the world that people thought it would be.  Understanding the true cost of uptime is critical before you put an arbitrary limit on it.   Your developers and operations staff will thank you.


