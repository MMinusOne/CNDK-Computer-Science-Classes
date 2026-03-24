== Cache

A cache is a place of storage of temporary information that get added(*inserted*) and removed (*evicted*) based on certain criteria, the criteria to add information in the cache is called an *insertion policy*, and the word to remove something from the cache is called an *eviction policy*, this mechanism is mainly used for performance reasons, for
#figure()[
  - #strong()[Tiktok example scenario] : #text()[A Tiktok video is stored in the US, and you amongst other Lebanese people watch that video really often on their phones, Tiktok might consider that fact, and decide to insert the video in a cache (the placement of storage) that is closer to Lebanon, that way when people want to go watch that video, it goes and gets that video information from somewhere closer, resulting in faster speeds.
    ]
] <Cache-Example-Scenario>


=== The client-server model

The client server model is made up of two components, the: the client, and the server, and focuses on the relationship and communication that happens between these two components.


==== The client

The client (also the consumer in this relationship), will consume information, this can be for example: you watching Tiktok on your phone, the client is your phone.

==== The server

The server (the producer in this relationship), will produce and send information to the client, in the example of Tiktok, the Tiktok *servers* will send out the video information (title, description, comments, likes, reposts, video buffer, etc...) to your phone.

==== Illustration

#figure(caption: "The client-server model")[
  #image("../../images/client-server-model.png")
]

==== The caching of client-server models

Usually caching in the client-server model is based on geographical location, for this, you can imagine #ref(<Cache-Example-Scenario>, supplement: "tiktok example scenario"), let's first look at the figure #ref(<Cache-Added-On-Client-Server-Model>)

#figure(caption: "Cache added on a standard client-server-model")[
  #image("../../images/cache-client-server-model.png")
] <Cache-Added-On-Client-Server-Model>

Here, the Tiktok system notices that multiple people, close to each other geographically, are watching the same video very frequently, so by nature, to satisfy those people's need for performance, the system decided to implement a cache, so instead of every time having to get the video information from New York, America, the information is gathered from Paris, France, resulting in a shorter response time, naturally data is only needed to be cached once, and is only cached again if it is evicted, so for example, after some amount of time, the system might decide: "There's no one watching this, let me free up space and free it from the cache."

=== In the context of a CPU

We can also apply the idea of a cache inside a CPU, we have said before that a #ref(<Compiled-Process>, supplement: "Compiler") turns normal code into CPU code (more commonly called machine code), this machine code will have to actually *consume* this code to do something meaningful with it, so a execution process without a cache might look like #ref(<CPU-Without-Cache>), but with a cache implemented, might be like #ref(<CPU-With-Cache>), internally.

#grid(
  columns: 2,
  grid.cell()[
    #figure(caption: "CPU without cache")[
      #image("../../images/CPU-Without-Cache.png")
    ]<CPU-Without-Cache>
  ],
  grid.cell()[
    #figure(caption: "CPU with cache")[
      #image("../../images/CPU-With-Cache.png")
    ]<CPU-With-Cache>
  ],
)


==== CPU cache levels

In modern systems, usually CPUs have 3 cache levels, L1 cache, L2 cache and L3 cache, when the CPU can't find information in the L1 cache, it will go to the L2, if it can't find in the L2 it will go to L3, if it's not in the L3 it will go to primary memory, if it's not in primary memory it will go to secondary memory. This is called *propagation*.

In resume, CPU caches improve performance, #underline()[but] add complexity on an existing system.

=== Summary

A cache is an #ref(<Abstractions>, supplement: "Abstraction Layer") that is usually implemented between a producer and a consumer, a sender and a receiver, and emitter and a subscriber, that stores information temporary in a way that can be accessed faster for that consumer, such that there are performance gains.
