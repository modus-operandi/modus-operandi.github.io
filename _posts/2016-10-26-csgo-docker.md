---
title: CS:GO in a Docker container
layout: post
comments: true
---

I was around 18 years old when Gooseman released the original Half-Life 1 mod Counter-Strike.  I was actually introduced to it by my younger brother as I mostly had played Quake Arena before that.   I was pretty much instantly hooked and have been playing off and on with long breaks inbetween.  At points I've played each iteration of CS - once it became 1.6, then CS:S, and now CS:GO.  

As an "old" CS:GO player it's challenging to stay at the middle of the pack of player rankings now that I have less time to play and my reflexes are no longer what they used to be but I still enjoy it.  So once I started playing around with docker I knew I would have to end up building a CS:GO server in a container, because why not.

Thinking about it, there's a couple of things that forced my hand when it comes to the container build:

* I wanted to try Apline Linux but apparently there's no library compatibility for steam to run on it yet.  I used CentOS because that's what I am most comfortable with.
* The docker container needs to be lightweight, so it doesn't actually hold any install files.  It will download for a new install or update existing files.
* I didn't care about having this server run out on the internet so I have not added support for a non-anonymous server.  This makes the container only good for LAN play.


Note: If you just want the container code, go [here.](https://github.com/modus-operandi/docker-csgo)

## It puts the app in the container, or it gets the hose again.

The only really interesting gotcha here was the requirement to set the LANG and TERM environment variables.   The install fails without them. 

{% gist 706afdfe381e359d57642777605db888 %}

The real magic is the install script which runs on container startup.  It will download the client and do the actual install.  

{% gist 41790cef99eac1536346e330dc90268f %}

I'm using sed to toggle values in the configuration files.  If you need an authenticated server, that part is what you'd modify (along with the .cfg files themselves).  

## Making it CS:GO.

Here's my sample start script that I use to launch the container.  Toggle values where necessary.

{% gist e2185ce0c2efc4eb7dc07a141296e3f3 %}

## Conclusion

It was a fun experiment and got me fiddling a bit more with Docker.   Now back to whiffing easy AWP shots. 








