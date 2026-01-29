#  Facebook TAO database architecture API with Ruby on Rails, MongoDB, and Redis!

## Why is TAO API?
If you are creating an Internet server with many tables, such as a hundred tables in a database, you are building it wrong.
If you are creating an Internet server with many tables, such as a hundred tables in a database, you are building it wrong.
We can see the performance of Facebook, which serves billions of users. However, the reason is its philosophy, specifically Dualism, which serves as a perfect foundation. The architecture with two tables is easy to scale with sharding, locations, and indexes.
One of the best Facebook technologies.
Please check the specs: [Facebook TAO](https://research.facebook.com/publications/tao-facebooks-distributed-data-store-for-the-social-graph/)
When we understand TAO, we know why Facebook developed the GraphSQL client.
What we are doing now with Ruby on Rails is primarily for small projects with small user bases.
Think different.
Version 1 will be here soon. But you can check taos_controller and the two models (otao, atao).

## Why is MongoDB
Facebook is using MySQL, which isn't suitable for big data in only one field: data.

## Why is Ruby
Ruby is an object-oriented programming language. We can develop a website fast, but it isn't perfect for performance and real-time functions. But it's acceptable.
I love to build it with Elixir - a functional programming language- in the near future.
A good architecture changes the way we code the good back-end. 
We may not use the Rails API. Using Sinatra may be better.